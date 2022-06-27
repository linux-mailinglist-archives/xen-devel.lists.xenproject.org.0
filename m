Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1EA55B81B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 09:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356257.584369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iu4-0003Ez-Nc; Mon, 27 Jun 2022 07:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356257.584369; Mon, 27 Jun 2022 07:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iu4-0003CG-Ks; Mon, 27 Jun 2022 07:11:24 +0000
Received: by outflank-mailman (input) for mailman id 356257;
 Mon, 27 Jun 2022 07:11:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5iu3-0003C9-6a
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 07:11:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58ff9848-f5e8-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 09:11:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6578.eurprd04.prod.outlook.com (2603:10a6:208:16e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 07:11:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 07:11:20 +0000
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
X-Inumbo-ID: 58ff9848-f5e8-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPt0tg1B5T41LBGlQF2wo2WT92veTkZnweJ8pX88vzkqMNW7+NxlCmfUmHS5Pw4fsL5+6suJvhRKBEBU2QDAF0Zreb7hiJOweja81KlgoovjJ9M9LKl/MPsVu4zq0sC7NziouocvWt9M2n1PWpr5dVBt+7hOJMwpRBobH89rZn6txUZGqsq4S/g3HMc3HeM95YbOYjzVTrRVkCn8jsGDbRVFly7kWWaDHK91fEFBegcP35ekLp2IqaKDS/NsUatA/zBHoFoCr8w0WD+7R3DPsI1PJave6QpSv+DGyeWltGoqSr17hIshMHwCkegy7Hxi6kNLl2goBbkpwik86tVZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+LGdPoDcQdqBt0fQskbltJ7wo0Fk5ytPBxVpSC/PZw=;
 b=gjGjR5vCyqzWq7cQ0mqm0QPdWq9EW50K+VjPNk/TboEy2I+5cA5/WdBnEh6gb6OO02uiHjFYcUzLAV5SABu0Ccg7N9/r2ZsbQAUz9K8dMW0idrN6vOR9y0ZqDZN3daa051hvBwGTfkkLBqng9UTwgKZ4Ew1ucCGis2pjCRHINWfG/lAfdJo6xu4HzW48CX6VnjvrAG2rkdvJcu4WVW0Bt1U69d1rr6iKhBH/tnrExIff0dSnFyHy5B4xDHgHWcDKbSqMEPx3we0Opcp2S2l5Isr6Pde7umgxaDEYMT5H3w7keOs4fIymabsmxTrXFFmpdJN20s9pjsfSTikz9pXN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+LGdPoDcQdqBt0fQskbltJ7wo0Fk5ytPBxVpSC/PZw=;
 b=j4yrNtq1YPSjYZV4hQnySpJsYUf+9mAJ/eKBtvnb+6dlUMzpJIym9mQ153FJ0QSwIIwB3ez1xO7Ut4b1Y9vZr2TYV2emKJplIZPd6uDL2wSP146i4cfl3cH8wMOjNkdjKQOs2IzRBM8IXR2uXB1W7EM9Vt71Rimg/eGk954CJIjU6lXoZ8V8zNt+T+Y/l+PEZq21nj3mes/FdW6ZReQ9MotYwox0ZKa1r1GNC4pQDa7MtbtdBe2KNsnUc14hV+XB/RKkRTotq2PalIhrxxA1GP28Lh50RqTS1u1eyoppFIZnCWdn7JhOScnsL8WIRfOBBOloqZmURSm2d6iThl6Clw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <61094b37-4075-e362-7fc6-ce28f965bb05@suse.com>
Date: Mon, 27 Jun 2022 09:11:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] xen/common: vm_event: Fix MISRA C 2012 Rule 8.7
 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20220626211131.678995-1-burzalodowa@gmail.com>
 <20220626211131.678995-3-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220626211131.678995-3-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0006.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d846c92c-3133-4801-1a0b-08da580c3c75
X-MS-TrafficTypeDiagnostic: AM0PR04MB6578:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nY6wKqobAMEyziu/E8lm04jvnMF5b9O+pd0rEM0bTpgNFAH2QFEnHUvLKIJY7eTWTPxlIpq3wzVQJYyNh9Djdzx8CQAHTxUTm1rUzLiizMS/t9qgWc5zlI6vccMloXJ9/KnS8pZ9Wt2d7baU2OO5HyyRdJgdKU6U+SCDF0wIWQf2+NZUnNeTI/I89h6xtaHSKrT460TxR4ed7dXSLbUhIg2povBKfbWGWsWTRIahY38HPoo178c6zb+QOh4gRO1T3OJdZAIztB92Mc2kaLOB6/HHw2oZM7IUOk69Z2V+Mfbs1vz+0zl1IuKNjnT9A0ZQ+DF4t/FqbA7e+BNO2G8D5FaziUsr80vUhHqqIJz4tZ9BXiuTNt6bz4nNv/+ISAjgqzqoxHdXr6/gjOV4x0+fWQdP4dFGxwwcfF546CZJ/NTEGJArvnyNESOnnDXit/2jDxcdEn9rCd42QAKUdpr1vbL41pGzMRpyEWhXS/Q/NgjWKR4exk807nwrFaVzLzUD9R3tZQ/u28zDpwOr1p3Xo/wjUTwBtnqqYEqJu05twnIQ+1kYF8Uc7Ia2jJj/vxiNDvd5YJvtPeaKXnoCXqIcFmzmJsR0j9RzYzwG8HW0VmJLssCcUREQIJe+s8h38fD+yzFrlOd3E6wvrol3ICNx5ufWlnIpRmHZVEIbvHDUgszF9Q9x3r119x0V9uOjUliV8414+b4Sfjy+W8kRv9xklriS+TjLkktzhhvHXAiJQd1ZPSh75aUUQtXpRCrgFkC6Djvd89bCjSGWP7SfOFp2qXWjS9nv5w3MhPgfFtUoOg36FEIWVASohCWvXOI7W6jOZdYfgr4ZQZJyYYg4G+Qmcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(396003)(376002)(136003)(346002)(66476007)(26005)(31696002)(31686004)(83380400001)(316002)(66946007)(54906003)(8676002)(6916009)(6512007)(66556008)(4326008)(4744005)(86362001)(6506007)(38100700002)(2616005)(2906002)(5660300002)(186003)(53546011)(478600001)(36756003)(41300700001)(8936002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MCt0QkFSdENhbldWc0wwR3RBbXUrUTc2Y1ZNM3g3Tm96b1k4RHdoS1FrME1z?=
 =?utf-8?B?NkNrd3NZd3llcGZyN2JqdHhuZjhMWnBMaWphU0daNnh2UVRyaWtZY0kzU2VB?=
 =?utf-8?B?WDYrK1Vib3VLczk3cmJLYW1ya0NFTmNzdG1BOUZ4YVRXREIvQUlkOENaemFD?=
 =?utf-8?B?cGpqTzBvY0dqNENJRzFOck1QUHcyQnpBbkZjSDdCdlVSbk5JNE1jcTJlYjc3?=
 =?utf-8?B?UU8wK2Zlazl5b3JmSVR4N2FYZXc2aEZtdk8wWWR0cFJzSlFMQlpzeHR6dERu?=
 =?utf-8?B?MjhUbUllNDQvSitiWGJucTE2VnJBNGdiMkpLa2toRUlJeGNqNkh4bGFHMndE?=
 =?utf-8?B?N2VxWHVNRFN1ZHBoaHhEd2EwM2YrMWcwN0RSNXRkR2trdStqQ08zVFF0cjRu?=
 =?utf-8?B?UEJhcFZxUkNJOFlpa2U2VjRsTlhHSXkxRzNDZ0FQRUFJR1Iwb3pSTEtqWGhs?=
 =?utf-8?B?eHRvbTFwQWEwL0ZyeEE0SDd0MXhBUkl3anlBaXM0NmEyNXNIcHpLUlZwVjd2?=
 =?utf-8?B?NUdlbUt0RkZGWU84b0U3M1p0bGdqRHJRbFQ2YmVia2tKaFlWYW84aVB6dVhB?=
 =?utf-8?B?bVVTeWRFTlgzdDVxSllHM2VzVW0zSFFna0ROZkFIbVp6bG1NRTd1R3dveStK?=
 =?utf-8?B?Y0tIbWVnazd0Vlp2NDJPcnRKUU1rdm1EdDBpRCtNVlFRU1YrM3FkaWhVamlR?=
 =?utf-8?B?cXdTZ3J4cVM0akNlREdsOVFCdHJHMWNMSjJCSnM2bEFxTGhXMmJGSWhlMG5y?=
 =?utf-8?B?eTkzVk56dlVvUzVnaWxsMXZPb2pCMnNQQXh4d2xxMHJPaDNyanJoSzYyMk5H?=
 =?utf-8?B?ZXBUNFpnUG81b1BGVkNKQmh1Q29VdnNPbW5rYW5VR0lvUDFOZFZ2RHcwVzJB?=
 =?utf-8?B?RXdlREdKMm1QQjIycDdoVVRDSDBnYmFFNHNhZnJqTFdCOGJkVGVRM1BUc2xy?=
 =?utf-8?B?Wm5PQktCUVVzNmEwS0pkSTIvSlNJNlNRSDh0RkhjVEx4dEppMzA3Rzd2WGNR?=
 =?utf-8?B?NTRRVzBBQ243Y2tzY3pFZ3ZhVThGc2xyRXdkVDhjY2pKZGladHFuVHRmMzd3?=
 =?utf-8?B?Ri9NZTl3c3ZoTCtQSUpaQWFjaFJNVXZRNXFqNnJyRTg3RmcwRkkzUVl6QXBm?=
 =?utf-8?B?N3V5dVJycWlJMUk1UHRjNGFHNnZpMzVZNEdsZGNXVUw4UEZQMVJSZlh5a20y?=
 =?utf-8?B?VUFmMExiYXFjREtncGNpN3NDT3MwME9hSCtacUdGbHJKUHNnM0dRMTNNQmhr?=
 =?utf-8?B?OGdIQ25BaTczcWwzOTVaZnF6K3lRb1lNbkg4cXVOMlpSMnZISjVIRXJOZXJq?=
 =?utf-8?B?NHV6cE9UU211N1ZVUkZEUUVocmI3ZUJZd3dFdERqMGJEYmNZV0xRbEQ4amEv?=
 =?utf-8?B?cVR2Mm1jMTVoQzIyUHN0OUpBeHpia1hYcGxMSUxiUHpWZFhTRERmWkNnZ1hS?=
 =?utf-8?B?R2lKMkQ5dHgwd3lMb3Ewald6clFPdTdSRHlqUnVsV0V5TGljVThiOW1QWFZs?=
 =?utf-8?B?R1lramlTVjRTeGdFZTgwWlhEMzV2U1JCRnY5NE43Y040UFVwcE9lVXlMbW5t?=
 =?utf-8?B?Q1dYM2xHdWRCQzI0QXBMdVBzRG1OcWkrSDdvMjU1SzMzSjRyY1NHQ2RiNnow?=
 =?utf-8?B?S1pzTDU4eGYzWXlQZk5NWnQ4Q2cyTDF6eEdmM3hFa2I4aXQ4cElsM3hPSUNI?=
 =?utf-8?B?ZUJzRmpzNFN6RmQvM04rNzRvZkUxZ0grbzY2S0NoSlAzbWRlVEh6enhjbHEx?=
 =?utf-8?B?SUtycVBkVkEwMWtQenlrNDRlZUNUNFNnbmNRY0ZvVVlhY0xNK1hma3dpSmRl?=
 =?utf-8?B?eXR5R1ZINlZWeDJmdWNmcFJQL0dCb1p2dFJlbjdkMUxjVU5UeUkyUnd4N1pP?=
 =?utf-8?B?NnBoVUR1b2FxNUxzanAzd3JZK1ErV2FwYVVJUGhjOG1mazEwYnFZczB4cTFm?=
 =?utf-8?B?emNldkxPYUtLUk13dVhueVVhQ2w5STNnZW01cjNBOU5mbmFlbXUreFFnV21M?=
 =?utf-8?B?MDdxeHFzcExmQnpBcS9pbzR1c0Jxd1RSZlJKSmRoeVBjN0owMytuN25WOW5p?=
 =?utf-8?B?YUFsVkFucDFJbERJQUY0ZHk3cC9DWHBnMmRibFZvd2RQWVpIQjA4ejRmMFdj?=
 =?utf-8?Q?GoEiC1W9Wq76B2vRiOOjDFwkV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d846c92c-3133-4801-1a0b-08da580c3c75
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 07:11:20.4755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Kao+QdVmlm7r1R14kjCAOg0shCAhlQnOk9UetQTAjpvY97NRsP2+4dyVI1Uj17Tj7NNa8aKfqpcESzrZ8AH2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6578

On 26.06.2022 23:11, Xenia Ragiadakou wrote:
> The function vm_event_wake() is referenced only in vm_event.c.
> Change the linkage of the function from external to internal by adding
> the storage-class specifier static to the function definition.
> 
> This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation warning.

Actually also for patch 1 - this is slightly confusing, as the title
talks about 8.7. At first I suspected a typo. May I suggest to add
"also" (which I think could be easily done while committing)?

> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


