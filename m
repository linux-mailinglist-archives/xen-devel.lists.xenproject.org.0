Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE0D3F2949
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 11:36:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169377.309388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0wl-0000u9-1x; Fri, 20 Aug 2021 09:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169377.309388; Fri, 20 Aug 2021 09:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0wk-0000sM-Uv; Fri, 20 Aug 2021 09:36:18 +0000
Received: by outflank-mailman (input) for mailman id 169377;
 Fri, 20 Aug 2021 09:36:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFwF=NL=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mH0wj-0000sG-Fx
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 09:36:17 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8a24214-3e74-49e1-bc7f-2f08eef3c0ee;
 Fri, 20 Aug 2021 09:36:16 +0000 (UTC)
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
X-Inumbo-ID: d8a24214-3e74-49e1-bc7f-2f08eef3c0ee
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629452176;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jXibr+Nnsf1MfsiBzrGUEqjCa7pFGc3GauKAznvQz5s=;
  b=B23u5BUJQ6yNy5yXvatgCmm7NMlyQY5q2XAdf8/5y8Xz+BZ1asIe5Vf2
   Cn97Q6KftPhCEP2DNRRSiZMufmrzbGer/g66MS56aKcExGhdYCDox8tB0
   azaqV5ybK8oH5GTrfxtelcwg/zceU1Sz/ip//xVu36fWKahekq4bMN/g5
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bGIDl0kWx6cVGvcymVFA5EYJNLi484CRKuvZMJ3Uc3kSLWDgzQbruYX30HNDYHquM+2y9Y5D/B
 3f9t2OI763KZYas6FnNIewKOsBTSFlhZGYFNyNen5M1GX9RBZDMw+8sv8Xe7rEJrrbm9obQ3sQ
 xnzeT9d2Vut1LHbeVbSD0u++Pw7LsXhPUxDY9Ygvvtgn37bXKVeJXSudRMC15M8dyTyqtexwBa
 +TQ66MQniAmXeudI06U+l200p3cfKHn5fUZo5WdoysldC7gkZ7c0CoaSCAXwNptq4mOOjjlUMZ
 g0HM0vS3HPcY8CBFCJgynVXu
X-SBRS: 5.1
X-MesageID: 52633317
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:TRPgF622y2BYeIIuF1LldAqjBTxyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJU80hqQFnrX5Wo3SIDUO2VHYUb2KiLGN/9SOIVyHygcw79
 YHT0E6MqyLMbEYt7eL3ODbKadY/DDvysnB7o2/vhQdPz2CKZsQiDuRYjzrY3GeLzM2Z6bReq
 Dsg/av6wDQAkj+Oa+Adwc4tqX41pL2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTopOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsKuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DgfuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjPkV1FUsZiRt0kIb1C7qhBogL3S79EWpgE486Ig/r1bop9an6hNEqWtjo
 //Q9dVfLIndL5cUUsyPpZYfSMbYla9Ny4kC1jiVWgPIpt3c04lm6SHlYnd29vaD6Dg7KFC1a
 gpA2ko+VLbRSrVeISzNdtwg0vwfFk=
X-IronPort-AV: E=Sophos;i="5.84,337,1620705600"; 
   d="scan'208";a="52633317"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnBwNy8nkIqDEkiPV4SiKyV5sY1zhqexFj0WGXp0nHm3AsBeyucwNNJg/jpH2UqfO+dIUAhm82BUtWcZop91Kd7/CYPxNQkuX1Y8DIqEKf4yxZR5GQ8MANSCcFx/99T5Pii6I9qEAlcoGf4xMyOrVR2zRhmnrP+oiHqpVM0SqZiq+maRaavDJLqoYuqcX/fVCzqNYjIKSp0KcO6udCU3PGATTyKQcroGmXOK6KjipfzAaBQjybKDyi44cofioJnXFU5nLytELSFkDZd+GgFY3ZfZuDBKWlfC+PtuPN/ugK1iVoM21OGud46j5lP68/kVdfuuP4zgbx0Yvh3pBY7YPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXibr+Nnsf1MfsiBzrGUEqjCa7pFGc3GauKAznvQz5s=;
 b=jQ+GUmOhDN4RSorNT2nFlzStvA7CvPGFKdaIDVcuGql7vQl1CAAi6sS1j1kCm6ebQuPTy0dxnL8A/p5S/SfHtrKp+QWyt7BvljI3bxIAwdX0jz2r8bM4iJ766SL5x812nElmu4VhPgvTBC2rRb385oBbYZAJcahfmgpnYTPA1E2A71I7VUBciBAH45a47R5eFQ7h1/UBcRDWQte2CXUtlnAy06ycJho5MTXBmfBtmewdaL70zaGuXE8NF4G4jceaZzlkmuWO2mDdluqOnqXvXKBfsgc1vq9BUXez9v+R8l9pe3Ui87qnp36gGHZBdihsjdUZGQDl3m6SScvmDycB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXibr+Nnsf1MfsiBzrGUEqjCa7pFGc3GauKAznvQz5s=;
 b=HqsrjfBNSR54QrzBa/khTN19QyfkevMYcLLxAY9RuXm+NoJdB7TlouDcl8bTXqvokk27d6lBFF5pZK7LF4OOSJv4x6iZHOs2GIdWIJXDWF2eRSOyICQIsAfEbx+QKI/iQRrOUo7kJJWpVq6H08m4+GJGQP0WijmU8yrlLgFyDzc=
Subject: Re: [PATCH v2] x86/PV: account for 32-bit Dom0 in
 mark_pv_pt_pages_rdonly()'s ASSERT()s
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <486bcdc5-8b61-3ecb-6a18-6ad361e42cdf@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bc16afec-3d18-83f5-69ff-06225266e346@citrix.com>
Date: Fri, 20 Aug 2021 10:36:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <486bcdc5-8b61-3ecb-6a18-6ad361e42cdf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0064.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da11bb37-f063-490c-31eb-08d963bdf339
X-MS-TrafficTypeDiagnostic: BYAPR03MB3496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3496F2553CE1327FA3AECF13BAC19@BYAPR03MB3496.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AzWMHyj/oxs+TaiTWbyuak8s5tYqv6nmbU01+tgBviGCr5zIzOphBzeslwgUZ98B8ZmRdcqKIUrY6kuvAYA2F8PUgmDYaynRr7T5WTCPrp8mUQmdH/ePhIoGqikOKIUNrgo1D4bm2foX1NddoRF4G7qiIQS2lAhAE2LyXiud+xbb92pcwhcL26/DvP7oEyMJ1ls60LRg66iWTsJmqzVlAc7ZSj7XGwceoFFxyzgaBmMOrEQoZTwO4AQwnObCB2MVDIKmuyMkHQpIvSKOgfaaO8Wa55epaUZVNy8lIQzDo04Q1xrGJM5SACMDccT1jo6yul5nqmSrl8cZdQ+UVv5mRhdxYNc6WPMIbnElB+Gt/47Rv436jCtsxUwEt2M09y4KE0Sra9cjDtZoLgTjmnaCjF/Yx33V2fyACR7N8p12MnPS6n35Y8QVz/cm4PhuAiWwqu3YNNSD5rfhqNeuNdm5r35E8wKDsTEExOzWkbpq0S/U7Oubt6Rlz8o56QIL7LCRI4dLz+ldcV5A5LDaxYTcOMbBSrrmBWeNERWUZZTxJg10iRf2PXXIaWKnXACJOc4DOJMfvTCo9EEi+5XkkJDczMPYpQixrN42LN1Ht8/u5pK6j888Yx6eNbB7GUJu/6kaXkEZ1m3NOd1YyqCMSqXN3oddl8vevZ5MIKnFsJVLEIdKUtgXo7v0TjURY0lgCORs2DeM3TIKWZr9GO4HifQeF5XItol4PiMcAhtnD+f0nCg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(6486002)(66946007)(107886003)(31686004)(36756003)(2616005)(31696002)(4744005)(86362001)(6666004)(66476007)(186003)(66556008)(53546011)(55236004)(2906002)(5660300002)(110136005)(26005)(956004)(478600001)(54906003)(8676002)(8936002)(316002)(16576012)(38100700002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE1NVWp6UGJSRWpJNDgwRW1TVjB6NTJadVVzR2lyZHE1WnJ5d3dFcndVZ2d3?=
 =?utf-8?B?S0VWVmMrQUlUYkJaRVd1aW4yRXhqcmk4b3hDQjZ0NnY1c0pkU0hNcWdHVHNB?=
 =?utf-8?B?cjZYZ25iVDdCdzhWODNiZlpSY0tyWWNIVmVESlBROW9nOXlmMlQrOUVyMkMx?=
 =?utf-8?B?ZmZGL0NHQ1pBa1EzN3NKVXAvUS9pd2RqRXhsVWlaYW9DNjhmZXYvRTBwUjgr?=
 =?utf-8?B?TXdpMVYybDRnQk13My9PZTd1NVd1L25mWEFuYkkrUXI0YVJydUtGOWxoYzN0?=
 =?utf-8?B?TXJJaFBVZHI1VHFOQXRqc2o4ajEreENzSDZMbm16Ukw5RDZLYzc0RmhvSlVa?=
 =?utf-8?B?TTFDQkNKTzdhVHk1T3RVdkpJWUNyemRJU29XMDUva3M4L29WTUtyeEVRMXhQ?=
 =?utf-8?B?aWV5aUpvZ2ZReE1nVEFyRWUyOHZGd2hKZTVPc0RsN1crKzg0Um8wK3Nvemd4?=
 =?utf-8?B?SU9lU2xKZDRJS3k5ZlNNUGdFaVRSMUtlcWpwM1NLNzdTK3c1ZEdnczJKR3NG?=
 =?utf-8?B?NUl1ZjlhekJRRWx0bmh6NTljVHBzR2xtUGRzbExwcFlldnpHdGNCeHE0eWxF?=
 =?utf-8?B?U2theWpCS3hLenArNitEVXdpck5OU2JFb1VRVGtHdmw4ZkRsQ0FGVEszcGpJ?=
 =?utf-8?B?aC9TMGtzcnhBdU9TclhEamJTUDlhZ1l1Vkg1SXo4UkV4ZlNONjBXSmxrWmJ2?=
 =?utf-8?B?M1lFcndEUytnRXM4UXMycnN3bU5haWlNWThkNExDL3VqSkUrbDRlRHpsSU8x?=
 =?utf-8?B?TFk0VTRBSXNVQWVWVjhmczNCNEZPZ0l3WGhUN04vV3dzcy84bGFtTU02cG41?=
 =?utf-8?B?TmQ4M1kzWU9mbE92UjNTcFBtMm5qdGJKRHBiMHZIUmxkQVhRYyt1bGk2ME5i?=
 =?utf-8?B?TkxHQlNsanFCTk5iOEhYVEd1bGNYU1BJWWhqR0paczBDUXkzOWV4VnhwRGd6?=
 =?utf-8?B?L1FoVXIzR05oakozUlltamFRZ3ZuNktaSjZpSTQ5YWY0T0h2MGJwekFZRG9Z?=
 =?utf-8?B?dGpPUGRkNjhCVWJWbGhNTjkzeWJsUE5UTWVWMU5VeG9HeHFOcHc0QVZnbGZE?=
 =?utf-8?B?Z2NQeHJTbGNmNlVvZDRZZ1RoNElxRzBxeDJCSWMvbGtRdTZtM2tyZG5OMnlJ?=
 =?utf-8?B?T3pSSDUyZTZyN3JhcWNUaFAzL05NQU1vaDJuUWNzSEQzcm9uZ3phSkFrQ3NC?=
 =?utf-8?B?LzNlNXRYeFYvS0xZQVp1THFHZkdEUGlmUE5xV2VNMVZwSjhNeU5VYTQwR3lK?=
 =?utf-8?B?ZkR1VkNrMlhiNnphZE9zTHcrNnVHb0E3RUUvQTJmWmlGNTZQdGoyMURWa3Ju?=
 =?utf-8?B?djVzSTRmR3lDM01ONEtlWmZpVkpkUS9qSkNTdFlTR25QSjMwcVlrQ2RZWU9Z?=
 =?utf-8?B?WVVoTXgyZ1NPd0JoMzN2YWhEbitVTWFwdHFjQlIvMXd5U09ENHBsNG0ySGZU?=
 =?utf-8?B?cklzVFdEWXppMDdXY21ObTVYYVdEWjErcXIzRHVJOU9oT1lrS3A0Ui8wZm9t?=
 =?utf-8?B?eXJneHg2TE9ocktFSElaanhtQ3hQTnpjUTQzcm45TmZTWVhBWTUreVRFRlQz?=
 =?utf-8?B?VVpPaU5weno0NEdmTUN0ajRNRnR2aDFSSWwzNDgyK0NDZFpBZVVBOXZBa3hL?=
 =?utf-8?B?Ui9GRmJpeGM3Nmo5Q3BlQ3Jxb0lUdElzOEluQisrMDBNRk8xMzFNaEs1d09J?=
 =?utf-8?B?M2d0MjJXME9Xd2lGMmFxQ0J5RHFSc2d3MEpKeDczMW9lMWZISkMzaUJ2UU1t?=
 =?utf-8?Q?pAWrnKFZOIyTQrBop0QvvR6+BrL7umEToqRo48I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da11bb37-f063-490c-31eb-08d963bdf339
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 09:36:13.2974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dqyHhuQ3AJuFIvcbjYcywZQIiP4Ajq32GgCAGPtzAT6Fo5q1Ny5zL92i8Sr1b/nCtjhdOFUOJ6ev6zSTf67LDNTj7d/aEnNebs1pp0u128=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3496
X-OriginatorOrg: citrix.com

On 20/08/2021 10:32, Jan Beulich wrote:
> Clearly I neglected the special needs here, and also failed to test the
> change with a debug build of Xen.
>
> Fixes: 6b1ca51b1a91 ("x86/PV: assert page state in mark_pv_pt_pages_rdonly()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


