Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690F24B6CD2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 13:59:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273155.468236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxQ6-0001BJ-E4; Tue, 15 Feb 2022 12:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273155.468236; Tue, 15 Feb 2022 12:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxQ6-00018T-9T; Tue, 15 Feb 2022 12:59:02 +0000
Received: by outflank-mailman (input) for mailman id 273155;
 Tue, 15 Feb 2022 12:59:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJxQ4-00018L-Au
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 12:59:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a8f77f1-8e5f-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 13:58:59 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-DnuWeuIAOH-BCpdWZ5CS3w-1; Tue, 15 Feb 2022 13:58:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7422.eurprd04.prod.outlook.com (2603:10a6:800:1af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 12:58:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 12:58:56 +0000
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
X-Inumbo-ID: 0a8f77f1-8e5f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644929939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLA0klsYTsXa2vmsfpAANZAbvcx4dXmZfiwpT0pkI+w=;
	b=HFzKdDEU0PDKv585FeL/YzdQz9u2BpC+DrxBqU2xKwaIp1rLeOa0/e8XOP3rmJEr1Q++4h
	Pp1u25W9feStfGWSWXOXVksgMMyoEbkwINZLHX07TdaVt6kQkTPvEZov7NckZIX5sWYct2
	5GWTTpC2M8puTfx0uPNit+8cpeaT08A=
X-MC-Unique: DnuWeuIAOH-BCpdWZ5CS3w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nal3DJCPPIEM+z2u/wcxlAyxcJ820JKeJxrx6wGixn5xMqYdSQbC0EWu8wXMAlBQwwn4yTKwnQOFIg+/DfGat7WsHG2YBHx76fpCWR1JZzk06VHgodMMGe/mlobjTZreTe+zV3Tvaro3HM6jCwuKy3rTeP7pFJqR2NqeAimKxy5pjyUW3ob3tUldrAxAmM/4kcUBrL2Md4UpCG+Apcltj8LXVDxbhXemQAbO6m2iqaNwWjhOeoUEPXGx9nlrHEBNXU4y0gC84YCGcmB+zIwke/Ezpu6xwVNvhE/KLjFVFs1h4KgHxco+k7SqDHs4rQBuIVxrLhyZyil17Pz0TvA7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLA0klsYTsXa2vmsfpAANZAbvcx4dXmZfiwpT0pkI+w=;
 b=Q4TRbKmqCWAzO6xb4hCwWFqcOjZKMt1BmCTisfx+kTBv51a0tDgEvz4IF8cVk4Ro4IZGr/bCAntEqWIy2BOroGUbgOPjaxGAl4/7CflShs3OY4sRU9vxEco4jJrij+VVFf+kXYv6X+wC5E319JmVKfL0TO3ZBX1Kbvxdv07aBLt5uZpUvQfbrbfc9Wtact+OokrjB3/bjtfX92BHXfRX+eXCAv6K+YWQ/AAZKW9OlukVj05kHnnQFH1FykHJTWcKgwfHnoWUOql0z8K4Fcg7j/1lU5TQ3DKwxxcnMrOoxus0wNCACJB9wfvVGxLPXnhGH7TFzYG4lHF3Ly3PRzWabQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30a2c373-1ed0-bd27-f264-5b26aa55e286@suse.com>
Date: Tue, 15 Feb 2022 13:58:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220215081135.1497470-1-andr2000@gmail.com>
 <YguE7RWOteSnvVNY@Air-de-Roger>
 <c5b9b02c-93f8-d018-6048-9abf2e7de4dc@epam.com>
 <YguQ8wfhfYFXTWSU@Air-de-Roger>
 <70dbd7fd-3f74-d0d3-6e30-c1e1e24fc279@epam.com>
 <0d8f01b2-b015-a08e-dd49-e9c688ff7245@suse.com>
 <bbb36ebc-de66-297d-f82f-abc0e63f20a2@epam.com>
 <34832b7b-c1c0-06e9-9214-6c434cfb1282@suse.com>
 <9f4e7308-6ede-302d-35c1-6fa824df69bd@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9f4e7308-6ede-302d-35c1-6fa824df69bd@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0193.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d60c3efc-1458-46e5-677e-08d9f082ecf2
X-MS-TrafficTypeDiagnostic: VE1PR04MB7422:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7422A096A6841856C7BA5375B3349@VE1PR04MB7422.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KiqrD9VBl0hL8mhg5MWBhAFXupoN3Tk+weAHHUdKK3rxY5V64cvGVevrFPGyFOqkj8upDOdH1qtECDDE8h6MGT0Xk6BPbGgJIrthYpGgetomhE/A0O2TpuKYsmdLI+DDJYExV4Yg83OflRleM+ygYyNQKOmSOOnREPQmEN4ZX7RKnX5CBdIxYtjo11yN8I0b2xQCUhGbTQZvtJ9kmqIdTY3ANBjiZH6xdniDxF8uOkwE+IqZou7aF74CFnyVNdOXePy2c77EX5XNFt5LFEa5tYbig+YgVCNUCbYt7jOhHJ2nU3zz4kN8TVbs+N7d7YyJNEmgQwUJ9OeIEzPTuH9df65felBsTAF+IpSxLQVVeFrQo7x47BD5EIJanBpSPPESZt1WUS8/gQ0IpBwjQLo5LrVfLsTo1ZRNf4vFkaP6wUstjPdqLTh/8ccxVow9h2Erynjvx2XFMeyv596iBTDGBq33J0T5fDb+O+K2CA6q8N2zHMhrexRBp49oPNj1wTqvYU4oIwayoCN0kinqCY1REWHE2CveEIh/S6g+m4RfiEPq7ny4wexae8bqsUK1K9Ld3t/kvcDXuPnNaxwKxkv6ySyF8uk7NzneWEZIt851ek+9zv6zrY/BVtv3J3XbvVY+KHLihpsvPCnQ4DLIGw/nSZmpWgC8ruJ/a8odU5ms13sskO7IR3hmbDH233C3QK2co4I6dEtU9o12hAaUCeiBNpetfonS/pTT4AKHE96mmyNWpQN7BSc9xwpmkksPVud2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(86362001)(66476007)(66946007)(2906002)(4326008)(8676002)(83380400001)(8936002)(7416002)(2616005)(5660300002)(53546011)(6506007)(6512007)(6666004)(31696002)(4744005)(36756003)(54906003)(186003)(508600001)(38100700002)(316002)(26005)(6486002)(31686004)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHB1em5FYzNGZkpIR0JZdWdoWUoxZ1ZPcXFJSXpqakhjUTEyMXFvWjVMaFBj?=
 =?utf-8?B?M2hJRHhjQjd1eTJZUE1oNWpRcUpXa1Nrb0ZVZFRQRDdEZVFoR3FaRmVFeE9s?=
 =?utf-8?B?N0FFMkk1b3V6dCtuRHdod1hDa1NSQUkvNUk3S0JabTNzbHY5QU9OMmlxS3RV?=
 =?utf-8?B?WlJ5QlorYUdvZ0NKSHM4ZjZST1k1aXNHR2c0SFNhQWU5TGdNaFhSRXJWa1A3?=
 =?utf-8?B?enFHeVdWR3gvQUo3ZnpiektmZXFjQkNZaUxJbUlrYkFVaEo2anB2T1pKWTlN?=
 =?utf-8?B?UjZRVjMrWVRhRUtRMWJjMXB0Q2VBdTAvUVJBb0doRGtaV2Y3V2hjc3c1N1V6?=
 =?utf-8?B?RThLWmVkUmdENEdYejN2aU43RHZabUhGNktYYTN1WDg4dG5qNjJHU1pRd0VI?=
 =?utf-8?B?eUVyWkN2NU4vQ1VyLzRmNXovRFJxeWJ2VFhmWFFJUmZXY2h6alRpUytDOXRZ?=
 =?utf-8?B?eklLUVEzRTNPWlJDUlVNWS85WEpaSzl4RERQWDlzY3A2RTgzTFpHNVBiZWVM?=
 =?utf-8?B?MVo0S1UzY2R2N3NTTVkyTFJyQlgxNDdhNzlsb1hTUWZ2Mnp5L2RaMkczUHcx?=
 =?utf-8?B?T1VCRUk4TzcyeVo1YWNGS1hxc3pCaHJ4N2tNS2hhUUdtQk01NXordzdoS1Jp?=
 =?utf-8?B?UXFKbFRwNmVYYU1qVkptaW12M0c4bXIzUHpuaDdlaHdrK2VYT2Y3VnZYMmFG?=
 =?utf-8?B?TENhb1VsaG5pUzBxcFZmWlpITnlZVXFBb3ZTT3Q5b1B5bTNpSzJId3dPRTNU?=
 =?utf-8?B?aFBlbHpKQTFHelJHRGdVUEtmNThXZGxFTmhwRXhoekNIOUgyYWlMMlZLdUNQ?=
 =?utf-8?B?d2hUckYrYWp4STgzdWVJYlkrM0ZnQnFOUEZBOFYyN05lbnZ4ekVEcExoNlNQ?=
 =?utf-8?B?RDk3NmkzWTNQaTRXd3J4QWlLNkFOT1dtZXpWUTdBV1NZcC92Z3NCV2NQZWl5?=
 =?utf-8?B?V2UwQ1lBRmFsZzdvaVJaNWptSHFOVmVjU1pwcnA4OGxzL2tZdHVGZEtHRWxY?=
 =?utf-8?B?b1gyM3hSaksrNUU3dk0wN3I3Y2xWUTJlOTlVN3JBem5kZmFtRU02aDNaMlUx?=
 =?utf-8?B?UXc1QVpsNFF6SHMyTFRCOVRKYjhnVUxuZXhvZTF4TGFwcDExM2l5eDRpZ1VP?=
 =?utf-8?B?YkdwYVpIYkl0WEhnMDEzdmNuRVBSZ05LOXJvNUNERitxQmFQRkQxVXJyQ3Ns?=
 =?utf-8?B?MncrbEVha1E3R09pMVNWSEVaUWxjVXF3VklaQ2xGUzd1aXpkdXRKbkkvdGls?=
 =?utf-8?B?RVpYVHJMaWI0Nzc2MEx5dk1NbWJ5bzNIQkpNNlVRSkxrTDVxelh3R2E2aU42?=
 =?utf-8?B?dTljRlRxVDE4UVJkdHg3eHN3UmQyNXlqZW5hc1ZxZFBhS09TSDJHZWRJbUp6?=
 =?utf-8?B?S2lIUGk5aWc0UFRleUxvVE5KME5zRHdid3RSWm5NWTlOUWpoMldKa3RFWEph?=
 =?utf-8?B?ZTN5S0pxRFJrcmpHZW1FSXRqUHNyNVdoQ2lOUjdiYWpaL1plakVDMU16VzNS?=
 =?utf-8?B?VnAwRnBjRUV6aCtBSE4wWlRHbFI3LzhMdFNRWmd0TE0yRndpN2lFOXI2WEtX?=
 =?utf-8?B?SE5Pa1ordUEvcjVvWmdKM2xoMTlKczBSVURmVTNyd2Q4VjBaWnhpcCsvL2pl?=
 =?utf-8?B?WEhYaXVoditYQnlUeG5XcFRXRnAxZXdHcGRsNWRnbDZTQjlSYkVlWEJkbDhM?=
 =?utf-8?B?OTZJUXVxT2NTM1JKaDdmK0kyNUdpM3hJampFUjJxcnNMZXNzZitFbWEvTytH?=
 =?utf-8?B?eVM5NXdCSW03aFVYVW1icUtJd3QzcVc4aGdOU1l1WStDSE8zbGsxakVHeXpJ?=
 =?utf-8?B?ZEViNWlKcFQ3eHZJUG5oQzNCMm56TlZBbzdLSHpTdmhZYi85eVVYZ1F3Zk5j?=
 =?utf-8?B?OW5GVktINDE2WXZPN0xubG1uQXpVTnhkcFg3VmJtaTE5b0svTTQzQUlZSkdy?=
 =?utf-8?B?d3l2VFF3MUZ4NzhKcTBwNm5WS3luRWpuNndEOURGcUNHRC9BQkd0Z1BYZ2Zo?=
 =?utf-8?B?Z1FkelhmT3lESDBlb2dwajBuWXAydDlSYThxSTFsdFBoSjFtK1pvQzdFMmFO?=
 =?utf-8?B?NkVPUVYvVUsveXRnQWdPMUk3aEtua0laRVhGTEp3eWovM2UweTVlaEtnYi96?=
 =?utf-8?B?WGU1bTJCKytScWpaTjdBODhEbzRWdEJzcnZMaERXRTRTZTJmaUVGVlluOUVj?=
 =?utf-8?Q?vEat471hGpZJGF6ONoyc9jw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60c3efc-1458-46e5-677e-08d9f082ecf2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 12:58:56.3234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEsq4hiaYEZFoXUsf4kV5beRAWd/b2PMNdywV52mIzeTY560ZTtnAcBt83ZL/S2W97PXcAQBXcgjW0Iq6LV2IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7422

On 15.02.2022 13:56, Oleksandr Andrushchenko wrote:
> On 15.02.22 14:49, Jan Beulich wrote:
>> On 15.02.2022 12:54, Oleksandr Andrushchenko wrote:
>>> On 15.02.22 13:50, Jan Beulich wrote:
>>>> On 15.02.2022 12:45, Oleksandr Andrushchenko wrote:
>>>>> I'm on your side, I just want to hear that we all agree pcidevs
>>>>> needs to be converted into rwlock according with the plan you
>>>>> suggested and at least now it seems to be an acceptable solution.
>>>> I'd like to express worries though about the conversion of this
>>>> recursive lock into an r/w one.
>>> Could you please elaborate more on this?
>> Not sure what to say beyond the obvious:
> I thought you have something specific in your mind that worries
> you and you can tell what it is. Thus the qustion

Well, the "specific" thing I had in mind was: You'll need to prove
correctness, and we'll need to understand the proof.

Jan


