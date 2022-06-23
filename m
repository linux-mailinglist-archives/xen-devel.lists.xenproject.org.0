Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC44557D13
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 15:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355019.582445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Mwn-000840-IS; Thu, 23 Jun 2022 13:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355019.582445; Thu, 23 Jun 2022 13:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Mwn-00081a-F3; Thu, 23 Jun 2022 13:32:37 +0000
Received: by outflank-mailman (input) for mailman id 355019;
 Thu, 23 Jun 2022 13:32:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4Mwm-00081U-3H
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 13:32:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0ce5754-f2f8-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 15:32:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2264.eurprd04.prod.outlook.com (2603:10a6:4:47::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 13:32:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 13:32:32 +0000
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
X-Inumbo-ID: f0ce5754-f2f8-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gw31uuVqSIigN3Vx5HdEne+/v9ftwAFgOnDuvCfE/YRkPY5T4eEUAdI+AptPfxmIkjSDfeht4jCqdLlQuPNwQPeFe2AuUmnGtQTev7hIbRe3QmsSuHJJG5dudVI+iukqlaamqOFDpMvY1VWIkUZcZdJUuZkwXGdJWRp7SQqSzD5yzRwWSSCmCPkWTmFQ1xaHRwo9KIR8DKlhTRJg67tT/oh3UhsjHkW19awwFdg0K9bkFAHm/IgChdj/7pxC4sNTsQWEWn60hhsyBWTmq0YH7jUQS0GKGtqMs2OT+o9MNhNeXAs1eBkC2C+qTlxsrKxqBHdlzZr5CCtXTSInqnhGNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKjjLu2Qwv3e3QqBI/PAls+gwgdA0UjMM9ENhhj391g=;
 b=A1dGVBKq5PNUyK7VHQlPOxA5Jq8vx8DY8Tq7/FY/j32n3FelOJBHpdHk6RyLsWH6Y22iBeotx3Yave/3px/XuGIbgIwtMNXAO6ztQFDoRV7lEUZiBcKx6Y2JQtfGp1SATmS01PZDMSCEknbZhrBPuyvFSph15qsHyrB91arRpLvgS5Yg03RWweQzGsptXSwYbLbd3K6t0ebznHwvp3cv4obe1+7C2Fc1Ta87i0Ysp97+r/Uah4xo4Bo3OXLSC51BJBOQalEMjxeBFklljpGO/YMm/teXzDXuMD5Z5er7drquxrZ6Mskq0bNXEO57BTCWTW9weNckKFsuYWXYx6D9Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKjjLu2Qwv3e3QqBI/PAls+gwgdA0UjMM9ENhhj391g=;
 b=1h8J0Z7oLV4GkNTER4NjTrNym7okLAZhnTT1RYJcg/cwpdpEegPhTOLL6ev4yaj04+UgRGq91xzk1vO5JqedC1T8dRQTHUe63OzlDIrm4fwFhPa3hw/p+5FIO949uLiz6oXpFwQDPQxWFIrL5H22xb9w47HZU7z/3Y9kD5qZ9jOhFkkP4DtCDj4pFoqjRJq0oPT+0WKlIdeub78cUX52AYlqPXgVEkaMkzemsw+KzB+mmq0K2e3XgX7r0vkks7RzKzs86ZWFeyd1yseZGyuo4fKpoJxpUQLhymzgZRxG6Gk5Y2TcPGABflnsxHHCG+gIzAUeHoHPtmtTNngk7KZo4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e45d8dcf-fd0a-6875-a887-5c0dafcc4543@suse.com>
Date: Thu, 23 Jun 2022 15:32:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] console/serial: bump buffer from 16K to 32K
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220623090852.29622-1-roger.pau@citrix.com>
 <20220623090852.29622-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220623090852.29622-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0003.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 444c1f40-725b-4af8-041f-08da551cd3d2
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2264:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB22643992A31D975A87D47A27B3B59@DB6PR0401MB2264.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Oa7S2N3QtcntRyxTMYl6WmwM6tgb4Q5MldxWsaEAexzZRDSuwjiopn2yxbHmK9i5GHNtCIjWOy7kjBSCOxMQRvQmR9+ud3BG0vbS12qHkb+Y/2SGvbXu1kPK6lmJnGD+OygLvaZ0tiz1B8cI1TwNjUmlWGltk9Rm3msSikBp2Rn83oWXppVVqvTWVZFCbi3n6CVcUdo2S9qSwOCb+Oh84Zd7e5t5kg/bKe78iFo/odiRgrzRc3XIgfOCFciKv6MIh3oWavAu/co2pLUOvJ1KAwh/dEehI0ws+pwL7sLeolN9mKySW6YzPJHk06dv2H65c3SGng2PwnZZha2Ls7/GQROAuUiQ/rXcqMHEwpUWsHdy3eRYd0mBmMVklCecy+Nhvz2U2IaRMqDBdBM/br43RevopNtuihDhyvsndYOAD5Liwby36ka6C+PHhUC6cxDFVu4JxmOi/x3izX+bq6L5ysd2KSGl7Ll+NocmGsM3i22I1E2tKPiD4odviRHyuOUZTvbMWnVf2PP64naNCRoL7l8fLKXqqWD448sPYEsfAR78mkxVzF6YixsTpW9z14eBnbaD2u0YX5QKlg3ECZNW5YMsk2LLxz5cSahZH5gA4/Lz/ckfytrKRqHZ/TjM3i2LqQDxFWDk/CnMJiYnKtMAqPSBfbMfMd09aFEgSv0PRRVU5v6l9utBCKgyfIWvv6y6kTG8hc/Xv+aV9qhJlbHg9zQ9kRnS8mmcAEIvAY19OujIYuJb/HWa2xLe4QajOny+ioH5hC0U5RMnvb65OkH2kAjJoDeYRMu5dWLDW4GhOuk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(366004)(376002)(346002)(83380400001)(66476007)(36756003)(186003)(5660300002)(2616005)(31686004)(86362001)(31696002)(38100700002)(8936002)(66556008)(316002)(478600001)(54906003)(6486002)(26005)(6916009)(53546011)(6506007)(8676002)(6512007)(41300700001)(4326008)(66946007)(4744005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEhxeU1YVnlKTGVvTDBhd29ZdThuTkhRa2ZCQnFsQTNOUjNsUHh5TFJ4YU9R?=
 =?utf-8?B?Ni92UW5sblJhMEJkWmdFMms0U3kzZzNyQ1pUMTY2RUh0eFpZSDdwdzdOWUcw?=
 =?utf-8?B?VllJN0szRSs2U2E5MWRoSE9RNy9GT2RqSWNoQ1VreEhEWHVkaUZMeGVEVnph?=
 =?utf-8?B?czQ1eThHN2FKSmNKaFR0emNxRjVRanFnNVhtZUUxZzlrenEyN2hmcU5JNVhK?=
 =?utf-8?B?Nzh5bjFXYTN0MTRLK1o4Y25acWVPU3prb3NVSGpUZ25Qc3pCM3hkZjhHVEd6?=
 =?utf-8?B?UDFJb2JQUnR5MGR4MXJ4eXp1d050WmJjQ002d1ArNUdrVXVCYUphZ2tFUElk?=
 =?utf-8?B?VlBna25SN0t4THJBREh6ZU1GSDJvTDZpK1BZOGdJRkhFMzQwQ202MGFvL1po?=
 =?utf-8?B?dlhYS2lYZVRGa2JkK2djQ2RzRkgrQzZQRk1vZThhOW9ta24vUTVvWjNrSkxw?=
 =?utf-8?B?OTd3SGh5MmNBWkgxbTNLQ3daSndBODlhZTJyMnRQOU5LSSttV1FWVlZiQ2lG?=
 =?utf-8?B?ZitvMUpBQWo5dnpBZlRnYWFqeVVnTjdpTy9qVXhPOTdoTDUzYzNZeGpqenVv?=
 =?utf-8?B?Z2RMSitaNHFOczZCc3R2RkZlL3phYTllUStNOHlGN1llMnM0NGh2SERVbEJz?=
 =?utf-8?B?TFpCUndxTGE3WUU5cUxqaXBVOVl4Z1RCaWlVY2cwOTlHVDhRNjV4YmhoekVW?=
 =?utf-8?B?ajY3c3hxQ2VvVXBTTnBHalB6cjVxa3lwRExwR1NRVVdQNjVFclQvUUorSXR1?=
 =?utf-8?B?bTlkL2N5UVJ1WERVbGRwT2s1bHg0VEEvakx4RGs4bURVWm1CQTd1dEcwSmdn?=
 =?utf-8?B?RzlmMkNacmUrbXB4ZUMzWFlERGFHV2c4Sk5JSWJRdG0zQzZKY0FTeHFyVnhZ?=
 =?utf-8?B?Y0NaM21kUytaM0N3WE02aUZyQXI1OENsZWo1LytCWlhZeEY0M1ByRzk2U24r?=
 =?utf-8?B?ZUw5NXQ3REs1S28wMlF4eGVFV2VUaHl0MFo3Um9Sb3hNSUxuZ3hOR0xNcGMv?=
 =?utf-8?B?ZkpFdGVXbWNnYzE5eUtQUExNV2lOWGpMaTN2MVU0VGJ3NWF1WEMvMHM5VFFM?=
 =?utf-8?B?ZmZGUzVBa3JXcGtZYmkrL1V5SDVYMjhIWmM3RVVBWHNoaVQwZ1F6VkZxVVNF?=
 =?utf-8?B?U2ZHM3lPRUhmc2R6cEU3dU5meHAxc0pyN3Zlc3FmL3J4amR3QzNIQUJBRk1l?=
 =?utf-8?B?OEpXLzB4VFhBaXVORWRMcHNMOWFxazBSU1BwdHFraGwvU2NBMjhJNE82YXJZ?=
 =?utf-8?B?TjIzcEtHUmpiSE9sYzdBeEg0QWNFaVRHazl4THEwcUdBOCtDWXhyQ2pWZ01Q?=
 =?utf-8?B?THdxU21Xd3dSUWZwYXRhd05qSStyM1MwWXhUTDBCaFp1aldXM09ZS3ZIZGQ3?=
 =?utf-8?B?WmNYNnU4Y2J0MlpzdHBiak1IMUpWZHEvajhjRnpmckdwYkJ2SnBDN2JzRWdX?=
 =?utf-8?B?aHZaL1JtRE9HRk4wY0d3WUh5MlVQTmZ5U0JRdWxtdlgrMmxQSzF2c0JEZExu?=
 =?utf-8?B?S1lJU2R4V0kvZndiSHJFMkNkOU5jTHBXR0RxT0x2ME5ac0RwTy9sSkRXaEtE?=
 =?utf-8?B?bU14SnptVWQ0cWV6U1ErM05qektURjlFTzViMVdCdTRkSmJEL0xoc2RJT3Fw?=
 =?utf-8?B?c2xGcUtzZldBK1hybWxrSi8wQ3dJTzVsS1hhNXdtZ2V2NU80MWcxTjZxU0pK?=
 =?utf-8?B?R3M0cG9DRXMrcW02eTZIeHJDbHA0b0lsL3lOQ2VXbWx2cGs2bVp1SjlxMnlN?=
 =?utf-8?B?K2k4T2VtV0xCSllrbllJa2tCRHNLb2pKc0ZrUkM2VFByWEZQd2NGZFJvTGtZ?=
 =?utf-8?B?T2RmZTZrQ2wwa0hQZkl0MW1BY3BEWGN3UVNwdWVpSDNyaEdvSDVMR2czZmww?=
 =?utf-8?B?MVlEQ0Mrblphc1hFNTdSK1RPVXpqTHRKUDFVVDNVcGs2OVRQR3VzRlUvdWxz?=
 =?utf-8?B?UUI0K3FPQUdIVDkxUkVMRXp0b3luSjFnNmZOUVEvcHUzV0lOUkFTc01lOHJD?=
 =?utf-8?B?UEZ0cFpNeDRVckZSa2RPT1hGNVZhZzlUbEhpemtINUZwTHVOamttU3djc1lx?=
 =?utf-8?B?WGxqMGhqSkQ4czBLNGZHVUplMU4wUUdCNFArTFMvdUxCSnEwazlaL3A0OURh?=
 =?utf-8?Q?GegooibngfG8orNX3ROBI/Egq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 444c1f40-725b-4af8-041f-08da551cd3d2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 13:32:32.8954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAG2xd/8L87CWE0B2nV5Wx5RenU9CF4kGmcXnmhac2WvlaSQLuPyaNRe7iFvHcpDzUttE0zlvC7OfqpZ/jxh3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2264

On 23.06.2022 11:08, Roger Pau Monne wrote:
> Testing on a Kaby Lake box with 8 CPUs leads to the serial buffer
> being filled halfway during dom0 boot, and thus a non-trivial chunk of
> Linux boot messages are dropped.
> 
> Increasing the buffer to 32K does fix the issue and Linux boot
> messages are no longer dropped.  There's no justification either on
> why 16K was chosen, and hence bumping to 32K in order to cope with
> current systems generating output faster does seem appropriate to have
> a better user experience with the provided defaults.

Just to record what was part of an earlier discussion: I'm not going
to nak such a change, but I think the justification is insufficient:
On this same basis someone else could come a few days later and bump
to 64k, then 128k, etc.

Jan

