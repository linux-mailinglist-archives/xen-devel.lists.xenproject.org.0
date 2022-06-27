Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED05555B7EB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 08:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356209.584292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iCS-0002kd-LR; Mon, 27 Jun 2022 06:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356209.584292; Mon, 27 Jun 2022 06:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iCS-0002ic-I2; Mon, 27 Jun 2022 06:26:20 +0000
Received: by outflank-mailman (input) for mailman id 356209;
 Mon, 27 Jun 2022 06:26:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5iCQ-0002iU-V3
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 06:26:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80081.outbound.protection.outlook.com [40.107.8.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d2e7e75-f5e2-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 08:26:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7237.eurprd04.prod.outlook.com (2603:10a6:10:1a4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 06:26:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 06:26:15 +0000
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
X-Inumbo-ID: 0d2e7e75-f5e2-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqjxW4W7OHz0rYZiHvtdiXbzI8UOalQaBrs/JG1TU2Cw7TrS4Yoqad2AEenmADVAcgrANA+lNv0bVIrgv5Ei5HZwAP7paEo7H0FFLiHwD5+QNZtaS4Czx78V9U/kwNzcYIxvF7Bjpek1bnHGKsjhSrN6/pd8Oa6jGLuE0WqM3DfWsAVXFy0t6WL39YHtWlIRFu/Kyq+uBRFhQWmISWJxHorLpNUPVuDzfzfHHbVNhQEbaVdd1dApU10Bnwt9sETqHnGr6cb6l123xg5n7oqTK8NA6wgYAyZj+RyxYzlTiOuAF+IpEu5U1tuLTAMKWSLQEi/dnpgV+1/wcTQjBiORNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gV1Xq38WoGbki+qQ6AMzWg8y3k6Z0aUHS4+b5ppIr5Y=;
 b=A7KOdUgETT7qpCyf3tOiRtCfU6g3LMZYUdgNF8o+EZdUCCVaYyiUhV/h7xeL5ZcfeqBteQbMPkKi0i5yUL6QYZInLZMIgiTJZm4Nm2TNMDs+J3Bl8amXp+zEeRxML4kZ8SlkUpGPObhEkuoX6GqxjooqHnLgQDUqRLPpIXtHelP/6qx5Q699/0+leiNn8/MdaIuZuEJ1RaXjwI7RHGFOpo7Iy2ytWTulR//Qebp3BycfHTYZ+7iM7f3/AOQNrqAnMNblE2vXfR6C+9t5P4Que/RyHU8W/+9ZMfXCtdGZW4R8KOweeUY6HCQO1j70Xt3sdMmPFP8Db6I/NMC6oswxpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gV1Xq38WoGbki+qQ6AMzWg8y3k6Z0aUHS4+b5ppIr5Y=;
 b=Nv/XjzmY3FtA/hCrzsLRpTedfuAato/Au1NXg1cf0jLC0GUs6W7vBnCrpnxHQ5XbmNkUEq4GWOrsCYFvRSg4qRNE4ZZERhfnb4dkR3jaUgStSaKyLZrCiZ7tENdTlSd2ZHsq27VKv5k8CqqLkW8w+X4W4gnM5XzYb3DY1pDhlMSP+waI9BMKJ50Wl4Eucuwrr+2NdFcRizQF1JwQwtv0HwGMBa/a3fQXAUibreufTKYdT+ai4va4qoerP9FTRH2L3Zj+pAQbyWoSWZ3FwYORQGeY1Hwf0Xcw1lqbbjaWKe6kWmkK+cqddTGnkOPtFs0n3quyrsNcjlCDsznPwgr18w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <883929e5-cebf-101b-7906-47ada79a56f1@suse.com>
Date: Mon, 27 Jun 2022 08:26:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] x86/shadow: slightly consolidate
 sh_unshadow_for_p2m_change()
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
References: <9ae1d130-178a-ba01-b889-f2cf2a403d95@suse.com>
 <521b39ce-2c2e-967e-ecc7-f66281aee562@suse.com>
 <87A27648-D543-4122-A354-A37CC4C4BEA4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87A27648-D543-4122-A354-A37CC4C4BEA4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0171.eurprd04.prod.outlook.com
 (2603:10a6:20b:530::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eecebd9-4a8e-4f60-421f-08da5805f022
X-MS-TrafficTypeDiagnostic: DBAPR04MB7237:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LeIUaI6a9LAA9pe8nZ5reMBR+DLMRADwo52oQrYaYbXIDIgLv5tO3nbIn1YlXI+u7TGGwsnyHpuzKwNQUt/vjs9F2z1DuSdfJc7rMNMGpfTyzd6UjrwulskNdXEkm54mveViJLGbCpcRHt4EDJuOMgglyxVWSX2+Vob10ewQy7t7vDFN6GmocgAxi5Cxj3jyd//eIDdeDvl23m74jIqFDf93ppcltYQHqcy5KXSP4uOi1GW/60eeiOpNjlt+2GDQzUT0t58S5bwxJLi56pojDQfjFUYpUIeNgQwT+aGqZK32hMDNh6/edpluqPsA2iglUdx7iDQD8flJNF7KWwSCOKZC7bVkI0wjy4wYRYBCWiiNAQt59Tptp3rHk1c3U8OjWzjcr0qWxzINyaGx7Gjt6MgUs6CnaQKnYLHQ15eym3IrLlBdsALOtKwxg0zIFo44Cab/2I+hRfw46zfwgaUFlgw7LjBXCoKoFD5D0PvD/BChSUVY5wEGlzqeXCWnwQ7/u97G2ySrU7WTcwwoBK+qHHEeoYjByKiSujOzKRAoO9IRXxYiqGHLb7d2E0ry+WXqEuHyARK2KzFCAuWD4CeoslCZEo/5Jg9siV/kcwvfuH3eApAsl8EzsL3uqTgZ5HoKFnxwVe7u4rz5/YbSD709F4A0TYeMosnVfgFP2wXbENZ0PhU6tTKthO+mWTRnehJb4YoGcV1/ADvqR8c4kk8hzch7jPlYXnAr08Lp3J1AtrQ7A4zMl1d9xgCg7xLfOxUiFbTef3yVj2mQank+l5skUCJCKTc+33dtjuN9smb4zd4J5qSkd5q+PaFinfx2/msGBiqa2Bf6kSs7rFa22R8QtKx691yKjECfIg7tMuj3kkA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39850400004)(136003)(396003)(376002)(366004)(8936002)(5660300002)(478600001)(6486002)(186003)(6916009)(2616005)(86362001)(41300700001)(66946007)(6512007)(53546011)(26005)(31696002)(2906002)(8676002)(4326008)(316002)(38100700002)(6506007)(54906003)(31686004)(66556008)(66476007)(36756003)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlJYYTdHTzEwMS9GQVJqUnJDK2ZLck4vTHd1RWFGYno4RVN5aXBNNitLRXhI?=
 =?utf-8?B?VUVnaURZa0tmdTN1VVBQTm90Mm9hbFQzR3RaNmlJaXpIWUlvbWJOMEFUWGxv?=
 =?utf-8?B?NkV3OFhaTUhVeUVmeXBYbUFPWEdXcmJlVG1XM2VyWnlocXpuV3VWQW96VDl3?=
 =?utf-8?B?Q1lQZjFBR21mTC9hVWRsOU9zQ0RZZ3FNR1ZlNmMrbzQxeERSbDZaN0NVd2Jq?=
 =?utf-8?B?THN6VDRvYmhrc1AxT0M4U0FvY0k4Vjlab2NyY0pBbEJZVFNBVGxERXNNZVVm?=
 =?utf-8?B?NGl5eFJNdWpaZ2I3YnZSZXBkc21jNVA4TDlGNXhzd2Q2THdtNE9sZktweGpz?=
 =?utf-8?B?djFGMEZYUnFCRCtDWVJXei8zaElhSERzRFRqOUl2c2dORFkrMC82TTBGS3Y0?=
 =?utf-8?B?a3NnbHAwR2FKbjhZaUcyaldiTVhuZTVGRU9BUUFzZjAwRTdDbGF1Tjd4cDd1?=
 =?utf-8?B?NlN3RXBBT05LdVNoTFdOMk4rbFNyN2RXSHRZemlsakk4L1JVVWN1OGJvSDRO?=
 =?utf-8?B?VnZ6WFRDMkZON2hvN3FEWlBRdzRBUDU2WXZ2VUkybk95cW9HWnlZRitMUWRk?=
 =?utf-8?B?cUR4cTRQeUN6aGxjUzJ6d2lickxnUDJSWVk0eGMwRUlVVUhRemVRcERpUWdz?=
 =?utf-8?B?U3d1L3ZSVG56LzJHNUpaeVQzV25WZjJ0NHJRQ2tFYlQzbnl4cGJxamlUa1Vh?=
 =?utf-8?B?SlN3WlFoWkgvcStuQzdXN3FCc3lteHNtTjR1dWZCZlBSeldoWE5Ja3lzQllP?=
 =?utf-8?B?WjROd3FhajczcUdEeDhqQVZDTS8rVDZySzRHL3FxdktTY05wamtpdWEwS1FP?=
 =?utf-8?B?WDhuKzUzZnJlaTQ3QWpFZ0hSeTd0OHVMTUNZdlF2RkJYSUtzZUVvMnFaeHJJ?=
 =?utf-8?B?NmJiSzd3TjgyM1ZKWFppSHhkK3g2S1dMeFNPdXRmUU5oTGNlQXhwaVpKcXdD?=
 =?utf-8?B?Q0I3MEtpdURHNTRNa0pueDFyMS83YmZNZEgwM3hKcm14WE5FUDhFeEJyaTBD?=
 =?utf-8?B?U0VmNUkzS05SOFR0L1BuR0dJT20vRjhubVc0VDVCenlTSWhpaHhkd2U5OTNv?=
 =?utf-8?B?OU4vMml0OGdXWDdUR0tONldoMWpYcER6c2VmUUZ1eHFMQWhvSGFXNUR3ZVJL?=
 =?utf-8?B?aVplOVdWY25LbHBFU2gzVWpQTnJld2ZwVmVQdEVOMFVmQ0cva0JqMnFwTW5y?=
 =?utf-8?B?Qk9TdXYwMmdRNjlqZlZqS2xmMVl0UklIK055QkY3Z1R6cGtvQ2RnTGF3Y3RR?=
 =?utf-8?B?SXh6WVp0WEZJb2FnSjJ2NkNrMm5hM2sydEh6eHgzY0ZMRWhYYzRnUTdUL3Uv?=
 =?utf-8?B?T0tWZ2t3MEJ3UnE2R1NsT09GSFNmQWZWbWtEa3pWQld3VEtMa2pNZzJUNWZr?=
 =?utf-8?B?S3l4cTh1RHIrbUM4aXYrczZEb1NOSndKcXlnSXBKcDE4SGdHYXNiRk1zdlRm?=
 =?utf-8?B?S2ZLMWtuU3JsTHpMN3dVbXB4QU5VTUpZZ1VBTFMzN21iaEZOVVF3SThqa3BK?=
 =?utf-8?B?dE03ZXUrTDlUUWZZWi9CRHhIMHFIdDY1MW9FeVB1U0U0em5wRGhwbTBTSkRO?=
 =?utf-8?B?R0t3QThJZ051YkdDcmJnTnFNYWlJYVVmNFJna2lML3hURS9Ic1BqOGg5UnJF?=
 =?utf-8?B?S2FVVDhJTHFDNXdraHZENk0rbnZrR0pzekQ1ZWFxSEFGbm1zRU1hZWFhQUtB?=
 =?utf-8?B?VmFiVURxTHhtWW9iUTgrcEhLVjJTWFc3NWFFVHpidHlTZzNMdEExTGNSVzJR?=
 =?utf-8?B?QkowK3U2MUcxUzNaaUpNbkVOUUdCd0l1YzNlR3NLNUdJYmw4d2huNmdza3VO?=
 =?utf-8?B?cFBpdGlQSWVsb0NDOUphZmh4TFI2WGc2S21ybDEvV3RzLzJFWXVzZytIU1Fu?=
 =?utf-8?B?ajJoSG13aEE4UDNyRDFFVDdTV3RlWFZDeG1HVG00Umt1aEVxeDRibWEzSjhT?=
 =?utf-8?B?R2p5RDhOaHllS0hZNGdmWlVVQ1NkcmdkTGtsRGw5NkFmNTJkYWVrdDY1WG8x?=
 =?utf-8?B?U3FjdzlPcldIblU4ZFB2S2VySVZFKzkzbXh1bUQ0aWxtaXNFQzVoZHNDOFV4?=
 =?utf-8?B?YnpWZnZzaWt2blhVMm41cENkSk4vK3MyZmdnWXo0ZGVLc2d0YksvTVgzWVVu?=
 =?utf-8?Q?EQmlH3LFYXD+CF8QKSoqeLWua?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eecebd9-4a8e-4f60-421f-08da5805f022
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 06:26:15.4610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nj4wyt8UyHad3hrntScOnUpK9X/SqYSKqVXTyplxtuT3FNUmjNegv7GPfCv9uqAsfOG0jHNmKFnmqbwmP3M4hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7237

On 24.06.2022 21:16, George Dunlap wrote:
> 
> 
>> On 9 Dec 2021, at 11:26, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> In preparation for reactivating the presently dead 2M page path of the
>> function,
>> - also deal with the case of replacing an L1 page table all in one go,
>> - pull common checks out of the switch(). This includes extending a
>>  _PAGE_PRESENT check to L1 as well, which presumably was deemed
>>  redundant with p2m_is_valid() || p2m_is_grant(), but I think we are
>>  better off being explicit in all cases,
>> - replace a p2m_is_ram() check in the 2M case by an explicit
>>  _PAGE_PRESENT one, to make more obvious that the subsequent
>>  l1e_get_mfn() actually retrieves something that is actually an MFN.
> 
> Each of these changes requires careful checking to make sure there aren’t any bugs introduced.  I’d feel much more comfortable giving an R-b of they were broken out into separate patches.

I'll see what I can do. It has been quite some time, but iirc trying
to do things separately didn't work out very well.

Jan

