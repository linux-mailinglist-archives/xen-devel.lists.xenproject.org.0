Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E36E65673E5
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 18:11:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361465.591010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8l8Q-0003QL-3a; Tue, 05 Jul 2022 16:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361465.591010; Tue, 05 Jul 2022 16:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8l8Q-0003O7-0O; Tue, 05 Jul 2022 16:10:46 +0000
Received: by outflank-mailman (input) for mailman id 361465;
 Tue, 05 Jul 2022 16:10:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8l8O-0003O1-Ql
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 16:10:44 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30048.outbound.protection.outlook.com [40.107.3.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 057c0d2e-fc7d-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 18:10:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM4PR0401MB2370.eurprd04.prod.outlook.com (2603:10a6:200:4f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 16:10:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 16:10:40 +0000
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
X-Inumbo-ID: 057c0d2e-fc7d-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLx5Nyvm/jQ3zGZvGuuwIYYgBO5Ut/UXxP+Hlb0wKK5Pylb7aJ8Y5Sd+I0IguadYQdq0ka8Wj3PQBFTIwh1/lJ0tVYvAH5FITCSiipSBOniMiTC42//Ywx3lQPxJsRZfhuNdIqxv4sUyI5ud5Ufn6Xj8gHmFDm51fB8LleZczaaEsbm2MCUgNjtfX09r6kZOJozsbSaKYELdu0LCe+ckmUqBJ8ungGmuhxi5B3MtHilecJZqY+ljV2jj0xGsnPsdlXpKnEJRiLQl/uHuKc4NCHxlFwXGBjxn5Ni2bgZgjMuaeqJ0Ahsreh6M5Kq7qh8HQTxep/wyRFkdLMnrPgYl1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gw2sSL+GwIPEzkvXAHmQhaRvc0n8rVkAnKNJbGT88M=;
 b=gkKomHvcoyC+56897zactOJx+ZQAEhT/UsuedvWKuNPP3wdCre7Qchusls8pfPkcY5HXf2HmtNGGhZT/0HpaCmxWyK5UR/cQBso0Zz1NwyqiwlqHPEr+wwoaHVecH98DlwBbirto0of2uM0Gqx7jdNSDkgJCgwX7Jj3Ls71N0Hnt31/pRH4ijXeZnJ2RaygXxLwVkwsrPOr+YDrA8Xiuua4YQdckq9UgXOV+8uYYboh5pf5uQcmUY5wBh/Rrrs/FX4GnfpWrRwfBWPy7EK7KtpQ2PFcUOmvGWQijLMIiMB9xJd2+wkWL4PSMdrOwXvXRpUrf5wXAJA7WDvE+cBbu9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gw2sSL+GwIPEzkvXAHmQhaRvc0n8rVkAnKNJbGT88M=;
 b=GppIHy9PqSBig6/6i4k6oSi9yjo4p5eUZj5QMDAtlAb/wzNTmiIiB/b1DtjiskfsbBvdVEpI+9ZYo+J8j6jTP4Z+ng/7dhSOwp2kYEgWjV7m5fQYknY+XfeGg9Sz0T8T57HZuCOqJtKiMJCtpQBoOPypigKHPH4QwJTnxFFpZ4QT9v9QJ5CA05msPg2Vw9178b4pFCAVuKOlNAkXrwVGu0x11PffJ2e80SSRyczwMwBI+/9FcV1cJB/HAIRffL0O2HQ6lZ7lDsECW52n3zOnnbK9z9jmyScKRKLqBwFK9KiHO2vnbfxU1ajXRGM1kafTVPEsvoY2JkS06F5GJokM6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a2685155-1a06-bdcd-5fa8-1cd95ffd200a@suse.com>
Date: Tue, 5 Jul 2022 18:10:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1.1] evtchn: add early-out to evtchn_move_pirqs()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <acd0dfae-b045-8505-3f6c-30ce72653660@suse.com>
 <8bca62e3-1075-f1f7-1a92-1a4c58ba2aeb@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8bca62e3-1075-f1f7-1a92-1a4c58ba2aeb@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0031.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2d2ffc1-d78b-41c3-8102-08da5ea0e7eb
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2370:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zQQRMRMYgZUycveL81eaBlTqnAWBCqqnR1T5ttLoLfCqNcGCC5yzYxSzeyg4pT02Q0mtOQ7KRv41np60LwiibtUY8VfDfkfaikm9lVkpPzmIxL1nBoUFdBMjcemQ47pVfvlnAS7TXv7Zh9yqPNdcLW2HTM53n48EqXN146Ze8eQDH2wuPcbInrmPqokglK0DT+Qla5eHvKTlaw7oVCausgLh4sO3LlpN9ILJ1pdoC/SaaoiiJmRHPs8L81fpn7H1TTpliTq58lNdifqNKBOLZZ5qG4ZFGBZCY1SgePZ05171Vd35fWVtCpn38Hwdmt6naJrlhnActHZwn0yq/u9+dhCEqCGJRqSs6Ub6EyS6muGz80CUoAWr2Tggx5mxJ4SAOOLWRkUQw55vjuIQhiQ2WoswWlvpQxgK5mizb27a5O6QitsKtCdFed3egQvYDsUFOjbgIiIvNDv+/c93ZeJ43bEzjEoRf8tLeSLxwJdnDf8+vWFyFWdseKNX4fCxTKX2i3zFnoFdftlWw9FURIFwXT/BqQdhWwRweBeHBzP9ztdnB7IkKdwD3RgjAu8ah17tfcUKZ3SeBzC+yt4g7HSa9e+gliEzN8ktk+/j3sY2IGKROGgi9o1R26GzslsH9UsSVPbaSRw9F9fUxASlAQUd8x2bks8h3kORJQlococoIlGApf5bEC8sw8MvXakTlEOuMqSsDVle0w2OVXPIkJTrGTa8jOcV+AeMcfzCem6Vj7yqaL6nHs8AQCLfaVeFMmymxz4B7qmjx5zvN/LQ+G4EYQkjx8ff7Kk4k5BebVbxNi//8kzfF74tYJL8QOOqDhAnq3N//DUL/fiNyBHUNPjcgxl373gU5K7mjm5RaJSPP0s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(366004)(346002)(136003)(376002)(186003)(54906003)(6916009)(66476007)(6486002)(83380400001)(4326008)(8676002)(66556008)(66946007)(6512007)(2616005)(36756003)(31686004)(26005)(6506007)(53546011)(38100700002)(86362001)(31696002)(2906002)(5660300002)(41300700001)(316002)(8936002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlMxYjN5NlBDcnNJZ01KYTRIalh3U0JLMGVZcmx6QTZvMXhkYURkQnRTODFU?=
 =?utf-8?B?TFJ4cmhjZFBKUFljNm9sVlBxbVFmQkZyQVRRYmZBMEMwMmZ2bjNhREw5Vnpq?=
 =?utf-8?B?cGs2L0hvbzNCSVI0ek4rbzQ5NTY1MjZ3RmxrWEhKU2Jvd3BOM09KRVU4STdK?=
 =?utf-8?B?aUJsUW1iU2xWa09TdUk0QURWSHF0VTFLUTViK1pDdm9YUzhRZnFUc3h2U2E1?=
 =?utf-8?B?WjJuc3JLeWxHekNyQlUwK3hHMmNxb2JGUm5UR2VSQ2lvdEw0ajBESFRpY210?=
 =?utf-8?B?U2JrWXVKcGVUUzNSYS8rd0FSWkNWbGpYZnJ5ZHdoOHpkTDkyYkJPWWRhYksr?=
 =?utf-8?B?Nm9rMFp4SnZRbWlVRXBZbytDL2U5aTlyWW0wNFl5Mys1aWpNQlJFZUpjZ3k3?=
 =?utf-8?B?UmFvR3d5ejhOMTNpVE5nckN1RlJ3WHpDbk9PVGJoKzhDbDlSOXNscHBZbGZw?=
 =?utf-8?B?VzJESk82NmJ0UERvZzZLWXNtdElURllCWHNGeFVWVkg5cnZ0c2dJOVNaY293?=
 =?utf-8?B?dUZpTWwrRkZJS0U5R3RteERxRWltVWRNSWhvcnVSRVA0K3VuNit4VUUrMFB6?=
 =?utf-8?B?WG42R3JqZkJGdGllYmx6TDdaeU5YODlTcVNZdWlsMU0zSlpiRjVNMDZOZzRy?=
 =?utf-8?B?Rkg5bG1NNmZTOTlmSVc3a3hTK0hZTXRlYXcrcWxlQ3dmSDNkVnVvSkhkUlJY?=
 =?utf-8?B?VWdBV3hpeVo3TGtZMDBySVFsR0lXSjRZeTVEdU55NHRqMEdnUitpMCtjTVBx?=
 =?utf-8?B?cEpVbjI0emlDc2hIM3V3YkdZRHZYT0ZxNHZnTmE5Y0hlZUgvSjNINFZqdWlG?=
 =?utf-8?B?LzVtY0FQU3QrTDJWb1NFYjViRVo5M0tEeFZKSmUyaGNtQTI1RnE5MXJEMEJ3?=
 =?utf-8?B?V2FuYXRBSDNJcGVzbGFYSnpiMHQ2VTNOS1pPRHFGQlcxYnJBcEVGWk1qLytO?=
 =?utf-8?B?bzcwUGJYS2FSdDR2dGpJdU1SRFRNa2JGZ0U1cWlJdXBZYUJyYmM3NUVNQjNq?=
 =?utf-8?B?dTYxYWF3UFhRcEtBTVQ5YnNBaVNOck1IRDZIM0FoSzYxSW8veWltWGR4Ni9H?=
 =?utf-8?B?U3VIQk9rZ1BRSXVxcmpFY3docVR4eFJocmpjSmFWSW9rczdkK0xaUjdUYWtz?=
 =?utf-8?B?QUlXYnBRK29NSWQwVlUzQXZUN3JzeTF5V2Jia1VIQkV5dDY5WjNXbXNnbTkw?=
 =?utf-8?B?MUI0TVJ0ODlBb3hiQzcvcGhRay8reHB2YVdhODdSOTZRbkpaZWpDTUhtd1Yy?=
 =?utf-8?B?ekhBVnNEWGU1SzVybENHUWNudC9QV3VBVjZDRURibmRqdVp1akEvWW9tWW9w?=
 =?utf-8?B?QUpLWThtSFJQTlliczBkZUp3Z0ZMb3Y5Vm9zU2JsN0hMcTFLL1g0VEp2UWcr?=
 =?utf-8?B?VFFPVFVDdzFuNGtRMjdKVTRuSzEvaCtydFU1UmRxL0g0ZHNkaU1KWU9jamxw?=
 =?utf-8?B?T3hYczdXMHpSM2tseXhXd0w5cnJBb00vTXFxZXJyTldSaFpCREptaDFwNVQ0?=
 =?utf-8?B?bzNubzV3SmszQXRQdGlmMlY0WmRVM3VBNDBEbzVuSFVZdHVxek5oZ2dUTVpV?=
 =?utf-8?B?L2NHQStHKzRDS0NtYUdxUlM4Vk5lclQ3cjJmY1ZtODdYL3hGVTFBZngxQ041?=
 =?utf-8?B?SjBidThqZWNEdFhOeFhuaDh2MkVtZEE4T3dDOU9hUHdRTTVuSjBzTUR1a2JU?=
 =?utf-8?B?cS9VUVNyeitBMjNvWk5pWVVkTkdmVTF2RmxVWTRJbFlROU9Qa2gvNWIwb014?=
 =?utf-8?B?ZWsyTzRKZ2RlVEgyeEQ2dkg1c3M2SXpUN0R1TW1XUjkrR2hHY21sNzZkM3Q1?=
 =?utf-8?B?dWZ6Y2prZ0RzRVpqcmk5TDZDRnh4ekNpVTd4SHJpMFJQKzc0UWxlR2kwUDk1?=
 =?utf-8?B?Z1BFc2NVWGw1Mkt4ZXVJNUZTYkhNT0RWY3daVkJOK21LSWRKRGM3MnhXNll5?=
 =?utf-8?B?Z055UUxvTVZGMHNUa3pMNHFRL2NpOWtwUlNGdkNESitHM1BFNzFJb3lQVi96?=
 =?utf-8?B?ZjVWWnhqK3pBQktIUHZCTnVTazNaQ3MzWVZvTFpqMUxOSkhva2c0WFhTZGlv?=
 =?utf-8?B?K3loYU50RGdZWnJmOVpCZXVuVmNudUFnby9jV1RpNTFCM0I3NEVhZ1hKcytC?=
 =?utf-8?Q?stMxgQhEqSka+rM+dXfLRmmA5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d2ffc1-d78b-41c3-8102-08da5ea0e7eb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 16:10:40.6814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oueuZqaJRVYhhMJBfrHVCLOuWRdOLetABP213Yj5PVgi23eMJm8squNRGbglxaXXILAaR2eS3YmkVdkCIIAtwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2370

On 26.04.2022 12:44, Julien Grall wrote:
> On 26/04/2022 11:33, Jan Beulich wrote:
>> See the code comment. The higher the rate of vCPU-s migrating across
>> pCPU-s, the less useful this attempted optimization actually is. With
>> credit2 the migration rate looks to be unduly high even on mostly idle
>> systems, and hence on large systems lock contention here isn't very
>> difficult to observe (as was the case for a failed 4.12 osstest flight).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
>>
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -1559,6 +1559,16 @@ void evtchn_move_pirqs(struct vcpu *v)
>>       unsigned int port;
>>       struct evtchn *chn;
>>   
>> +    /*
>> +     * The work done below is an attempt to keep pIRQ-s on the pCPU-s that the
>> +     * vCPU-s they're to be delivered to run on. In order to limit lock
>> +     * contention, check for an empty list prior to acquiring the lock. In the
>> +     * worst case a pIRQ just bound to this vCPU will be delivered elsewhere
>> +     * until the vCPU is migrated (again) to another pCPU.
>> +     */
>> +    if ( !v->pirq_evtchn_head )
>> +        return;
> 
> I was hoping Andrew would give some insight (hence why I haven't replied 
> to your previous answer).
> 
> I am still not really convinced about this optimization. Aside what I 
> wrote about the IRQ raised on the "wrong" pCPU, the lock contention 
> would still be present if an OS is deciding to spread the PIRQs across 
> all the vCPUs.
> 
> So it seems to me switching to a rwlock would help to address the 
> contention on all the cases.

But that patch of mine didn't get any ack either, and hence at some
point I've shelved it. The same is going to happen to this patch,
and sooner or later we'll re-observe the issue osstest had hit (at
least) once.

Jan

