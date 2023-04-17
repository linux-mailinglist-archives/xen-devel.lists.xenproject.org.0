Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 258C76E4289
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 10:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521838.810767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poK9c-0007HD-Um; Mon, 17 Apr 2023 08:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521838.810767; Mon, 17 Apr 2023 08:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poK9c-0007EY-Rj; Mon, 17 Apr 2023 08:24:04 +0000
Received: by outflank-mailman (input) for mailman id 521838;
 Mon, 17 Apr 2023 08:24:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poK9b-0007ES-UM
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 08:24:03 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35ac0ff7-dcf9-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 10:24:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 08:24:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 08:24:01 +0000
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
X-Inumbo-ID: 35ac0ff7-dcf9-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dxo8CePUE0FiE1pO6ZD7el4ktm2fYiIy6jVrp3h1t+MhnIpQO0G9XdItx6pj0J0hKMmmfdMEefcZICeQsUdkrdNgk4jHmrK53ZWOLHg3gRNNKem0ydtucVaWFZVf09d0xgNN3WvmGSC+eDilhzYdODsAPMiVP4o2SN92RYcZUDP1rTKmfFtwbX8geXz7Y/eb1duAxbsbn6gHmkTbYuH1FClSSb5nNyLSvzsw5Gyq/b3kCZrGKf/VMDzAml/z5pag6UINPekFQNw91+/urqfb8U/8Br7bn/CGwdIa/kET/yP0U8K6MKK9C6NCKnGjv+Gua//L7cZ0llCQGHERHzGYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAfTZEBWkEqLVMBcODrgy7v/NgE7ZshQhgeO1XRx2Z4=;
 b=HFkRE1uaCAYcOcidCBBK/WED0X7XEZI1rWcUrRbBnCMyDhSCsUriCU3sPB+DFSi7nHATYKkQCFLxhNBlZSVmAd/pkaOvOeDoma5bkAUWWoVDay4CdZSZ2xck4i5eIHv/MqV++2ycLXlFyzhNu1pLidl+dkSJMCccDfHeDBgWb+BhDv4arSxlikV87+jgxVplABnsNKMTL6sH6Pazwd1Ys7w10rYOOlMJWEN0V3nUBda6O8TSGU8bwnNgrx7uEB3RAsVcgsJWOOG5Q6v8MFMIWTNE194rbXgSTe9sBD5JstrrajYGMrm2EVoY4qfqHAclAHmszwiR6OGxBTAqQIhRpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAfTZEBWkEqLVMBcODrgy7v/NgE7ZshQhgeO1XRx2Z4=;
 b=xduZ5NmFVzKg3SyN5DpjFgXY/BKxyRUD7JL9fG4esFFE/W2DUG/W9JoVoPKNhRi7nrH4F7IV4jHuNbEKdNTrUuuxlvkJkX/BMiMLzyQx4/vSdcRc3S/pcSaRnD/hJJzTvfseBwZMnO0egEtWaGwLNIk67adGvfEJkCft+cpnzAWosGuBtXhm6WdtM9ha+xuhPgd6LkgyBZ/2LI0jCp018ilnNbQjEMTymvXbl1CjG8I4jgcXUaVdDf9DEsU4jV7NmibkTsV2jp0cKUWEG7Vna2FCUx4ZmjtC9z8BUhi+2P9HQMOVxh5CYpB0wIgBRWF1XyTpmie3XAuwiOwPgm7EtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <92e6ea3e-a381-a77e-f909-bf65d009647f@suse.com>
Date: Mon, 17 Apr 2023 10:23:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: HEADS UP: re-adding the armhf boxes to osstest
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <ZDkmu0mgy23ypaL7@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZDkmu0mgy23ypaL7@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc46b4d-7840-4084-55e7-08db3f1d18fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kJDAbovsP0FhGtlJuDqb9IFZqKIkdycBnSLIwswFCExZAJ85yTsUgMDbh3aZSfL94c21IfwyHgUVs2XND8u/0yjcxieqmDLYSPoBNV7l4Sp+wM37NgwJMJ9sbFVcRh4HjsQ8eS0cZVvsYoyyJAMCnGHVYM2453QCDO03ZimvKTsUB2JKqwpw4Wd3RACGaw3uEJBm9ViGnnyQiz658YU5S7i0PMl0Y2BOGng/EvsSv7LsWFgn9Ztfuw2JCx2bD+Ls2cR0P78DzxYOvR9deQyrcoojif2PoKJ9FYmn6POR8eFIaIWyEgsT//XK3satR/bphUgRc7OTyTZt5zYxgkgF1h7EYOwGsgrRJf9g3Q44m6Xstdom+9lYp9yJzldtJ2a/Y1FiR56/n5vNXpbIrZYQcLh7FW30dhSSE6Q7WEdAJRKiKyITgiu6XZC0qd8gRZyOGMwhKJ3tw9l5xqVaw9AjCo4HZlb2O6wYEJA68fAIscOBkI5480NFVnmB9r9xRhgLkuodBkfGxask0E2HQBgcewphDC/n0m2QcXRMqP0I6V0o6PuoDO3GMaE8qZp2EyCeTTVpKHWPhqzeQCXtcbA4Cfpd8WEntTpZNJxEJF4x2Z3JkPSdDFZWl0f5Qnyml7pH4xK7kh6Gr878lZf3o1Dlkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(136003)(346002)(39850400004)(451199021)(36756003)(6916009)(4326008)(316002)(66556008)(66946007)(66476007)(6486002)(478600001)(5660300002)(8936002)(8676002)(41300700001)(4744005)(2906002)(86362001)(31696002)(38100700002)(2616005)(26005)(6512007)(6506007)(186003)(53546011)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3V6TnJqMDVXa1duaWJNcHl0QlAwZFdDUWc5aVYzVDY2WTJERlpWem1ZUW9m?=
 =?utf-8?B?cE5TMmdpVHJXSUNEZE5WUnZ4eXpndnRHNnF3c01BNkdYQlIzek56Q3hTME9p?=
 =?utf-8?B?YUJKK3pZZ2Rpck5BcFRVaElrZFZ3MDF0K01CcnAzK2U2a1ZhUUk4UGN4SlFJ?=
 =?utf-8?B?Q2ZmNEYzUnRsajNwQWJlMzRoMTU0MHh4R2NRM096d1pCelRlYzBhaW0xSVBG?=
 =?utf-8?B?dEJYNHk0Tk16d2U5czBjb3lQVG8wVEFCOXRFQWlaYnVNYWVwbmt4clhKcGps?=
 =?utf-8?B?ZEprZGxQVDVhTFM0dC9LNm1VUUc1WGNEbS9CbXNBa2lOVkNuN0V6c0NDcmxB?=
 =?utf-8?B?Mk5KdEs4dXNlOWVhQ01aR1FzUTNyVWVhZ1B1dzNaK2NhdkFZZ2tlQWlSaGpX?=
 =?utf-8?B?YU9CRkdwNzVEdVBxRk95NGE2bk5LdGljcXVERWpXRldiZWNHUWJ4TlhpTFdM?=
 =?utf-8?B?SU1IY2lOSEpEd1NsSWtMcnJ4U0U3UVVOYjRsSHcwbzdTeXNJL2p6bVpSM09B?=
 =?utf-8?B?STQ3bFFDemtady9oUU9PZG1qUlNFQ1RsREZ3eEQ3OW1TdXF0b1lWMHdpaTBz?=
 =?utf-8?B?WFoyeFc0ZDMxS2R4Y2Z4dGRoQy8xUnAvZEFkM3RWMjhSQ3NoTUNMM0NubTho?=
 =?utf-8?B?Uk43NVlpN2FyYWl0OExuOEtrTzNWclN3Z1NuZURNNC9sS3F5VkZ1UE1wbjQy?=
 =?utf-8?B?MVZFaXZQaWV2VUwwekdyNE1wcUYrdDk0RVhuRlV6TEMvUDhaaFU0UkFvVk9w?=
 =?utf-8?B?ajN6MjF2RDJJaGcrMzdLTElna1JRY2UyMU92SW9yanZGWm1zemthR0pURytm?=
 =?utf-8?B?VUhoMnh2UThsNHczU1pwZXdzaWVnY3lIK29rZTJQTDRyNXJiL09rQnAxVkpn?=
 =?utf-8?B?emExWThnM3VlNy9VcGtmSFUvVnlHQklqdUo0VTBWUzFhVU9BdFhOZnBmVlJH?=
 =?utf-8?B?S0ZjVGFWZ3VPbXpuck1GbkxHOFRVRWVwREg1TDdnbzU3VU9adkFySC95NnJz?=
 =?utf-8?B?TStRVlRjMjlMM1FiNjJZZXJHdmFCZkk5TXFLWTN3eVQzU2F5MGM4aExXTGpF?=
 =?utf-8?B?RmYrNDAwbzMyNVJBNzJETlVybXo4M3dvZ041SzhDOGhLZENWMHluc3RSeFYv?=
 =?utf-8?B?bjYzZzJnSlpVdjhYK0FBaVowaDZ6bGEzdmVnb2tqZGVrTzBZb3JQTnNPWGJy?=
 =?utf-8?B?eDZSUzNEbmplRkI3M0JZbHM5TnVBOW8rbmM3Vi9XL1AweFJIMVE3bFpnOWwr?=
 =?utf-8?B?V0Z4ekszQkFSRmxGZUFGWHNaQVQzWWc4NXhsKzNEdEkzUEZma3FHVnJGUkJm?=
 =?utf-8?B?dEVOcnpxN2FDT1FkYXVET0VzekFlTm1KbDZoZnl6NVgveWxzc3Aydmx3ZzYw?=
 =?utf-8?B?OTRGZGJQa2NobVUwS3M5dU1EWTZaVnY0SW5Bei9HcTB3Z1ZyazBZUWpVb3BD?=
 =?utf-8?B?dk1vYXpHU1dJWnkrQTluSXhRS0xvZG40ZHVDb3BScURiMVpyK1FxSHFTVXps?=
 =?utf-8?B?MUI1Q2xQKzdCVnZYbjlTRXA0UVVUN3lLc1kyaGpTaE1kVzQvZnhwdmVWbE9h?=
 =?utf-8?B?MWYzZXVQdUE2dTRmM3dqSE01T0duVmZvcVZ1YTFPd1lCQ1lpWE0yWWNRTjFi?=
 =?utf-8?B?SmRnMDNLdDhGdmJrdjhyQUFLUjIyRm9HTkM3R21MNEVQU2JDZlY0cGl0VWp3?=
 =?utf-8?B?RVpHYXBDUStJMDRaMlJEYS9ldDBUSWkram53cHFLNzZFVks3RjBBQ3FGSkdm?=
 =?utf-8?B?dEVBK2xBUFVkMXFXc0xSamw2TkRhdldUTzVPWWNQU255R3hJbjV2QXFhSWFn?=
 =?utf-8?B?SmtQYnBRVmthREdaa08xc1pVL3liVVh1WENlcVhhSmVtUVlhR25ISHY2Uy96?=
 =?utf-8?B?bDZIWVB0UFlLSW1ZbmJXNm1NeFgyK3dqajRFbHMzcUpNRWVyQUlWcFRLN2Vr?=
 =?utf-8?B?VmRSR1JpU3A3T2lybkpwazAzVnltY2s0T2srRW5lZXkvUzB2cVJCWGJiUXZK?=
 =?utf-8?B?Mk5vZmw2bEdGWk9kZXlWSHY3RXEvRThuaGRaaFRGZXp0RmpQaDRpM0VQVXZm?=
 =?utf-8?B?c3RuTFJlYmM2ZVBHZkliOUxnV1l4QTg2eXBqK2VqdHR2V1JNcmFwbEpTYU80?=
 =?utf-8?Q?MwFyZ0nJKVI9vppCkkquZPGMK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc46b4d-7840-4084-55e7-08db3f1d18fb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 08:24:01.0784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vU7KkwKeb7/rTT6SIKU12dmVSE44dsMONqzmNhMWdjKpmuaLzPfl4VAJd2kcV/u2XbrfPXzTLq80pH9iVkgXHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966

On 14.04.2023 12:11, Roger Pau Monné wrote:
> We finally had the broken PDU replaced in the osstest colo, and the
> armhf boxes are operational again (those are the arndales and the
> cubietrucks).
> 
> I've run some ad-hoc tests on them and they look fine. I plan to bless
> them before the end of the day.
> 
> As usual, keep and eye on any failures that could be caused by the
> newly added boxes.

Sadly recent flights look to be reporting them as broken again.

Jan

