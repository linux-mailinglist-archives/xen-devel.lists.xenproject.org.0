Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EE93EA45D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 14:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166289.303648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE9cP-0002k2-PJ; Thu, 12 Aug 2021 12:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166289.303648; Thu, 12 Aug 2021 12:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE9cP-0002hl-MK; Thu, 12 Aug 2021 12:15:29 +0000
Received: by outflank-mailman (input) for mailman id 166289;
 Thu, 12 Aug 2021 12:15:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QHFb=ND=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mE9cN-0002he-Jm
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 12:15:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9a50fcb-fb66-11eb-a17c-12813bfff9fa;
 Thu, 12 Aug 2021 12:15:26 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-8-wxuXNEpkN5-bq8caEemngA-1; Thu, 12 Aug 2021 14:15:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.22; Thu, 12 Aug
 2021 12:15:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 12:15:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0002.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Thu, 12 Aug 2021 12:15:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f9a50fcb-fb66-11eb-a17c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628770525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkf6V7zT4J0SpR+fo+2rTnEN4sEJNLZ5v6v5QNFoTBY=;
	b=RBzfrXNJEbXJ4fH8g65QSs6JmCsAaYmarPpKV2LDWjDy7Pfy/VWWOd4vsDQ8GgJ7+YE7hu
	zn0X8PzZhuFM+JBzLIyVKROrnzQsTD9bkaxn32cl5GkbxWRP6tLuurLAG0aSWRqqJOVUKs
	OuhbK22gpBvlcF+rlFa6xT4GZNiy0/g=
X-MC-Unique: wxuXNEpkN5-bq8caEemngA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8JQ7TlL3je5+rfE93Z5nqaVVo5tv/bo0IUgrU0C2+AhY6l+qmlha8yuSDcuVfHGzagrRAIEWB67iCxSs2Mu+qQ79K2epyOLOPbTPGnbX0O07EVA2jb0YuLv/QXnw0Ep69uDhjM0li6dcIvr8d/c3eRu8K/cRvN3ysHxTyAM1eS0BpdQm2TYWPP6f699c1g4KW0S0EwcT/62yrf5GZGwSWSj2lOFsUYa8+5VdD846LVYQ9IbnEKh2MhUgyLBv0arCufw/KwbvxQV/PAIr+YkDH6PIOhyazhlW22g/aYiLxN6C2VhGbVr3kfGzcNuaPujJw06z/2uozTdV4s4H+HXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkf6V7zT4J0SpR+fo+2rTnEN4sEJNLZ5v6v5QNFoTBY=;
 b=GePx9AggRT3bmYZFWnrXALe8aYBN/hd8cDex9ZtitZ0ZpUTRjrc6k//Qc44KjcpZAbKiswFXb8GSK4MRq7+ER2vCO/w+wUaazSeUZ4Nb29HGm/kOztex07qDTB0Yqzm93Xw+dyrjc9gjpOdJDqDE0fe4MmZqYZz3JcBDAfzGThwumnGq0B6OVc5CWrQN/YCvE0OSFddHFvzl5HWltMojR/JxFO8PuJB0nY4GNEXu2PU5mHs/MI9jT8vkzsino++2+kM4o4KZ/6PgiK8z6jRHypgV4815zCRa0TVoVF1Nc7i7rTWe3/6SKidh5QLnZxKvgqhlPBq9EjMBseIHDj2pug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] xen/bitmap: Don't open code DIV_ROUND_UP()
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210812100225.20037-1-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <870c7889-bade-26cd-2544-0a77e470b42d@suse.com>
Date: Thu, 12 Aug 2021 14:15:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210812100225.20037-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0002.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 210a9e2b-6ad6-4cc0-61c1-08d95d8adbf1
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2959E9396745E356100BA882B3F99@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u1H8nuXXsYlFUITf4/ZiwbqQdQGDmhOEoDk7Q/Qq/0Gfc0cW58BP3WasMaOOUfchCMUJbrV2so+24n+QHYQrgyIqTf3zSaGGecdRpgKXF7oarFfCYao1meM/OS5YWIwpUyLDnU1SaXtzWtz0xDFOOEVDXEXdxcQo60WZP/hXl7/wrasACDVx1ssTXGi34TQQJNGkLLMpY6VgiwNSzffDoRIwf9Y1F7qlK3fkrNkPw7gSQTI4ha3SDONRq9jBXCL+c+20y10ATgmlJZVuw3ZNMMXcO7NqmaMDqNCvbtokd9w42/Tst1OdLcIYyJfRBIgOZIN22RygI+wBemOFNVWsp0hjNx7gM99bpxV9MfmnHWzpqaT0A/hRvuX1R6gPDFoBrkpnRkCTfTcVCPiS1HRQyL3O6y71OJvdCiDvt3XnkdiX1ZCP+Nh0wYNBvE7I3TuONVoG8+U+6nbkxr1LA+91dxUVRXc9XVJU+KiVhh8yNpUQVY5O15LjxE1acnjjuMMIOJO1/gU1yIA1PF9MElR4OroGJBEl+RI7cpLOy7SpYbht0QneP7e3bfwW9a6AZwZ33bbxNKB064MUrmCirR2Z57MLTA22VCvbCmAOKbYaY+Jnm1ELTbNGEUjaRVcM2UVZy3OfbvJjusOW26+2yNJ1aVJbGSyrzS/L6UlZx9JvP75ebV+zMnsvDsFf2i0RJFTyTbYFMYIEPPne5j3hhrDRUc3VdMGukGvWDogp6iDSnIE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(508600001)(8676002)(31696002)(2616005)(6916009)(186003)(66946007)(36756003)(38100700002)(31686004)(316002)(5660300002)(4326008)(6486002)(86362001)(8936002)(66476007)(2906002)(53546011)(54906003)(66556008)(26005)(16576012)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjUvc1hNUUY1djdZSFlGdS9OMXZVNVhlQ3l4YkRqUnJBUUxtc3djODUyRVcr?=
 =?utf-8?B?eGsvcFViaXJRTFlzakduSEc5U3BlemVDUXQ5Tk13Z1ZXWVQrNXppMEdxMExX?=
 =?utf-8?B?MmdlYXo5UGU3SEhoYlhzc2FlUXpEUDN3TDFLSU44eW5ZMnE2WVU2R2dUeXVj?=
 =?utf-8?B?OFVKUkhqYlVwdGcxeGpCZ2VJZ3ozSkZqVTJnUThCSzdkeHZTQ2dTSGZ4OGdo?=
 =?utf-8?B?dkF2OFhBcWJBdlptSGhJMXVTcE5MM0o4RWcxekw2TllWakkrQVBtWVE5V0Vy?=
 =?utf-8?B?blhFajgxMy85WmI2N1U5RjVZU2VWM0djU0thTTdzR25qT1Evem9YcklwckRP?=
 =?utf-8?B?ZExkVHJKcE1mcG1lR0d2NFdtT2YvanY1ajhJcnZHQm1GVmZLVVdwR3hRTnFn?=
 =?utf-8?B?bFNteURjYVNIY0VkU3dNcXcrT2RnMzlNemxQN2EzbXozWW1iQjR1SmVrcGFJ?=
 =?utf-8?B?YWxhTkhmVzIrL1RKZCtqbEc1QUg0QTZOWkFuL1FuR0lyZUc0QnlIOXlKWDlJ?=
 =?utf-8?B?aXErUlI5MEt5SGpQNkdEL3I5bzVRMWp0T1JmUllrdHMxcTJhc3NCb1ZDVmww?=
 =?utf-8?B?eEJ6WUFjbktJNDlUdnhlYWhnTDFKdm1RUytxV1AwSmtDSWZsWFVTNlljSUZH?=
 =?utf-8?B?T25NS0EyTFd1OThkVjBVSy9LNW1SS2M4bW8wUlVPSnJzRUNjNm0rQ3F2UmU0?=
 =?utf-8?B?UmNJclRPL0MxT3hkRyt3Q2VvM1VSZWZ6dFBSMWdLSGhNQW0zdG1yUWs3VmRY?=
 =?utf-8?B?UTVNU01GWW9vMkEvbFZmNDdFVkJnMG9sOS8zaWJzSHo3a1dMTFYxN2FPV3RD?=
 =?utf-8?B?MitMZUxSaklxY2c1Z2UvQnQzVjdEejFNZTdIQ2tmVTRCaitaUmJDZlB4Z2dr?=
 =?utf-8?B?SCtQdG02SGQ5blBMRy9HdzNoQzUwY01BcURxeHRyRVJPdkdIYnVpa1h1SlNK?=
 =?utf-8?B?bTFLMHJQaTZhRkFvSkRQczBqSEhGOCtCcTFzLzhGNll1UzVacGxhWFp4R0ZJ?=
 =?utf-8?B?UWNtWFRZVTJlbllqT1g3aXdHZDJHdkVvUXlReVd5VVRwYmRQdGVkTHJNYldv?=
 =?utf-8?B?a1FjU1lpS0tQQ3pmWFdRZERRWklLb1plWURFdHNyL3AzN2RtcUMzdTl1V1Vu?=
 =?utf-8?B?SFM0a2IrcWU5eldRNDRQTjUzMTVQa3JSbWtsYWJRSExaUkFwQ2JMWFVXZnho?=
 =?utf-8?B?cHo4ak5LUHB5RE0xWG9aNW91NFpvWmdxVkVsUGNYdmxvRXllNWlaZ3VqTE9H?=
 =?utf-8?B?OEdrMGpPRnRuOEdkNjBGTVhIT25SbWxiU1RFNmg1MkcxdG1LazVwN25mdEVI?=
 =?utf-8?B?R0JUKzJoOU1KenJUc2YzWE1BZU5ONzNOUDd6ZStBTmlkTmJMVnVCMFg4TU5Q?=
 =?utf-8?B?S042VFhCZ0hIaThkR0QzUWdKU0JlWGFwblFIaGxYa0JUWW5GdHEvNmlReWRu?=
 =?utf-8?B?NzU0WHp5b01sR2o0QzBJMU9oVUp2dDRMaldSMUtNRmhwNHBGd0IzVUlaSVc5?=
 =?utf-8?B?SFNTSEM1UFVEVW0raEVHQTNjN292alpkcjU1TTNkZHNPYTAxV2RHdWtHVEpV?=
 =?utf-8?B?RDI4dXFsNXBKUmtHam8wWFExN0M5ODNlc3pVNGdseERub1dBd2JySUFvbUxU?=
 =?utf-8?B?WkdCVWlNSnZiZUZaT0tVTkNhSHB3dEFEa2xseS9mc3l2LzlxT3BudUtIVDBa?=
 =?utf-8?B?YlhYRFJnLzZoOG9GeHZKMU1qU3ZRK2tJNnlyc0swRFA4cHA5UkF2K2FkR2Rs?=
 =?utf-8?Q?D1020mkbHwbaQq4Sc5kmxl0+HtPDRO1lcnBfna/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210a9e2b-6ad6-4cc0-61c1-08d95d8adbf1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 12:15:22.7474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhQ0lHhJ7mf/2H48Am5N2Gzg4HPPDu/HyboCmeLsYYxov0wcGpM+lrs+UWypeHBE6ug1SbKwXzKeD2ynrHJSSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

On 12.08.2021 12:02, Jane Malalane wrote:
> Also, change bitmap_long_to_byte() and bitmap_byte_to_long() to take
> 'unsigned int' instead of 'int' number of bits, to match the type of
> their callers.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


