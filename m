Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0B769E115
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 14:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498873.769817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSQZ-0000m7-5j; Tue, 21 Feb 2023 13:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498873.769817; Tue, 21 Feb 2023 13:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSQZ-0000ic-2a; Tue, 21 Feb 2023 13:11:27 +0000
Received: by outflank-mailman (input) for mailman id 498873;
 Tue, 21 Feb 2023 13:11:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUSQY-0000iE-9x
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 13:11:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ddbb205-b1e9-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 14:11:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9323.eurprd04.prod.outlook.com (2603:10a6:10:356::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Tue, 21 Feb
 2023 13:10:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 13:10:55 +0000
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
X-Inumbo-ID: 3ddbb205-b1e9-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUS9bAra+3l6RLaOF3fPV6C+7kqSonSu1A2oT80anbbWL/P5OvyjedTtdEuepttsMLngruIPfp6zoFI+t0ujpqFs+Y7I+VV5zbyQISlZAGIbRU0lA6v3zeNfbsqUIYCnDAUrKYsCFL6TAopG6tAeAouNVKKPmFjWGGxbf7yYP+dhGL9kX3jZ3c9CpfaLzUod0FQXVMkgmvOg4xzKJeovric1UUx0jMLzS97hUhUZt0sRWCXjP33S2e7l5Vd/KZMbeJlLQjjRqX6jmxAz+v2yfliI3apWKuTQjh5Lj379OV+ACSRwitOXG0W1cVnQxr27AdbvD5VAuBQKMLH/SPbPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCn4oP6M2cAS/Hs26RYklNpRZNWqAmNzHQY8Wwk+2KQ=;
 b=dgzD2oLDAUeqzxYYegXpTaau2C+2M0eT84cr4TrzO+DmiaOssHnsc8E54JNARp35KNXylTIWVkfDGYHVOFlNQRxpl5KXFRoiuoWlT3vvnQS4ufPteS0/SIZAgyuhZP1jVoTzNjO4mY6Apo8PI93rt6UNkpHHLYV+YTdjCedPFGj3ad+gKFaXUj2vwXBVqWJ3b/vrcaWYfY+SqxJHcAynZAqCOA1WAmNC95J1EegggtvRn9T9NJYkM2nd0cvxu4lsjWtnW9/70/pB13Fa8iONIW87aGlH8oZkuIT6QMEGs/NqkfpG0G/l8I2Y0Z6wLNVH1Gyx6td3Uss32F0BlPRcNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCn4oP6M2cAS/Hs26RYklNpRZNWqAmNzHQY8Wwk+2KQ=;
 b=ljpKxmSzjqb7nB7umLsFetM908b5U4G20PAuWx7spOawsltFA77tnB/a6VUrDzDWSBJnnkws7Sb7TcEw/sLqj07TWR83me9Z1E2oGgfLhsy3AZHkHaImbN2F9szBBo0ph/s2/kyjiHNr46zG5X/nLIxbSqqikrI68DZh+zZrMqqhQIUTxt3HdtA4vRi7aRTBsN3GbksBM2BaybJv4duGp/drn7mZsbP73q+4w0B4Vq4A0oKVXM8FdQbHAajXkgiDW1qtq8vs+Njp9pWFtMtbkthSc852ZHQmJfJwIYlEgNFmag6llyWUm2KXDcJvQq77AzTgvwnPQ1za6ddqnzlKaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1684ac85-f9ac-a57e-9529-f2e09f6f81ff@suse.com>
Date: Tue, 21 Feb 2023 14:10:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] x86/treewide: Drop the TRAP_* legacy names
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230220115956.1522728-1-andrew.cooper3@citrix.com>
 <20230220115956.1522728-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230220115956.1522728-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: bba545d6-a6b2-4f40-1af6-08db140d10c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y5J6Vgf53HC63dITvhWInP7WxNt6wZX2Kxc7q1S2Re8ZcAclqLPm7+2rHivw5oVo18BAXbUCcgYe1PlmUS64kbrJHKKoLY28A+1+iFu8vM4UnUBKPODxEXlbSIEn4VUsHlo/x+9/nq+PALK+4RfcvXe8+ELOYHhQHDJLTpJ5Ermbj2fOvK0cvzDpr9sqLBSaMHFe6y2sIQnVT0eRspW5uonR1XrmqVDuZH5qg26gcGzq/6gIHZfM5tuXJNu24j2bPKGOmlcFzkHgTSq9zcyQ6/YFXOkWwvjrvfByek/m8vw99O0fvcGCoiLzRBxOMbM4+Qet+4yA01cluntIH0WOiJb+U3JREH5dftaDADf4w8heAeoQvPyak3x4mtrWBLoXLpKG8N4FiBvTMzihBNvechmMf91HDBuBN8TvnsQSiXDdGqN2W2kXgzLR6ZV94d00BHGxT014tXEMe6jRLJvMMXK62AH388fjw6cLnR3xlAwKgaX80mZ4IYO0oPrPMtxYBT/b49IF8XVASfK4lvPq8Njny5be74DzLeUxg8qCdJCo31heQrIKl4AGlnLtVBPNbSeDlb6K+/3dFQnkUiLi/aq4v1E9UPou70Op9oF6CYIpNjHfBBSZhuWZ+FCLj0I+sIeUSP1Yxouw+hZ9KAgmn/6Tn8/cXZBANVWShjNR9R7PiYactbbM0hmzY67rIgUFaujnhVa6yNrqLdjqr69UuJahcveaddXAJq3YpYsYSjQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199018)(6916009)(316002)(66556008)(54906003)(41300700001)(83380400001)(66476007)(8936002)(5660300002)(2616005)(8676002)(4326008)(186003)(478600001)(6512007)(53546011)(26005)(6486002)(66946007)(6506007)(36756003)(31696002)(2906002)(38100700002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?USs1Vk9RbFpMcm1IMlhzbWM4MC84MkJmaTh5Zm10d3lFamtvb3I2RHBsODBs?=
 =?utf-8?B?aUJWbmhkWHJSOWdDZHRXODcyL0ZENnVDZUZ6NGdiT0I1Tmk4b2pnYm1aaU5v?=
 =?utf-8?B?Y3BBQU1uOEI0ekE5M1RBWTFBWjZqU1MxMGdmUVRrTUpJbmlIeG92U0V1Z1p5?=
 =?utf-8?B?WC9rQysvNTE2Tlp0Tjk1eWlZeEZtMmtqbUV0RmtJdlRmYVZKekJZYXhjUUIx?=
 =?utf-8?B?VkZPazV2dmNXS3liWVR0TEpwOUxpTUk4WkdiSG4wV05OZEtmbDdwUnlvWk83?=
 =?utf-8?B?MWJjSTJ2Zm1wSDBpeTZnbWNFL1hrRzlCNU5GL1U2L01lbVU4ZXVmN0xNRnFP?=
 =?utf-8?B?ZEJyOHNkTXdxbXZidDV0eFNJenVlMFNuZTVVOTZmbFp0cXpheEREUCt6amFV?=
 =?utf-8?B?MmZRU05YVWI0VlRHR2RWVUMwQzhZMTYxWWJDbDB0TG0vdVVTV2E5M0NLWFdp?=
 =?utf-8?B?STc1VjIwVzJ0dFJEZ0JJZ25BSlFWUzdmQW0vOUJJeGFOQ3RSRFRtaVE2MnBa?=
 =?utf-8?B?TXh0ejN6K1labW9RWXhZdzFKYVpqL01zYVZhblFVZkh0RFNYanFkcEl5dEZE?=
 =?utf-8?B?WFhnSUlDeTgxNnM2NUhMcjRjTmpuS3FmOGhoRnFzOGNPUTBQa25YaDBMWDNq?=
 =?utf-8?B?R3pNV0ZJVmJqcUgzMnpPMFZJQ2d0SEptOElCVGpleDMwaERvVGFkWjRqV0dq?=
 =?utf-8?B?dUswSDFSdjJBTmdQU29MYmRiWnlScDBQaUpQQ2VnL1REUVNUYmdhaXNZRTZK?=
 =?utf-8?B?U1pqZnpNMmRTRTZVTWFTeXVGbHVPZU4zOHZjd1R6eW9UR29PN2lrTnJJN3dv?=
 =?utf-8?B?MWp2QXBvd0t0TkJ2akJoRXJ2bEtuOFQxNm5NM3NVL1l2QzQ3OVNqeWZiY2Va?=
 =?utf-8?B?alB3RXMzY3VYSVN6bXhNNk93VmRvbHdhMExKZjNCUW5CU3BQdjF5T0Z0MUlj?=
 =?utf-8?B?anR2NlFZMUxjYWxnQURtS0YxbGlpOFBBaXJVL2krT2RGVFdKNkFZZzB2UEY3?=
 =?utf-8?B?T2EwUU85aExLa1R5M2dnQm9NNGsvaURJYlJIaTVNVkFjVHBGYWdmZFVrbkt6?=
 =?utf-8?B?Slc4TGpkRVNEL3hjdzhsbkxNYXA2eHRnNGhRSDF6cU4xY3VIc0hJdzRHd2lx?=
 =?utf-8?B?aTgrekZybGNwdWhMbjhKdjZsWFh6Q0JJQnNNM2lLUllvUThLWHlFenU4d0VS?=
 =?utf-8?B?ZFFVSU1jMWVEUVBpcDVIMncxWExRMDd1bCs0dG5XbXlNOFFCaHZwVURFVklo?=
 =?utf-8?B?WnFaRFRvRHAzWVMxYmF0RENZdk5PcUZSWnZJcUNZbXYrZy9MTm96cnhFZjlz?=
 =?utf-8?B?Zmo0UWNQbVg4YXhRV3lrRjA4SlJLYnlUVGo0d251bXZLemxEZXpJa0JlZ2ht?=
 =?utf-8?B?dDFLWFNzNHpQemowSExZTWNvaHhpcFNZTCtWbEkrcjNhajkrMHVkSWUwcDU1?=
 =?utf-8?B?NEFoQ3NHRWw1bytlenRxSzhza1FxMFM0WXF5R3JFcUtEcjAydWNESkhJeFRm?=
 =?utf-8?B?UlZ1WVhVSkxrUlE0SmMyYXpRd0l1Uzg4ZDIzaTN5cVJQZVlYN1VqcVlCbDI1?=
 =?utf-8?B?c2VPUVZWSjJiVlhqbklhemFkNTZ3QWh5cUwzb2l4YkQ4d2Q1d096aHRBNW1X?=
 =?utf-8?B?SlNMRi9zTUI1RnlKckQ4TWd3NXdaMC9jWXhpcmY3bFVxNGRZZk1NYU1Qc2pm?=
 =?utf-8?B?b1ZQNEdVNEtJa1RRcGFuS1RTZkxSakE0TDhGd0tWOVJSS2QxSDg1Y29teEJk?=
 =?utf-8?B?SFV2Zkhmcy9Qc3hiTkdyY1B0R0NINHd3VmhkVHJJMll4QnNzQTErMU1ZV2hX?=
 =?utf-8?B?b1BKejdQV0dPWVNIUFdQSkl0RVV6b09nWkhpS1RjNmRWQmJoeDY3UnZXZUpP?=
 =?utf-8?B?cHJoODl2aDljVUNSaWZXTlF2V3JlcTh0WThYSlFUaVk5akR0K2ZsbmM2VkhX?=
 =?utf-8?B?RmpnSGVyaHlQTURNQmdCT0laVk8zd1ArNTN3YTN4K3ZiaWQ0eGtaZHdDUDZm?=
 =?utf-8?B?Z2Iva1pTNjBOZXhiWlI3UXg2bFJDZm16bE5zYWx5Y3Fkc29zV014MWJaR3A2?=
 =?utf-8?B?NFNZVDJaaWN5cHh5a01oaGRTRExTOWVMMXkzT3lXVS8wOEczRDlIcEdUSkhD?=
 =?utf-8?Q?DbEJyLpBu1kCu87/DC27OC/IY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba545d6-a6b2-4f40-1af6-08db140d10c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:10:55.3390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GeQR+w+Pk4wMA7FCyHgE4SeVWxmDS52VcfMNYQVU3Z3Q13LkRkzVC2ZbI3N58J2mPUTtSuN3l/oXXGF9j7+kJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9323

On 20.02.2023 12:59, Andrew Cooper wrote:
> We have two naming schemes for exceptions - X86_EXC_?? which use the
> archtiectural abbreviations, and TRAP_* which is a mix of terminology and
> nonstandard abbrevations.  Switch to X86_EXC_* uniformly.
> 
> No funcational change, confirmed by diffing the disassembly.  Only 7 binary
> changes, and they're all __LINE__ being passed into printk().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -2745,9 +2745,9 @@ static int cf_check sh_page_fault(
>           * stream under Xen's feet.
>           */
>          if ( emul_ctxt.ctxt.event.type == X86_EVENTTYPE_HW_EXCEPTION &&
> -             ((emul_ctxt.ctxt.event.vector == TRAP_page_fault) ||
> -              (((emul_ctxt.ctxt.event.vector == TRAP_gp_fault) ||
> -                (emul_ctxt.ctxt.event.vector == TRAP_stack_error)) &&
> +             ((emul_ctxt.ctxt.event.vector == X86_EXC_PF) ||
> +              (((emul_ctxt.ctxt.event.vector == X86_EXC_GP) ||
> +                (emul_ctxt.ctxt.event.vector == X86_EXC_SS)) &&
>                 emul_ctxt.ctxt.event.error_code == 0)) )
>              hvm_inject_event(&emul_ctxt.ctxt.event);
>          else

Entirely unrelated to your change, but seeing that this piece of code is
being touched: Aren't we too lax here with #PF? Shouldn't we refuse
propagation also for e.g. reserved bit faults and insn fetch ones? Maybe
even for anything that isn't a supervisor write?

Jan

