Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D385712A8
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 09:02:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365506.595703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB9u9-0006uo-0n; Tue, 12 Jul 2022 07:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365506.595703; Tue, 12 Jul 2022 07:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB9u8-0006rd-T4; Tue, 12 Jul 2022 07:01:56 +0000
Received: by outflank-mailman (input) for mailman id 365506;
 Tue, 12 Jul 2022 07:01:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oB9u7-0006rX-Ct
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 07:01:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60069.outbound.protection.outlook.com [40.107.6.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8258c6fd-01b0-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 09:01:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9564.eurprd04.prod.outlook.com (2603:10a6:10:316::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 07:01:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 07:01:50 +0000
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
X-Inumbo-ID: 8258c6fd-01b0-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfN4CAKOARs90oSxDV8MgnWsv2Q7CzAZ6OOiw+OXVgpCEtdrW29vuBy60Otvsi4W4v9wr23TBgbmZolfK5LWUa4BNK7mVob8kCWWFfYu8mvMIogcg8VzE4zkeOM1LYzjuADZdZBt/IjmFV0isSSxYF8niu9IZmy+0oRUY7TyEH8VC2YiSVoyXZnyzo2h8AYWJ3Kq+M775uP4YfOcsVHwfXHuaAQ2wLv1Q/Qbt15UfR3UN/k5fLLgNVbJV8W3PO7Fl81ahTX1Gd6sl/AZgIBxCST7LmZOkZ6QB6Fzbi3DOUBJ4WMCRQgXzpHjA+pQrlSFAgGrLSJgsEGY4nHJvGGfMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbCJuwscgh3wdpQ0BtHFHbXJt0mR/kDzS6u9A7szgQw=;
 b=kSpospmGtZfbPxfdEh30zIBZL8j9Maj+6MIazFNqRt0v0FBBcC5VD2O5EmGSCkLgS93NOvRHDtIqMSBN0N7DSjOgaPEHSJNbYBAt3eK4kbPO21JuRCJ50EewuQl9y9IG1/xgUn2SxsUQ+vA6NvpvVxT3Ihv0wTnsFSx8SUiiG+HQyX6hfEZtQMHHz7iVjW9T+2kV6V3cFwjbBuowbhnhHpvkgThI1a34DxeyZNyFkvYGgTDloqxrLi+J9KLBPZgkaydtfllKFpoNv0yfjrIRtqyd2PlzalafbaFTQcM8qkyb5c8JH77CxhDoAP62akKVGFKhJ8/DOV+ESiEt50OxwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbCJuwscgh3wdpQ0BtHFHbXJt0mR/kDzS6u9A7szgQw=;
 b=GzocPFqMUrdnD98GtmcaQNTMeFXvubaDdyReF8M+/RUV0jL+YJdyaCmyBeVeyUlOiXuTNtjNsogEl08PvMsbVw6os5j02APkyZ5m3EkS0oq7iAbJAKGeQqejoguHSVTfSvkBNUIWG2c0QqBONVMC1Ir63eUZ9/fy5C8UG9bBKEg1WRKxfjIuipyUWRxEOH3VyyLYMb64zELiQaUt48/YowGQQXQKqljZTy8cFjphJKYP3tMcxGSO893LuBO48XBlE7PSARDqLARsVH91AwVr4yL9yiqutUeYSgDS3m/PevdYOFDlSCDiDIFwbwsngn5y/o6f+1vIRV+bZlcmvyIgJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b06e97e-1c39-9889-8d04-f1a063b403d6@suse.com>
Date: Tue, 12 Jul 2022 09:01:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xl: relax freemem()'s retry calculation
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <55556c13-dbaa-3eb7-9f3a-9e448a0324aa@suse.com>
 <YsxOBUfIl47N+E+u@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YsxOBUfIl47N+E+u@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1971894a-47a3-4c6d-f98b-08da63d46519
X-MS-TrafficTypeDiagnostic: DU0PR04MB9564:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VJ5HDq9YzLR3K5I2pfBgOxieC9BOwJShfrWZimMRdUgMGtggaIt4h6Co6wpvNkpdYhkJWj2mNTadDTeDxScIaCaBWZRCQJN2F3o/l2W6DIhhdwptOJFLy+O7pHENUyHHoQLArlibvUx0XdO2dgVu/76ak11qOvHYnpzoaiI9VxPBF/J+Mn7fkPRrsi0LwJpM0Ow6R8C1FpiLC5lzGnIppxs+o5B9JecW06gOKNdHG96KuD7Lmvya/BPD4LUf/f2YN+QjrhzNokEIXsV/rCjqY0v8U52QP2N9nq6tQy+g/Nj5KpgNAgNf8h6Pd7J2Vx+MDCHUgk6T8pUw1eUebbpHhNPJyszOZVmYlSUFbbb1L7C+a3nSwzzGDYI1Dwx9d7QUlKAH/w6H9hpYg/FTenxgGwGL7CbN/y/s3swBzEDxyRpgkeEZduprnBHH3JYEtDyERyl06vSXuFAdhiEifMjjhIwET0kuccmDnGEUbXeN9S15h49voXU/m5lLk78OBrfc7oHmK5B+veZSyX2jk03QQ+rr20SRIAegG6zbZ+//BOOlsEIT49SEd5U/+QFuuk9PDNjsi+xE0/Wy9t6rrUITkhKsDFVlSQLXvv/Ldl9coyVFZc3UBMToFWzwZLP/EaHBAg+U06Ms1G2ybJSy6A0mVCNCpBnLHNpHkl5K7xQByfAvyHF/1PYTTbrX2bboaycRaptGwGO0zT+8fYGa/Pt3bKapKAW0313qbMVEVar1hZMwomyxKFflCiegrO3tXvSvok99bfeNrvVnoBjdFwoQN7ULV8+jyjEbWgIGkxUMnpDEdd0FKiCV9Dkt4lQvdoQhwaSaR9Kqa73F5XU7rbBgSRDSC2bkdbL+k5ZybOmFicQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(39860400002)(346002)(376002)(366004)(38100700002)(478600001)(6486002)(53546011)(86362001)(26005)(31696002)(31686004)(36756003)(6506007)(66556008)(6916009)(4326008)(66946007)(2616005)(54906003)(316002)(8676002)(66476007)(186003)(2906002)(8936002)(41300700001)(5660300002)(6512007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akZ3R0luQzJRdk96VklhSVNEdzlRanovSDVZejJoelhrQ3Z4ZU8ybDVFcW1R?=
 =?utf-8?B?M1F4TVgyOHZrditpU2todis1R2hHazlpNjd5NHY2d0NkSzFIbWFOVFRjbTFq?=
 =?utf-8?B?YlV4ZXZCdkg4ZlhPNmdYY1p3YmRzVS9CdTBTVFBCRFlWUm9DU0x3SlVSbXJx?=
 =?utf-8?B?Rkt4bTM3Q3M2NU1GeUpydVMxWjUrYThUMmVEaGFENm9ER1hMZlJienRHTjRR?=
 =?utf-8?B?MS9iSnNwOExzT0FRblRyQU5rQU4vS1cxTXdNdVk1N1pyemlwZDM1U1ovN0Vl?=
 =?utf-8?B?SnY3UCtucE9GSTBsQVBqV3U3aHpTZzYraFg2Ti9WcW1OT2E1aGVQMWJVZ21S?=
 =?utf-8?B?Y1VudzdLeVpYVk1mS3BsaExra1BMS2FNY0QwZnU5djMvTHV4aXhoa2RWWExU?=
 =?utf-8?B?cGpmeEc3R2I3TjJvRnl6VldIUGVqRWZSMEpodFBOaGM1WXB2YW5xdk9oWFN1?=
 =?utf-8?B?eUtBNXkwZ1RHKzZ4WVQ1WXFuYWE0NkFHYzB1b0VXNXpqRjMzZ3c3ZDhpSXNS?=
 =?utf-8?B?QTZDR0RxMHJUUGlIWTQybXRmNGRzMGREakhlMFlWcTYrRUZ1bS9vNjk0akFl?=
 =?utf-8?B?VFRuVFowazJ5cWltZFlBVngyMVpEeTc5VTFIdGU0MC9TWENBY1J4RWI0QmRp?=
 =?utf-8?B?bmUzL0wxQ1JEUy9ucWxuTTJvd29kQ3F4b1hQcWYvN1ZsTlBORUNlS1FkMGZU?=
 =?utf-8?B?a3VQaWlGUitnZDZCT2lsOXZIWWpXd1Y3L00wZWpnTWx5dGlqT01aSUV0cWxJ?=
 =?utf-8?B?VlNmaHZhRTR3QjFPU3hlai9Rd3RlTWYzQ2NXVnFybklZK0hoOGZ1YlEzRVlX?=
 =?utf-8?B?VE1UN0VORWhqYXhScUMzWGc4RTI5dUhOaEcreTNlRFlYczFNakV2OGhVcmNY?=
 =?utf-8?B?cUVvV0pqQUZWSnRRanJSOE1VYmp6VjlWcW5kVGRiTG5wbHdaN1U0bktzK29m?=
 =?utf-8?B?UW03TzFRdjB6ZnlCaHQzRENzczNWK01mM05KaXBiMzdMcE0zM3ZxRCs3TVQ1?=
 =?utf-8?B?UC9vaURlTnhwY0VSWU9wNlpZSzIwWG5ERkpXRHl5b0EwMjd6TTA0TG1nUDBR?=
 =?utf-8?B?c1VkY3ZoQi9meDMrNld5d3ViQURGWWpYa2Y0SVVya3UyWWpQTUpDWXViWE5o?=
 =?utf-8?B?TW45YjVCR3lpNDdTSE1UcXIydVd0L3Qyd1ZMNzZtdUJTVlFHMnFFRUpnZHNH?=
 =?utf-8?B?TVhvNGJaaXdRNWxXa3djczBmaUtGenBzclhtWlFnWXI4RWtjZm50NXZyWEZt?=
 =?utf-8?B?RWpVNTNZalBrTHB5ZDRlcUtTcjRvL3FSUFhkdEx5SGw2b3diMWVIMmtSd3I0?=
 =?utf-8?B?MUhEbUJXRE0ybVAvVTlrQ3hseGQ1d0h0RFdYSDJqVkhrMU5wSVlkbmFsVXR3?=
 =?utf-8?B?dE0wb3Zjd1N0S1ZtWUtxRno5cURMOEE4bVZFTTJ3NTdpZm9LblJyK1Z0bUNW?=
 =?utf-8?B?dTVnVlhoMGVBdlZXS2p0OHpWSVZ0UHJGelUyNWpMTzNWejR0R1ArS211S0tZ?=
 =?utf-8?B?VGYxL3NwbUwvYlBNV2xlVUp4dkxnRlhmcy9wMDhnUzZGSTBpM1ZvZzk1WWg5?=
 =?utf-8?B?b1ZuME5GOEZPdGtnYWxJbkpQeXZlL05kV3RkQ2U3VG0yd2FXK0t3ZTJQS3NG?=
 =?utf-8?B?ZS9IN1NiY3hhY1lOdlJoU016WEM3MVF6MUJqeTRYUlkyeXh6dGE4K2RWTmdY?=
 =?utf-8?B?M2RMOGNhUWpBK3ppR0N1ZlNXb2JBMGFPNUJ0YkdIVlVydnlDU0pwR0hzU0cy?=
 =?utf-8?B?M0w1Y2hxL1l1eUV1QytvLy9ZSUt4ZlZ4T2E3SW1SQTBBdW9JSjlJTUdUQmJj?=
 =?utf-8?B?aXRXaUJHRmNZdGk3ZFFqOXFlcUFQaDNWM0tVMTlPV291bU5zTHhsU0VFc3VJ?=
 =?utf-8?B?d2NjaTBEYW1yemtWdnVJM3JEY1FlNkIyRFo4c2NRZE1Ya2V6b0c2WUdHSFl2?=
 =?utf-8?B?bGxxY1VoaEdVbjBGV2tadGpIbnplUkwxeHBGUGFhN1F4SG5vdXppeHF4RjdK?=
 =?utf-8?B?RnN2WjVacDU3NTc2NHRSSk10aW51MHZ5Z0txRFZBWVVMd3cwOU9wRG85elgy?=
 =?utf-8?B?TXBjZjh5MkM4TDlkWTBiZmNWRTNqbmJncGNhSFExbnZ1ZnJmNjNEc2xtWVZy?=
 =?utf-8?Q?5bO0b8I4nGgVVC3MadQy9upe2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1971894a-47a3-4c6d-f98b-08da63d46519
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 07:01:50.7545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YphiOw4b0evBDxC9hv7K93ib9JNEnjgaa7gWWpSknYogCTduohDGyVusirVJsZ9v4sIlxVGjLvxTeE2WCf+Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9564

On 11.07.2022 18:21, Anthony PERARD wrote:
> On Fri, Jul 08, 2022 at 03:39:38PM +0200, Jan Beulich wrote:
>> While in principle possible also under other conditions as long as other
>> parallel operations potentially consuming memory aren't "locked out", in
>> particular with IOMMU large page mappings used in Dom0 (for PV when in
>> strict mode; for PVH when not sharing page tables with HAP) ballooning
>> out of individual pages can actually lead to less free memory available
>> afterwards. This is because to split a large page, one or more page
>> table pages are necessary (one per level that is split).
>>
>> When rebooting a guest I've observed freemem() to fail: A single page
>> was required to be ballooned out (presumably because of heap
>> fragmentation in the hypervisor). This ballooning out of a single page
>> of course went fast, but freemem() then found that it would require to
>> balloon out another page. This repeating just another time leads to the
>> function to signal failure to the caller - without having come anywhere
>> near the designated 30s that the whole process is allowed to not make
>> any progress at all.
>>
>> Convert from a simple retry count to actually calculating elapsed time,
>> subtracting from an initial credit of 30s. Don't go as far as limiting
>> the "wait_secs" value passed to libxl_wait_for_memory_target(), though.
>> While this leads to the overall process now possibly taking longer (if
>> the previous iteration ended very close to the intended 30s), this
>> compensates to some degree for the value passed really meaning "allowed
>> to run for this long without making progress".
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I further wonder whether the "credit expired" loop exit wouldn't better
>> be moved to the middle of the loop, immediately after "return true".
>> That way having reached the goal on the last iteration would be reported
>> as success to the caller, rather than as "timed out".
> 
> That would sound like a good improvement to the patch.

Oh. I would have made it a separate one, if deemed sensible. Order
shouldn't matter as I'd consider both backporting candidates.

Jan

