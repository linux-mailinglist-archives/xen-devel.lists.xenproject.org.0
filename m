Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8639D2F7FBF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:38:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68371.122420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0RBR-0003rS-Pn; Fri, 15 Jan 2021 15:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68371.122420; Fri, 15 Jan 2021 15:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0RBR-0003r3-Ma; Fri, 15 Jan 2021 15:38:41 +0000
Received: by outflank-mailman (input) for mailman id 68371;
 Fri, 15 Jan 2021 15:38:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0RBQ-0003qw-TH
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:38:40 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b066343c-14a5-4c6e-8ec7-b29ef17a568c;
 Fri, 15 Jan 2021 15:38:39 +0000 (UTC)
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
X-Inumbo-ID: b066343c-14a5-4c6e-8ec7-b29ef17a568c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610725119;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=y7dBq4xQRw0pO1pkDwDJFDfVE9Pnhzej+mdxl/n+yjc=;
  b=X5Eph3K4EuT7g+AcQGz3hOlfSJ2O7Hsl0hWS7wkePtYcez+V2lJl62QD
   mH5I6gFl1WrDygDWXUm1o06ng8y6XDjqH/pDdUmPZu4dhRJ75BxPBhIvv
   hIoh9t2+CHX0wmmtm9URSugKYFeNJKtNWFHFMiWdW4mwgYvkSz9wgNSlV
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1iRNl+51ktj7NvaLhU7FCPT09ecoLO3GjNqNnSifyjmy8WuwF6Hc0ePH13d4wfbI3LnKQPEUra
 qM8uIxM6kxv838ftA7Dow07C2pGW3SeJ3aTP+lyBFzCLY3m/UqpgjvHEezBI3VWfitHLVCG/gw
 qACRJyqHG8fFRj9H35lwAv5vjahYO8+BRx/jI8G4Xl7aQqL/ILEz4B+1ne1NGlZzw5O/GWY9sQ
 xhYjYGFfXSyNEjIrx7Dgvh+xOBqvQnjuPFYK7G7RZ09UU/GhsulFhxEtfy1ndKOBGbhh4jJYnG
 bQc=
X-SBRS: 5.2
X-MesageID: 35183600
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35183600"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEQEIzNpKhvuoMoIaj+r5euL6D7VkmO9Lc2il0lJtSshQO7wGP/M6P3uv0FoPdDSdRBMcq4lHbbqf8ywWBXUsVUn3Wrbgt21ZJ49QeAzbVYwJAvxQ3tSfNpvBRRYjw8WFbPTJvauRHcTyd5ta19JZMsrtXZhYm4CGEezi2k8R0ZShbNo7kD5jqbbBEwVWq6I2cPJ8XD8UyoptDIrGu7qjZ7CzicTSFtTe+qZqVFDBxDCGJzHtlcWVvZC3KCYVtrco6W/ripL9qRHgxSA8VtJc+FPe89x0Rbo2BSFcC56CAMUWWebSrrVR5uA0wj8I+LirzTUPVH7mfRADhsVWCD94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1EemhJ8PKhGY9gy/JwGUSAc8pDDvC4+uavCgKWnwDc=;
 b=Vq0NexOt9HKIvljiTs7/Gftev27S+QtPP1P9KPArDHUkMiXf9wb2P9sQn6+9u1Vf+yaB8C6+EamWmL+ufaBiB0Ok2Lfll8PQKPU76wu4GikmzLYS8pShzOSAAPEks3SrGT2wIZWs5TEES8A/Mfr25mFW5rM/bLx2eTWxt96SjWcz2FCqHZjOoXqTMzH2VZz4QLmI88woWL6zL35PJZQugk/aySmUcsXYOVyrcQEovapb1CNc3qPKl5NbljeHbuo3kI7N1KFbpSXo5bQmzxZQh3TSu9Uo7jpw29zQz9sBlvYGe9GyGbzOm2/fwzDvSgETppCPqv1+46ApspLHCCQdfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1EemhJ8PKhGY9gy/JwGUSAc8pDDvC4+uavCgKWnwDc=;
 b=tFoOWaeB60cQyUdvzzNRY3oCiaYV0Zcac9jnlXRG4kxG9uLdpR3UKKspztkS0/21BbuSh7w3ZrusspZMyE8cBC9y0rFKaAUfl2pMkroYGVo2/BNnyjCARqflvrAwR+xXNs4U6lgVjOyYG2og0Z/4MzfU0jVE0NujKhXV7fQaGU8=
Subject: Re: [PATCH v2 1/2] gnttab: adjust pin count overflow checks
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <43168334-20af-a0ed-95ec-8eef5200877b@suse.com>
 <d37ac49d-5e36-6f35-be73-83f8e1e8f23e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5268886e-8b21-db35-9183-887570c0cb14@citrix.com>
Date: Fri, 15 Jan 2021 15:38:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <d37ac49d-5e36-6f35-be73-83f8e1e8f23e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::21) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e4fee95-8d89-4f99-7c20-08d8b96b9e9e
X-MS-TrafficTypeDiagnostic: BYAPR03MB3543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB35439DB150CCA2AC1A3ECFFFBAA70@BYAPR03MB3543.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GFiDO1+2Fn5Pnbwc4/R0oOiu0WmBGb5gFk+sypSym+Nh0x7FinW5LveVn4GMHdwgBAu+MG5g1RI/YES5I/ypnCkgqXP+MtsIzJKSbhiF7b+5JDWimBkf94HiPhT8G4C+GQOkgTLL3aNX+pEwDflN2pKDpgy9c58CsJSF2KYsKb620yegx7civz1TqZuzEE88PX105m0bco33QWp+iLxNNxBc1iM7B6q/qeHd4Oq+takEo5eNhEso2OJxIb3vvBP4P6y3iSzT9o+ydA2tLFSdrG6d+fnDzk67gziB4RlaL7xpgICi96OyBmOgpb/7uTQIdpIcQ2OVGdnzKxMnXNssjhYxnU8ZvkamWKVCP4olvhTka+QGmyQH/udUmTLQwGAa6J3iKdfOC9BMZveVhX8y7QxIWFNocs2IrKfH58j+pW3fDz3m2Vv374WUt/hn2HKS5I60ARd3iqng/jY37T7Jy9KuZGLNlTpqGkzTTlxBff4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(4326008)(478600001)(6486002)(26005)(16526019)(86362001)(186003)(2906002)(956004)(31696002)(54906003)(110136005)(316002)(16576012)(53546011)(2616005)(31686004)(83380400001)(6666004)(36756003)(5660300002)(66946007)(66476007)(66556008)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MjdTSVQ3djNVKyt0bjVYSFJKWTl5K0pmdXVpSGtxQnA3UzBaV0tsMGt2SjRv?=
 =?utf-8?B?bkFBenkrUUcyVW9qM21IMitiNzFuZmhqa2dCNWlHV0NWcEl6TzFCUCtwci9B?=
 =?utf-8?B?OEZLUTRlVEtPRVVHVEtwVlhnOElzUElVUWJiaThGWGlZaGNPR3g1UE9MZkp4?=
 =?utf-8?B?Mm9Kd1E0MXg0Rm1KQno1NDdNK3NOZDFkMklRRWlvQUNQVDVpdHJ0NENwZXpM?=
 =?utf-8?B?Q0p6MWVDMTdMN0p4Y0Fxd1gvMTk0Ulhybyt2VXFBTFUrTEI1anBoWEJaSFBE?=
 =?utf-8?B?MzVhbGY4V1Yra3dKM2VhSW90U1JkUG52bXA3YVNyalUrR25mdzJiUjg0bWVp?=
 =?utf-8?B?WGhPcWRMeTNBY0JMMDJreUJSQ29VdGR6aG0waDJ0Qjd0aVRhdTdRcUFxd29M?=
 =?utf-8?B?cTJpaXZXRHhJQVhJa3hrSGFkTkptb2RUa1pBNk5pVjJvUUpxeGYwMHduTHFL?=
 =?utf-8?B?VURmd0FodWJvNFNvSmJ3NkRVQndZL0FwekVacjAzMVVjdUZoRDRrR2ljUzlm?=
 =?utf-8?B?WTdMVWJTVmtnUk9KcWVuMkhZZWl4NDdOWFRnN0tlRjlVL1BBRkFTUGhCcm9p?=
 =?utf-8?B?Wm9Ja0VKRE5vOElneVF6cjF1WTVZTmM4dDVxSWIxNnVjSFB2R014K1BQVUNZ?=
 =?utf-8?B?WWdET3RyZmhuRHZRYmhieS8yQzc1UDl2dG5tY1o2Y0ZNVWNlMWtnMVcyeHZI?=
 =?utf-8?B?WmVxalVOb2MxUFpkVVc0QVNTYjBvVVA1cE5wcGdqVURhd0xMR3VDREZESDB0?=
 =?utf-8?B?R0U5N3pEc2p3SEhYKzJzU3J4NnFBd1ZpOFdnZExhYnlxaDBiWExWT3M0RUtJ?=
 =?utf-8?B?ZnIyTmo4VFlyKyt6cndEbmgvT3VTMGVZWGJjcXhNTU5Od2laOXlaV1EyN1lI?=
 =?utf-8?B?bDZqWlAybk9GdktEMjlSdU5uTEp1N2FPWEw3dk9TclVZcTRvWkRiY0VlWHdw?=
 =?utf-8?B?L0ZzSnYvVVJNTXRaQ3BjWTJ4SFlERTFrbkVuRXRsRHhUVHJxbWRuY2htRTc4?=
 =?utf-8?B?NlFzNDlSL0hTeWY4ZXRCSlN0OWhaTEtPTHVwRm9nRXRCQks3dVZjRUxVNkRW?=
 =?utf-8?B?MnFUL29TMFNaZkJaaTNFTW9rL1FXT0Q0Q0pmK2tUdEo4S3hPdlhVeHpKRmxP?=
 =?utf-8?B?SWhnUE95ckVBSEkyaWdpOHNpajgwdDdqdUtpOXU0TWRsYW1RdDNKL2FJUEVQ?=
 =?utf-8?B?NHpvTHYwcFN1d0ZsbHYvd0o0dUp6UjFYL2gwQjdxS0RaTnhRdG1UWnJHNUd0?=
 =?utf-8?B?MnpJdHlhVnczVXVyb2tYSUhoWG1URVM5SEp4RWlzZW5qVGEzbXNQcXJhRExD?=
 =?utf-8?Q?f8dd5+mYPiz37rXxyCdjfMADs78cvfHu3Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4fee95-8d89-4f99-7c20-08d8b96b9e9e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 15:38:34.7940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0S8RN4xBFTdwTUgWuWqFROvylVl4Pi+SvCarZOzF6fFd0Mdte3ByBB9rXgOSAa3wHuUmykTTg3guARHfUrGCKx1SALKmowGtcnSUvgF23xY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3543
X-OriginatorOrg: citrix.com

On 15/01/2021 15:14, Jan Beulich wrote:
> It's at least odd to check counters which aren't going to be
> incremented, resulting in failure just because prior operations may
> have left an entry in an unusual state.

I wouldn't say it's an unusual state.  It can happen legally when you
map the same gref 128 times

Why a guest would do this in normal operation is a different question.

Perhaps "prior operations may have reached the refcount limit" ?

>  And it's also not helpful to
> use open-coded literal numbers in these checks.
>
> Calculate the increment values first and derive from them the mask to
> use in the checks.
>
> Also move the pin count checks ahead of the calculation of the status
> (and for copy also sha2) pointers: They're not needed in the failure
> cases, and this way the compiler may also have an easier time keeping
> the variables at least transiently in registers for the subsequent uses.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

