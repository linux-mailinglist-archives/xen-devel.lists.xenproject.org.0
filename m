Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E39365AE0
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 16:10:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113770.216833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr4g-0001MV-D0; Tue, 20 Apr 2021 14:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113770.216833; Tue, 20 Apr 2021 14:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr4g-0001M1-8C; Tue, 20 Apr 2021 14:09:58 +0000
Received: by outflank-mailman (input) for mailman id 113770;
 Tue, 20 Apr 2021 14:09:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYr4e-0000xF-6F
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 14:09:56 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 205abebf-5a61-4251-8bde-b19d566079d9;
 Tue, 20 Apr 2021 14:09:47 +0000 (UTC)
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
X-Inumbo-ID: 205abebf-5a61-4251-8bde-b19d566079d9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618927787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=YBD6WHtBwNT4LEPxSJMdcqPjdNC2NyZPlUGjf1NdB+g=;
  b=OF/WZQySTanLpc+siGVKKcv8JPohpEawvWH/BQ7Kr5S7Y6kIwhWzDld2
   Cc711QWZUuiY7cY+f4ST9yrWN5ryDhAEv0dSLmz6c82cIV9u+5b5UX7f5
   pWOeZoofzrkx+LJh0QIdum0lumtzQ7pzfE/YjSBpDQ63yTpS6jRCPwMqE
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6oeFlPQ2+RxIP59tl6MTRLunsvAtArlIo6vv6STKIkDOBxCDLFHVUZkLreIsrPO5Eha9MRt/St
 Nhnzd8zbdog0YESY0vSTQ4tdeAIWNIWAO2vExrbHpt3CoHwwl3EzHczTlFeLLzNt9D4LMqIlwL
 8xZG6d9r8t4oueg7aH+bOZnN/AG84HSzzkGHSo9q8OFjTMzIDmcsOD4YBjUTfliDGuqpK5B7Z1
 gSgp/MLpR2oxjSfAaF9GEQcWWMzFl+jTmOZNJJxVv0Kg0CSljWy+OQSA9+loTv845PD+cVupex
 BRg=
X-SBRS: 5.2
X-MesageID: 41817646
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yRlHQ6tnj2t0i0W5QkmpQo/27skC84Yji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjrU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qw6Y
 5JSII7MtH5CDFB4PrSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjjtRICzzKDwTeCBtA50lGJ
 2Aovddrz27dngNKui9DH8JX+/Mzue76K7OSxgAGhIh9U2ynSqlgYSKbiSw8zU/d3d0wbkk+X
 XYiACR3Muemtyy1xO07R600714g93ko+EzZvCkqs9QETn0jxbtWYIJYcz4gBkQgMWCrGkni8
 PNpRBIBbUC11r0cnuuqRXgnynMuQxekkPK8lOTjXv9rcGRfltTYKAg9OEpACfx0EYusMpx16
 hGxQuixuBqJCjNgTjn4JzwXwxq/3DE0EYKq/IZjHBUTOIlGdhshLEYlXkldasoLWbR7YAqF/
 RWF8fM5PpaWkPyVQGmgkBfhPOrRXg9BRGAXwwrvdGUySFfmDRDw1If39F3pAZNyLsND71/o8
 jUOKVhk79DCucQcKJGHe8EBe+6EHbETx7gOH+bSG6XW50vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uIdfm5uwKzjn9BEGGGRj9wMBX4JZ0/pfmQqDwDCGFQFcy1+O9vvQkBNHBUf
 rbAuMWP9bTaU/VXapZ1Qz3XJdfbVMEVtcOh9o9U1WS5u3RLInHsfHabebzKLLhHS1MYBK8Pl
 IzGBzIYOlQ5EGiXXH1xDLLXWn2R0D59ZVsVIjWltJjjbQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eerWmy9mDY0nVxNnNmfwJoyYSld0kPiR4BMkvyf7pGkc6YY3pu0HyOIQI6aM/KDg
 hFpRBS9bisJ5KdgQAuYujXfF6yvj82njanXp0ckqqM6YPOYZUjFKsrX6R3CEHsDBx6mQFjrU
 9Zcw8aTkrjFjfj4J/Vz6A8NaX6TZ1RkQ2rKclbpTb0rkOHv/wiQXMdQnqTS8KNuB0vQDBVn1
 V11KcajNO76HGSAFp6pN59HExHaWyRDr4DKAiefo1blormfxxKQX6QiSaXjAwyfWTW51wf71
 aRXhG8SLXuOB5wq3pY2qHl/BdPemKRc1lZR1p6vYd+fF628Upb4KuuXO6ewmGRYlwNzqUhKz
 nDeyIVOR4r7cuwzgSplDGLEmgGyp0iMvfGNqkqd6je1xqWWcu1vJBDO8UR0IduNdjovONObP
 mWfBWNKijkT8wuwA6Yqx8eSV9JgUhhtcmt/hLr7GK1hiFiRdXTJUlrXLEdLZW36XP+S/OBzZ
 V+ipYUsIKLQxHMQ+/D7ZuSSThJbi73iyqRacoDrJhPp6I8tLdpBfDgIHP1/UAC+C97Fdv+kU
 MVfb9y77/AMLJ+ZsB6QVMtwnMZ0PC0aHYxugP4AuUCbUggon/SMdSO+afJo9MUczq8jTq1HV
 Ge9iFHls21Jxer5Po/C6gqJ35RZ1V5wHN+/Pmaf4m4MnThS8hzuH67OGS6arlTVeysHqgRtA
 9z55Wtk/WMfyT1nCDWsj0TGNMCz0+XBeezChmLA+hG7piTPkmNmLKj5IqLtwjMIAHLIngwtM
 libkwfbsNKlzkkgskW60GJO9PKi3NgtUBf7zFhnkPqwa687g7gbBh7DTE=
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41817646"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enUI6efuJ2qhYL++64c5VNUhpeqIotcyjim2Bn9YoZZa0MOXSNXHtWw0tESjU16CtTMQXxEX+IIM3GV2Vu2q7K3MnmTrfiSVrw2SAHe5lq7SK8F6ZSaKUSAO7mIJUl1PH3PelAX5iMIvGQ9GqLcp8cTDyDVC443ADwlmowq4MIz+8ynkuBX+ZJ6Ng6k9HzdQvsM2EzLP5huVKI8gKqcF7XxwuRRUofyccLFQhVaeIg8z93SgvxNZm2ZbJOf1FbwEesWqBEeMOcF3FdC+jf0MjlABXti9ZIjH8vWuDjf1q2REF+eE9eM3cY2lmeJjc1o57MhQqjB4kg+AmRsJEBpm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZm9Z2BEw31KJoXCeDJY/oKkesXv/TagNzRHxADW6kk=;
 b=b9sOtdhaCFTtr5RjDhlQT2FIfOgnZiQUuQT2qf7yCY9lzJliZbxTA2GYEozg9ITG80DAlrqHfwo2SA01pRy2NvG2ALYMkfpNlha3LZ4p82RA5kPMaqUX+gBWyDRNTbnjaxX//bbNCPJb0fc+8C4MzBhlTuDlRlQLouik61q0VhR9O/wdhXezEIV7gwzXX+Th01dKtxsLT+pOBtQh1xqIZM5tsBoa4MHtaporwxb4LvKxkxdqY17ZYDOA//dts0JV06TCBnfgBWKZE9jyKkKn+PaWbh+TTAxZb+ytArWiWH3ddMjnLQ9d7Rcx8AybswnzhAB8TZnNwA/Z5V6IzCDLnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZm9Z2BEw31KJoXCeDJY/oKkesXv/TagNzRHxADW6kk=;
 b=fTcnKjkYdH+aSL6M5giqMVt9dhfRDC4AtCmuQiR0SzVtohwADntqTajspGUOlay3NdGXAVRJQtzhA4WvcAY5NeWlP/TQi6WM+07j41uaWLNhCRUEQCJep4H9+A+iceeI5sFhKlJ8/e8fFWESBcNzZIhYD/EmF82q4zG5kgguDEQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v4 08/12] x86/vpt: switch interrupt injection model
Date: Tue, 20 Apr 2021 16:07:19 +0200
Message-ID: <20210420140723.65321-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210420140723.65321-1-roger.pau@citrix.com>
References: <20210420140723.65321-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0165.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 446954f9-17ee-4155-4bad-08d90405efd7
X-MS-TrafficTypeDiagnostic: DM4PR03MB6000:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB600084A83E6B84AB168BFAA38F489@DM4PR03MB6000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oNIh4v/H5ehtwQ3obmoTDUAJmmc58gPc5ORprHjqHt88Nbuoq5riYu0xF7aAajI3d5CkmJR90ursPi4LjQp7PuwOT6CdAJIJRhJg8InGM144FrhpKVtjH989chiGju2/fvUOmKAlfjOYEJDlDsfsFKAMHRsPX6DTV8zLmrfOFpn9lLXBXoU2lBYgWzKIx+a4RtFD/EZraFJKfgrl0x4W5D1bh1pqVnttfXZifK8A63AbB7Qxz2ck6ebFTQbT/CG9gtiQVE8MP31GAtt+yZeEvEfLqPwJapyN7jFc7pbWiRm8bJPTKCaklIKiROkUg+yIUap+mhrrvXNt/SCNkKlL6WICrKYAOVN3K/B6+9avofaHFm2nIxSIi4uxPXMWsnvOJqFWXBL8hVl8mfj3Jg+ejg0hkz11HXKL34NLdPPtFZ8gRJ6hZAmLyb1fdZvupVQ6Y2bUd+K0yqxJhxfhk0QmG7bb7P0nqbatPuNGUd1p+UFjKBaOglWRK8c/0P6DfivhG1Ksd6mtWC9F41pt0luv0E3H76tHhtDGbiFramW/vEXfj7LcR0YTg2M62xcjnTkqmuaHQNBf5pwlXb3uSI8eD5d3BJg3a4nlN9PARDocnvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(6916009)(83380400001)(4326008)(38100700002)(16526019)(36756003)(316002)(956004)(6486002)(2616005)(6496006)(478600001)(8676002)(26005)(30864003)(186003)(5660300002)(8936002)(54906003)(2906002)(6666004)(66476007)(1076003)(66556008)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TmJxamZEVzR1K0Q2N3puSFZmaXNFa015UUtkTXJGdFJQL0MzTWdYaGtGNFJ3?=
 =?utf-8?B?aTJTSVZUWS9WNG93L1ZGUENacXc3clprZ3dETUJrL1BDK2JCM3p0TTB2aXkr?=
 =?utf-8?B?YlFYUUYvNk1STDhWcmpVOTRmZk9jUEorOEszS3FUbUdQb2hWbnFCL2lvRHlU?=
 =?utf-8?B?UlV1TytUODRDTDg1QVhnMWJPZXpLT1FHQ0NTRVR0WkRlWVRmTzJBNmpiK1da?=
 =?utf-8?B?THlmeXArbEw0bFZ3OXp6N2NQTlVZV09mVEdqNzVlNzd0UVplNlFzMjNrQW9Q?=
 =?utf-8?B?bEJ2OU9POTFya0FCdjVzTmFmcW1BMlJoWXZocnZtNU96L0V6Rlk1eEhxU29R?=
 =?utf-8?B?S2pVb09TNVdKT3p5bGx2MHg0bzh3cFdGWVdmZlZ0NWwwNUdPQTNQZTIyT3NH?=
 =?utf-8?B?UlE3Nzc3MmgyZzROMzdpVHdON0lVRUVrK2tWSEJHUVowVlBBWm9ManByMjBQ?=
 =?utf-8?B?dWRCMm5QTGtsbjcra1FLQkRDV3BWZzB2dXVsNjVLNTdJdFpRRmxXNy8zQjN4?=
 =?utf-8?B?TVB3R3NSNmhMYXlIeUloWVZXaXJOaXYrVXhaTktMK21LYjFySStLNW9oaDJ6?=
 =?utf-8?B?QXJaQm5jUDdwbTA4TWNObllIdkpsRzd5WHlIZ290cHR0UGRCajNmWkE3dC9F?=
 =?utf-8?B?Q2RkaTZsVlNoZFBUOU1LNFozSjNPUGpjQm0xMFZUSWlpQ0tvZ3Zxa0wxNW9n?=
 =?utf-8?B?NVA2R1dKdG10SU1FcEhyanN4Qm1EMmNjZ25IMCtFMDJ5dys4YVpyS3hrRURy?=
 =?utf-8?B?ZEFnQllSTStZZzBpZEdmeUExaGxpZ3RVanZKdnlXamprMnRseVNkOStzUDk0?=
 =?utf-8?B?OHUzYXI3cFFCbkRaL2p3UUNwbHJ0c3gwU2dYZFNXYlg0a0M5M2VtN3Jsa1lj?=
 =?utf-8?B?TmVpb0dybTNsZk8zZThvNGtub3JnNlZUaHBjZXE1STVINmRpYkFsNDR2T2Fa?=
 =?utf-8?B?TERXdjJjZUhDRkd2REYyU3FiVEhmUVB6bWh6U1c5ZGZmYkVrdys4bDcxZjdM?=
 =?utf-8?B?UUJJRk43anM0QTVCMng4MGJkbFdtUGNrN2VKdm03SVh4cFZRaUVaZzVVQWQr?=
 =?utf-8?B?QUJuVkFQZnZiWUdpc1Z4SmY4U2FyYXBlaklYcnppMUJ0bFdQUEhqVDEwM0Mw?=
 =?utf-8?B?alZxMkViVk1QNmZ6V2ZBYjJWOTlQcTJmNmhwZjNtQVdxM0pGbTI4Rkc3Zzk0?=
 =?utf-8?B?M2dlQUppMHZUaGNrR0Q4VWxCeW5ycGw5Vi93ekVGZXpEdk5QRHhaLzFjbGR5?=
 =?utf-8?B?aFJpRVBmYW5rS09UZVNnMEU2a296M2d5YVU0YlNUY2FJWEJ2TC9ibUhBby9P?=
 =?utf-8?B?N2g3eFo2ZU5SZlpSdVBuWW9TM0dqb0Q5blFSSFkzRytpOVNMOVNsd3ljNGp6?=
 =?utf-8?B?OEh3Sm5LR0dxb2ltd3AxZWxIc3B2aXFFZTY3YTgrckhaeDlDSkNlV2M0NVhx?=
 =?utf-8?B?cktoMk1ySFFXSkZLRXJsY1YzUlNUZUtDeW5TdlNPNURVV2NyY0Rqb1QwRito?=
 =?utf-8?B?Nk1GNUlIR1d2a09QcVpLeFdWRnZQQ1k2NklLbm1JOHltRi80cFJxdk80K2tJ?=
 =?utf-8?B?czdmQXVsV3o5NERlT1QrT21IdEhHNjNwWG5XQmdiZjNkeXlRQ0ZXcFVYYXZ6?=
 =?utf-8?B?ejJNNk5HR3lnQmUwVFpwT0RvTEhKK0ZMNDNzZ1d6YjRrYXBnNEJCYlJXSlA3?=
 =?utf-8?B?ZEU0WDRKUElFRkxYRUFab2RwS0JkYkkyTVFPY1NTMnhtQ3c3Z3hLS280Wk9F?=
 =?utf-8?Q?ZdaqX3pZCgPElLzQo9gVp7av3/IVgrpYBmVbQcp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 446954f9-17ee-4155-4bad-08d90405efd7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:09:39.6779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IO3hCH3YPk4W0IVUGbeBh8SgMprYtS68LbqGCJSbgyaNRSDW9nzo24VGu+hc+a5lnIxBp19qOduRDERtxmS5aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000
X-OriginatorOrg: citrix.com

Currently vPT relies on timers being assigned to a vCPU and performing
checks on every return to HVM guest in order to check if an interrupt
from a vPT timer assigned to the vCPU is currently being injected.

This model doesn't work properly since the interrupt destination vCPU
of a vPT timer can be different from the vCPU where the timer is
currently assigned, in which case the timer would get stuck because it
never sees the interrupt as being injected.

Knowing when a vPT interrupt is injected is relevant for the guest
timer modes where missed vPT interrupts are not discarded and instead
are accumulated and injected when possible.

This change aims to modify the logic described above, so that vPT
doesn't need to check on every return to HVM guest if a vPT interrupt
is being injected. In order to achieve this the vPT code is modified
to make use of the new EOI callbacks, so that virtual timers can
detect when a interrupt has been serviced by the guest by waiting for
the EOI callback to execute.

This model also simplifies some of the logic, as when executing the
timer EOI callback Xen can try to inject another interrupt if the
timer has interrupts pending for delivery.

Note that timers are still bound to a vCPU for the time being, this
relation however doesn't limit the interrupt destination anymore, and
will be removed by further patches.

This model has been tested with Windows 7 guests without showing any
timer delay, even when the guest was limited to have very little CPU
capacity and pending virtual timer interrupts accumulate.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Rename pt_irq_fired to irq_eoi and adjust the logic.
 - Initialize v and cb_priv in eoi_callback.

Changes since v2:
 - Avoid and explicit != NULL check.
 - Use a switch in inject_interrupt to evaluate the timer mode.
 - Print the pt->source field on error in create_periodic_time.

Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/svm/intr.c   |   3 -
 xen/arch/x86/hvm/vmx/intr.c   |  59 ------
 xen/arch/x86/hvm/vpt.c        | 352 +++++++++++++++-------------------
 xen/include/asm-x86/hvm/vpt.h |   5 +-
 4 files changed, 157 insertions(+), 262 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 7f815d23078..2ee2332253b 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -146,8 +146,6 @@ void svm_intr_assist(void)
         return;
 
     /* Crank the handle on interrupt state. */
-    pt_update_irq(v);
-
     do {
         intack = hvm_vcpu_has_pending_irq(v);
         if ( likely(intack.source == hvm_intsrc_none) )
@@ -219,7 +217,6 @@ void svm_intr_assist(void)
     {
         HVMTRACE_2D(INJ_VIRQ, intack.vector, /*fake=*/ 0);
         svm_inject_extint(v, intack.vector);
-        pt_intr_post(v, intack);
     }
 
     /* Is there another IRQ to queue up behind this one? */
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 80bfbb47878..3fcc7073db2 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -203,7 +203,6 @@ static int nvmx_intr_intercept(struct vcpu *v, struct hvm_intack intack)
             {
                 /* for now, duplicate the ack path in vmx_intr_assist */
                 hvm_vcpu_ack_pending_irq(v, intack);
-                pt_intr_post(v, intack);
 
                 intack = hvm_vcpu_has_pending_irq(v);
                 if ( unlikely(intack.source != hvm_intsrc_none) )
@@ -242,7 +241,6 @@ void vmx_intr_assist(void)
     struct vcpu *v = current;
     unsigned int tpr_threshold = 0;
     enum hvm_intblk intblk;
-    int pt_vector;
 
     /* Block event injection when single step with MTF. */
     if ( unlikely(v->arch.hvm.single_step) )
@@ -263,8 +261,6 @@ void vmx_intr_assist(void)
 #endif
 
     /* Crank the handle on interrupt state. */
-    pt_vector = pt_update_irq(v);
-
     do {
         unsigned long intr_info;
 
@@ -337,58 +333,6 @@ void vmx_intr_assist(void)
     {
         unsigned long status;
 
-       /*
-        * intack.vector is the highest priority vector. So we set eoi_exit_bitmap
-        * for intack.vector - give a chance to post periodic time interrupts when
-        * periodic time interrupts become the highest one
-        */
-        if ( pt_vector != -1 )
-        {
-#ifndef NDEBUG
-            /*
-             * We assert that intack.vector is the highest priority vector for
-             * only an interrupt from vlapic can reach this point and the
-             * highest vector is chosen in hvm_vcpu_has_pending_irq().
-             * But, in fact, the assertion failed sometimes. It is suspected
-             * that PIR is not synced to vIRR which makes pt_vector is left in
-             * PIR. In order to verify this suspicion, dump some information
-             * when the assertion fails.
-             */
-            if ( unlikely(intack.vector < pt_vector) )
-            {
-                const struct vlapic *vlapic;
-                const struct pi_desc *pi_desc;
-                const uint32_t *word;
-                unsigned int i;
-
-                printk(XENLOG_ERR "%pv: intack: %u:%02x pt: %02x\n",
-                       current, intack.source, intack.vector, pt_vector);
-
-                vlapic = vcpu_vlapic(v);
-                if ( vlapic && vlapic->regs )
-                {
-                    word = (const void *)&vlapic->regs->data[APIC_IRR];
-                    printk(XENLOG_ERR "vIRR:");
-                    for ( i = X86_NR_VECTORS / 32; i-- ; )
-                        printk(" %08x", word[i*4]);
-                    printk("\n");
-                }
-
-                pi_desc = &v->arch.hvm.vmx.pi_desc;
-                if ( pi_desc )
-                {
-                    word = (const void *)&pi_desc->pir;
-                    printk(XENLOG_ERR " PIR:");
-                    for ( i = X86_NR_VECTORS / 32; i-- ; )
-                        printk(" %08x", word[i]);
-                    printk("\n");
-                }
-            }
-#endif
-            ASSERT(intack.vector >= pt_vector);
-            vmx_set_eoi_exit_bitmap(v, intack.vector);
-        }
-
         /* we need update the RVI field */
         __vmread(GUEST_INTR_STATUS, &status);
         status &= ~VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
@@ -397,14 +341,11 @@ void vmx_intr_assist(void)
         __vmwrite(GUEST_INTR_STATUS, status);
 
         vmx_sync_exit_bitmap(v);
-
-        pt_intr_post(v, intack);
     }
     else
     {
         HVMTRACE_2D(INJ_VIRQ, intack.vector, /*fake=*/ 0);
         vmx_inject_extint(intack.vector, intack.source);
-        pt_intr_post(v, intack);
     }
 
     /* Is there another IRQ to queue up behind this one? */
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 24d90c0a186..6744b88d20c 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -26,6 +26,8 @@
 #define mode_is(d, name) \
     ((d)->arch.hvm.params[HVM_PARAM_TIMER_MODE] == HVMPTM_##name)
 
+static bool inject_interrupt(struct periodic_time *pt);
+
 void hvm_init_guest_time(struct domain *d)
 {
     struct pl_time *pl = d->arch.hvm.pl_time;
@@ -75,35 +77,6 @@ void hvm_set_guest_time(struct vcpu *v, u64 guest_time)
     }
 }
 
-static int pt_irq_vector(struct periodic_time *pt, enum hvm_intsrc src)
-{
-    struct vcpu *v = pt->vcpu;
-    unsigned int gsi, isa_irq;
-    int vector;
-
-    if ( pt->source == PTSRC_lapic )
-        return pt->irq;
-
-    isa_irq = pt->irq;
-
-    if ( src == hvm_intsrc_pic )
-        return (v->domain->arch.hvm.vpic[isa_irq >> 3].irq_base
-                + (isa_irq & 7));
-
-    ASSERT(src == hvm_intsrc_lapic);
-    gsi = pt->source == PTSRC_isa ? hvm_isa_irq_to_gsi(isa_irq) : pt->irq;
-    vector = vioapic_get_vector(v->domain, gsi);
-    if ( vector < 0 )
-    {
-        dprintk(XENLOG_WARNING, "d%u: invalid GSI (%u) for platform timer\n",
-                v->domain->domain_id, gsi);
-        domain_crash(v->domain);
-        return -1;
-    }
-
-    return vector;
-}
-
 static int pt_irq_masked(struct periodic_time *pt)
 {
     struct vcpu *v = pt->vcpu;
@@ -257,35 +230,15 @@ void pt_restore_timer(struct vcpu *v)
     pt_vcpu_lock(v);
 
     list_for_each_entry ( pt, head, list )
-    {
         if ( pt->pending_intr_nr == 0 )
-        {
-            pt_process_missed_ticks(pt);
             set_timer(&pt->timer, pt->scheduled);
-        }
-    }
 
     pt_thaw_time(v);
 
     pt_vcpu_unlock(v);
 }
 
-static void pt_timer_fn(void *data)
-{
-    struct periodic_time *pt = data;
-
-    pt_lock(pt);
-
-    pt->pending_intr_nr++;
-    pt->scheduled += pt->period;
-    pt->do_not_freeze = 0;
-
-    vcpu_kick(pt->vcpu);
-
-    pt_unlock(pt);
-}
-
-static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
+static void irq_eoi(struct periodic_time *pt)
 {
     pt->irq_issued = false;
 
@@ -295,188 +248,153 @@ static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
             list_del(&pt->list);
         pt->on_list = false;
         pt->pending_intr_nr = 0;
+
+        return;
     }
-    else if ( mode_is(v->domain, one_missed_tick_pending) ||
-              mode_is(v->domain, no_missed_ticks_pending) )
-    {
-        pt->last_plt_gtime = hvm_get_guest_time(v);
-        pt_process_missed_ticks(pt);
-        pt->pending_intr_nr = 0; /* 'collapse' all missed ticks */
-        set_timer(&pt->timer, pt->scheduled);
-    }
-    else
+
+    pt_process_missed_ticks(pt);
+    /* 'collapse' missed ticks according to the selected mode. */
+    switch ( pt->vcpu->domain->arch.hvm.params[HVM_PARAM_TIMER_MODE] )
     {
-        pt->last_plt_gtime += pt->period;
-        if ( --pt->pending_intr_nr == 0 )
-        {
-            pt_process_missed_ticks(pt);
-            if ( pt->pending_intr_nr == 0 )
-                set_timer(&pt->timer, pt->scheduled);
-        }
+    case HVMPTM_one_missed_tick_pending:
+        pt->pending_intr_nr = min(pt->pending_intr_nr, 1u);
+        break;
+
+    case HVMPTM_no_missed_ticks_pending:
+        pt->pending_intr_nr = 0;
+        break;
     }
 
-    if ( mode_is(v->domain, delay_for_missed_ticks) &&
-         (hvm_get_guest_time(v) < pt->last_plt_gtime) )
-        hvm_set_guest_time(v, pt->last_plt_gtime);
+    if ( !pt->pending_intr_nr )
+        set_timer(&pt->timer, pt->scheduled);
 }
 
-int pt_update_irq(struct vcpu *v)
+static void pt_timer_fn(void *data)
 {
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt, *temp, *earliest_pt;
-    uint64_t max_lag;
-    int irq, pt_vector = -1;
-    bool level;
+    struct periodic_time *pt = data;
+    struct vcpu *v;
+    time_cb *cb = NULL;
+    void *cb_priv;
+    unsigned int irq;
 
-    pt_vcpu_lock(v);
+    pt_lock(pt);
 
-    earliest_pt = NULL;
-    max_lag = -1ULL;
-    list_for_each_entry_safe ( pt, temp, head, list )
+    v = pt->vcpu;
+    irq = pt->irq;
+
+    if ( inject_interrupt(pt) )
     {
-        if ( pt->pending_intr_nr )
-        {
-            if ( pt_irq_masked(pt) &&
-                 /* Level interrupts should be asserted even if masked. */
-                 !pt->level )
-            {
-                /* suspend timer emulation */
-                list_del(&pt->list);
-                pt->on_list = 0;
-            }
-            else
-            {
-                if ( (pt->last_plt_gtime + pt->period) < max_lag )
-                {
-                    max_lag = pt->last_plt_gtime + pt->period;
-                    earliest_pt = pt;
-                }
-            }
-        }
+        pt->scheduled += pt->period;
+        pt->do_not_freeze = 0;
+        cb = pt->cb;
+        cb_priv = pt->priv;
     }
-
-    if ( earliest_pt == NULL )
+    else
     {
-        pt_vcpu_unlock(v);
-        return -1;
+        /* Masked. */
+        if ( pt->on_list )
+            list_del(&pt->list);
+        pt->on_list = false;
+        pt->pending_intr_nr++;
     }
 
-    earliest_pt->irq_issued = 1;
-    irq = earliest_pt->irq;
-    level = earliest_pt->level;
+    pt_unlock(pt);
 
-    pt_vcpu_unlock(v);
+    if ( cb )
+        cb(v, cb_priv);
+}
 
-    switch ( earliest_pt->source )
-    {
-    case PTSRC_lapic:
-        /*
-         * If periodic timer interrupt is handled by lapic, its vector in
-         * IRR is returned and used to set eoi_exit_bitmap for virtual
-         * interrupt delivery case. Otherwise return -1 to do nothing.
-         */
-        vlapic_set_irq(vcpu_vlapic(v), irq, 0);
-        pt_vector = irq;
-        break;
+static void eoi_callback(struct periodic_time *pt)
+{
+    struct vcpu *v = NULL;
+    time_cb *cb = NULL;
+    void *cb_priv = NULL;
 
-    case PTSRC_isa:
-        hvm_isa_irq_deassert(v->domain, irq);
-        if ( platform_legacy_irq(irq) && vlapic_accept_pic_intr(v) &&
-             v->domain->arch.hvm.vpic[irq >> 3].int_output )
-            hvm_isa_irq_assert(v->domain, irq, NULL);
-        else
+    pt_lock(pt);
+
+    irq_eoi(pt);
+    if ( pt->pending_intr_nr )
+    {
+        if ( inject_interrupt(pt) )
         {
-            pt_vector = hvm_isa_irq_assert(v->domain, irq, vioapic_get_vector);
-            /*
-             * hvm_isa_irq_assert may not set the corresponding bit in vIRR
-             * when mask field of IOAPIC RTE is set. Check it again.
-             */
-            if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
-                pt_vector = -1;
+            pt->pending_intr_nr--;
+            cb = pt->cb;
+            cb_priv = pt->priv;
+            v = pt->vcpu;
         }
-        break;
-
-    case PTSRC_ioapic:
-        pt_vector = hvm_ioapic_assert(v->domain, irq, level);
-        if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
+        else
         {
-            pt_vector = -1;
-            if ( level )
-            {
-                /*
-                 * Level interrupts are always asserted because the pin assert
-                 * count is incremented regardless of whether the pin is masked
-                 * or the vector latched in IRR, so also execute the callback
-                 * associated with the timer.
-                 */
-                time_cb *cb = NULL;
-                void *cb_priv = NULL;
-
-                pt_vcpu_lock(v);
-                /* Make sure the timer is still on the list. */
-                list_for_each_entry ( pt, &v->arch.hvm.tm_list, list )
-                    if ( pt == earliest_pt )
-                    {
-                        pt_irq_fired(v, pt);
-                        cb = pt->cb;
-                        cb_priv = pt->priv;
-                        break;
-                    }
-                pt_vcpu_unlock(v);
-
-                if ( cb != NULL )
-                    cb(v, cb_priv);
-            }
+            /* Masked. */
+            if ( pt->on_list )
+                list_del(&pt->list);
+            pt->on_list = false;
         }
-        break;
     }
 
-    return pt_vector;
+    pt_unlock(pt);
+
+    if ( cb )
+        cb(v, cb_priv);
 }
 
-static struct periodic_time *is_pt_irq(
-    struct vcpu *v, struct hvm_intack intack)
+static void vlapic_eoi_callback(struct vcpu *unused, unsigned int unused2,
+                                void *data)
 {
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt;
-
-    list_for_each_entry ( pt, head, list )
-    {
-        if ( pt->pending_intr_nr && pt->irq_issued &&
-             (intack.vector == pt_irq_vector(pt, intack.source)) )
-            return pt;
-    }
+    eoi_callback(data);
+}
 
-    return NULL;
+static void vioapic_eoi_callback(struct domain *unused, unsigned int unused2,
+                                 void *data)
+{
+    eoi_callback(data);
 }
 
-void pt_intr_post(struct vcpu *v, struct hvm_intack intack)
+static bool inject_interrupt(struct periodic_time *pt)
 {
-    struct periodic_time *pt;
-    time_cb *cb;
-    void *cb_priv;
+    struct vcpu *v = pt->vcpu;
+    struct domain *d = v->domain;
+    unsigned int irq = pt->irq;
 
-    if ( intack.source == hvm_intsrc_vector )
-        return;
+    /* Level interrupts should be asserted even if masked. */
+    if ( pt_irq_masked(pt) && !pt->level )
+        return false;
 
-    pt_vcpu_lock(v);
-
-    pt = is_pt_irq(v, intack);
-    if ( pt == NULL )
+    switch ( pt->source )
     {
-        pt_vcpu_unlock(v);
-        return;
+    case PTSRC_lapic:
+        vlapic_set_irq_callback(vcpu_vlapic(v), pt->irq, 0, vlapic_eoi_callback,
+                                pt);
+        break;
+
+    case PTSRC_isa:
+        hvm_isa_irq_deassert(d, irq);
+        hvm_isa_irq_assert(d, irq, NULL);
+        break;
+
+    case PTSRC_ioapic:
+        hvm_ioapic_assert(d, irq, pt->level);
+        break;
     }
 
-    pt_irq_fired(v, pt);
+    switch ( d->arch.hvm.params[HVM_PARAM_TIMER_MODE] )
+    {
+    case HVMPTM_one_missed_tick_pending:
+    case HVMPTM_no_missed_ticks_pending:
+        pt->last_plt_gtime = hvm_get_guest_time(v);
+        break;
 
-    cb = pt->cb;
-    cb_priv = pt->priv;
+    case HVMPTM_delay_for_missed_ticks:
+        pt->last_plt_gtime += pt->period;
+        if ( hvm_get_guest_time(v) < pt->last_plt_gtime )
+            hvm_set_guest_time(v, pt->last_plt_gtime);
+        break;
 
-    pt_vcpu_unlock(v);
+    default:
+        pt->last_plt_gtime += pt->period;
+        break;
+    }
 
-    if ( cb != NULL )
-        cb(v, cb_priv);
+    return true;
 }
 
 void pt_migrate(struct vcpu *v)
@@ -552,6 +470,24 @@ void create_periodic_time(
     pt->cb = cb;
     pt->priv = data;
 
+    switch ( pt->source )
+    {
+        int rc;
+
+    case PTSRC_isa:
+        irq = hvm_isa_irq_to_gsi(irq);
+        /* fallthrough */
+    case PTSRC_ioapic:
+        pt->eoi_cb.callback = vioapic_eoi_callback;
+        pt->eoi_cb.data = pt;
+        rc = hvm_gsi_register_callback(v->domain, irq, &pt->eoi_cb);
+        if ( rc )
+            gdprintk(XENLOG_WARNING,
+                     "unable to register callback for timer GSI %u source %u: %d\n",
+                     irq, pt->source, rc);
+        break;
+    }
+
     pt_vcpu_lock(v);
     pt->on_list = 1;
     list_add(&pt->list, &v->arch.hvm.tm_list);
@@ -565,6 +501,8 @@ void create_periodic_time(
 
 void destroy_periodic_time(struct periodic_time *pt)
 {
+    unsigned int gsi;
+
     /* Was this structure previously initialised by create_periodic_time()? */
     if ( pt->vcpu == NULL )
         return;
@@ -574,6 +512,17 @@ void destroy_periodic_time(struct periodic_time *pt)
         list_del(&pt->list);
     pt->on_list = 0;
     pt->pending_intr_nr = 0;
+
+    gsi = pt->irq;
+    switch ( pt->source )
+    {
+    case PTSRC_isa:
+        gsi = hvm_isa_irq_to_gsi(pt->irq);
+        /* fallthrough */
+    case PTSRC_ioapic:
+        hvm_gsi_unregister_callback(pt->vcpu->domain, gsi, &pt->eoi_cb);
+        break;
+    }
     pt_unlock(pt);
 
     /*
@@ -641,20 +590,29 @@ void pt_adjust_global_vcpu_target(struct vcpu *v)
     write_unlock(&pl_time->vhpet.lock);
 }
 
-
 static void pt_resume(struct periodic_time *pt)
 {
+    struct vcpu *v;
+    time_cb *cb = NULL;
+    void *cb_priv;
+
     if ( pt->vcpu == NULL )
         return;
 
     pt_lock(pt);
-    if ( pt->pending_intr_nr && !pt->on_list )
+    if ( pt->pending_intr_nr && !pt->on_list && inject_interrupt(pt) )
     {
+        pt->pending_intr_nr--;
+        cb = pt->cb;
+        cb_priv = pt->priv;
+        v = pt->vcpu;
         pt->on_list = 1;
         list_add(&pt->list, &pt->vcpu->arch.hvm.tm_list);
-        vcpu_kick(pt->vcpu);
     }
     pt_unlock(pt);
+
+    if ( cb )
+        cb(v, cb_priv);
 }
 
 void pt_may_unmask_irq(struct domain *d, struct periodic_time *vlapic_pt)
diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
index 74c0cedd11c..384d2e02039 100644
--- a/xen/include/asm-x86/hvm/vpt.h
+++ b/xen/include/asm-x86/hvm/vpt.h
@@ -23,6 +23,7 @@
 #include <xen/list.h>
 #include <xen/rwlock.h>
 #include <asm/hvm/hvm.h>
+#include <asm/hvm/irq.h>
 
 /*
  * Abstract layer of periodic time, one short time.
@@ -50,6 +51,7 @@ struct periodic_time {
     struct timer timer;         /* ac_timer */
     time_cb *cb;
     void *priv;                 /* point back to platform time source */
+    struct hvm_gsi_eoi_callback eoi_cb; /* EOI callback registration data */
 };
 
 
@@ -151,9 +153,6 @@ struct pl_time {    /* platform time */
 
 void pt_save_timer(struct vcpu *v);
 void pt_restore_timer(struct vcpu *v);
-int pt_update_irq(struct vcpu *v);
-struct hvm_intack;
-void pt_intr_post(struct vcpu *v, struct hvm_intack intack);
 void pt_migrate(struct vcpu *v);
 
 void pt_adjust_global_vcpu_target(struct vcpu *v);
-- 
2.30.1


