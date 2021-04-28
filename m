Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4D936D967
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 16:18:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119410.225885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbl0a-0003tB-RS; Wed, 28 Apr 2021 14:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119410.225885; Wed, 28 Apr 2021 14:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbl0a-0003sm-O8; Wed, 28 Apr 2021 14:17:44 +0000
Received: by outflank-mailman (input) for mailman id 119410;
 Wed, 28 Apr 2021 14:17:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X8fo=JZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbl0a-0003sh-09
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 14:17:44 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a646a2f5-b77a-4b3a-aa45-c1fd9b027881;
 Wed, 28 Apr 2021 14:17:42 +0000 (UTC)
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
X-Inumbo-ID: a646a2f5-b77a-4b3a-aa45-c1fd9b027881
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619619462;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xVrOoZYNt/VnZPD14bxlvfO2RS4K5RisfalQtDud74w=;
  b=fC9j0Vuo8dumoQ0WRaAYlStwmCyG0flD+fFVPBht7va9KVJv0iNleZW7
   phlxVm/zTNycR7rL9Xwb+oSPZRs6TIZiztSC3hSm/OTv8EOd9yD7886KL
   zy4tU+yQOCisdmOVMKSF3z/du6zVU3jZ6R2sKKJLNZ/tbe6TlPEILcCV6
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HJt9diM2L5ww4eZ9Pbns2umRI4QABfWX/MA67IrHgM20SUpsVrl4E6o5xtDBW0vLzUbxwzD4Tn
 DpoZC5UutcXp2LM8/dLbm32h3Bo7Y3T04gX6SSJR2ogdzync4c/J9vlXUA5ICEcxWpnukuQaJ4
 eThPb6cZVoHP+qHcnDGPPVO4l6yMR6Nx3X8D8P4hiLAgBhFAQIvezdeczVD482J3r9L/cAMmx1
 j2GKizSNHbaD0QoFwfDRek6+cQ5e2Y51t7mbmCVQROzGLO6hewYr3TVDeWqqoDFpnqNAVcx4eH
 7fY=
X-SBRS: 5.1
X-MesageID: 42608502
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:sRiO1KDZjNbQeJ/lHegDtMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPvfVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VLdMgXE3Kpm2a
 9kGpITNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0McShBQchbnmBEIyycFVB7QxQDIJI/Go
 aV6MYvnUvfRV08aMOnCn4ZG9XZr9rQm578JTIADRgr6A6B5AnYl4LSOR6ewxsYTndz0a4vmF
 K17zDRy4eCl7WAyhHa33LO9Jg+orrc4/ZKGcDksLlvFhzCkQCtDb4RIoGqnDdwm+237UZvrd
 +kmWZcA+1Wy1f8Ol64ugHs3Q6I6kdd11bHxUWDiXXu5ezVLQhKc/Zpvo5SfhvH50dIhrgVu8
 gnrgHp1esiMTr6kCvw/NTOXR1x/3DEx0YKquIPk2dZFbIXdb45l/1twGpuDJwCECjmgbpXdd
 VGMce03oczTXqndXzD+kFgzNuwN05DZCuucwwpv8yY1CVuh3Zpz0cU79x3pAZxyLsND7ZD/O
 jKKaJuifVnSdIXd7t0AKM7TdKwEXGle2ODDEuiZXDcUI0XMXPErJD6pJ0z+eGRYZQNiL8/go
 7IXl90vXM7EnieSPGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uu9HImYRcPuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFOUIp9cAXU6UqM6jEPyoisXrNNLoYJb9GzctXW3yRl
 EZWiLoGclG5ke3HlDihhz8XG7sZ1zf8Zp8HLOyxZlW9KE9cql39iQFg1Ww4c+GbRdYtLYtQU
 d4KLT71oO3zFPGulrg3iFMAF5wH0xV6LLvXzdhvgkRKX75dr4FppG6cWBW132XGw9nQ6rtYU
 hijmUy3ZjyA42bxCgkBd7iGHmdlWEvqHWDSIpZvaGf+8H/eNcdAow9UKJ8USXHfiYF2TpCmS
 NmUkspV0XfHjThheGOl5oPHtzScNF6nUOMOs5bqXXWsG2GvsExTn4nXzqjOPTnxDoGdn5xvB
 lc4qUfiL2PlXKEMm0kmtk1N1VKdSCqGr5cNR+EY49Vg7jvXwl1QQ6x9GWnoiB2XlCv21QZh2
 TnIyHRXf3QGFJStkpV1bvQ/Epuen+QeF9xbX5GoZRwfF62z0pb4KuuXO6ewmGRYlwNzqUmPD
 bJbSA7Dyluy9q0vSTl1QqqJDED/NEDL+bdBLMsf/XvwXurMpSPjrxDNeRT5oxZONfntfIrXe
 qTdxSOFi7xD/ok1mWu1y4YERgxjENhveLj2RXj4mT94WU2BuDKJk96A54cONOR4gHfNr61+a
 Q8qehwm+S+Mm/8MIHbjY7WaiNOMRPVryqdSfoypZVdoKI1s/9SEvDgIE31/UAC+C97CsH+0H
 46auBcxpvqP4d0Zcwcey5D5DMS5Z6yBXpuljazO/M0eFEmsmTSMNyI6YfZsLZHODz3mCLAfX
 2ktxBH9/jLXyG/xacXJqI5L2NRclU94h1Zjaq/XryVLAWhbOdY+lWmdle7bb9GUaCAcI9g4i
 pS0pWtn+WNcTD/1x2VlTxnIrhW+2LiZc+pGgqDFapp9NO9UG78zZeC0YqWjD3tTyG8ZFldrY
 pZdVYIZsAGswIctuQMo2OPY52yhFkknVtY6SxmkVCo+rHO2harIWh2dSvDgptXWjFPNGOvls
 qty5nC6EjA
X-IronPort-AV: E=Sophos;i="5.82,258,1613451600"; 
   d="scan'208";a="42608502"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLk3XEmV0jSARIVUxdgvaAVlN7yimVPuq95w9AicAwSc3QBkM2WTnNqoGrHGVvX9xWUmT0EPvbnMcml58AJTkjX78b7NOHq7orBOTqb8BUnI7od9mb+QufwcdKLj0MLltQgDfrtJIe9p5MewAeNBeBtQBq5+jqWDE5Z8zZINO0tsUH/hqPt7SoCc29j3yDJeOCG5Ny1/tQH86C6DmZut4jllzQ5NYMeitVrtNkFRkywLJtuJx5zURsfqoTIsnk9FmWWvE7al4o01GY+eKA+CAAxjTSo/moZ5c0X6GTRG/k8Kd2DsC0ggUoAouPfj/ylQTVMrq36rxkIWcndRxrVOXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+WP1I2cTtE3ypHvFpo6R6D/N3KMJYfW2us5beYhPps=;
 b=bHHLrZc5J4jCCSIjBRk+njTS8I5Ye65eu2LK0u0/30ubgGr01u0sDzC2LMSzFps4mgGNOJuPkpC3w/WcOZYF9QlSCEIj7Wfn6JdiJvy3ciqEUP/HIEfSon88tvrtUWABLgwJ2n+yVXh/omc4rjUiVU8kBjUdW/brwBbGPFKsajauLj7MzGQ0CbXHdWin+tvGRxOVQ9a/efHazyxLQzZ2UzRFpYEL70S1gNWPgPNWRKC1Q0LZopN3neldOaQmug5zvFKo5uX+DLiyZGxBSZEAf+I7kHSljkK8Ee9aiAfXDVHXNmZm9LnXu1GOiKAmuSfUHMJegJHpGwpLjzKAoAeEeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+WP1I2cTtE3ypHvFpo6R6D/N3KMJYfW2us5beYhPps=;
 b=DJZpPB+IPW0Mqn+FLrum/vNfIjMkSMiYR2QbNxRN70sScIVmNn3SiWVqGkcpbpKdjvrOCqPMTr/bQJ4H+9awdJBluR198NQvOkMGbe3urUZc3Oz7UixvvRR+klu24QJHsWebrlRTY5wVc3MnVY4oB83ch2tZr8Qf0FH2lYnOF1c=
Subject: Re: [PATCH 2/3] x86/svm: Enumeration for CET
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <20210426175421.30497-3-andrew.cooper3@citrix.com>
 <a5d73b34-8200-ae0c-6c91-252ad2812f3d@suse.com>
 <f50d2a46-ef8b-d867-4773-aa291586e26c@citrix.com>
 <55c50b27-e8cc-873e-e768-7e9dec6f06a0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b20b3a2c-9923-af5a-c04c-c381bdc15e60@citrix.com>
Date: Wed, 28 Apr 2021 15:17:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <55c50b27-e8cc-873e-e768-7e9dec6f06a0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0143.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 128796bb-6948-45f7-a011-08d90a5060ce
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5567:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5567118EEE66395AB3C7FC84BA409@SJ0PR03MB5567.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DSOZl9LD3hb2OoNTjODJn3Bz3M/0H5GWZzPv1mGuO6Wz72zOI3I6qgpd0lYuivIeyeQO0MEN2JXfLIAUzhK9vNAgP8uaNBOeQaDegV1Dez5FhMcbbrTdubtl9IrpJ8iEaZryC3DdzYkUxKJYvUfs+WwPUR9yzKzViIQzhMRg4FlRZqAj8SQIwpnat8Yn6Br/S81H2276FJ3QUnM017BsgwOvR7u45xvyYaBLJosjrkZT+Dsyl3hbVGhe98qKlYeTn2iKvFOeFPV4LTbLpQApDo7t0gS2aI32f6FZ1aUFLxVcJSt/UiX/4UzKU+3bbJ4ba9aeAYVcDikT/FgZYYozssuFQWmdatq/HqMZdZezMI3PSdiel9mFccLO9N4xrp52hh4OLQbRVrqucNaQvSylGZOcHqz78WnTqZhenY5O6rbDSfn90UJnHAvNkgnJDGC8ATEAhvB2IoqvbAqmZKJy8AO5WHRkJleB1O+Fv5eCTsXf2ZyWb7aRKrLJp1LHwuMEd5y79O+pcgFck/mS054Cpv2/oQJuXrMA3pfLA0efVnU1Y+5cucOfN5xhdWvXqqmr49ORw+2u62Ya8Ok075QgC3KVwCIm9scPY2j603o/432YxyANRmDL/OA2ZU2rdfr8Jqkyt04X3HHTQDPoP0UVCOYJVF6stRIn7RHlfDXp8nTrvDY0ImHc3BBSQBSWFK+i
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(316002)(478600001)(186003)(956004)(5660300002)(16526019)(2616005)(2906002)(53546011)(6486002)(86362001)(38100700002)(31696002)(83380400001)(26005)(6916009)(54906003)(8936002)(8676002)(31686004)(6666004)(66476007)(66556008)(36756003)(4326008)(66946007)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SGFoRVhlRVhrbWRhcW9YNkwza0xlRGU3aU1vMUlFUGVTN2xkdEFoQnZ4S3JH?=
 =?utf-8?B?TUluS3dsRzQxeXJxZlRSSzlGZjkwZ0xFcE5nT2crOVB5VmgxVEFkUDhicUV3?=
 =?utf-8?B?bTVTbWJhMmFqYzg0VmJFa20ySUdJTE5VdXpiWE00b2laaDlteTMzaGxBdlIx?=
 =?utf-8?B?aWhaZk1ORENMOGNEL3crUTUzZW1XcTQyTEd5WHN4enk0YjhHUDRuSHpCRzM5?=
 =?utf-8?B?S0hjU2pybXBYcXBlMnluNzhWRU9LNzhmNy9BZXd6NzgwdDRoRFN4VFQvUkh6?=
 =?utf-8?B?YVh6TTB2Wk9KL2ZINWJ2SVVKQ0ZSQ0JzcHVHdDdQYzFKdEhhMENJYjFQQmVs?=
 =?utf-8?B?NUw0K04vZ25CUkNzTnZnRlJGRHNBTzV5eFJ1MlEzTWV5b2JTbnNPbEVIK2c3?=
 =?utf-8?B?UmM0eEM2UzFUZjJDRmFKcng2Z1F0Z296OE1VOG5wN0NKd2FsSUtrRlpPSlZS?=
 =?utf-8?B?d0lLSS8xY1BnenZSTVZWckpkTzhwWmpMWmxSQ3BpaVcvT3I2UGd5Y0daY005?=
 =?utf-8?B?WDJXWHhDN3NhSlk2WUR6aWlnRDhUNEp3VFVjaGFQcS90RkZseHRJcGhYYm41?=
 =?utf-8?B?MmZaQXdFanU0OTRLZkNseWFuR0VGcGc3QTVSYk9pWnFPaWh1ZkRhdUxLWE1B?=
 =?utf-8?B?dUdjcm1ldG9xREVnMnZtL29Ia25paFM0M284dUdSVSsvSXoxWFg4Qjk1bmlo?=
 =?utf-8?B?NDg4aXVyT3dJQjVUMEF4Ti8raEFHUHZJcWgrdXNyTEY3alQzdkhuNWF0WVFa?=
 =?utf-8?B?ZzR3ME02S2dzZmM0WDE0RmVKZzFueWZKNVhzRGVIQUJJcWRVQS9uL0ZsNjJV?=
 =?utf-8?B?RmJHRjR1bmVGYWsxQ2toRUdwSWhPdkl3dWk4cUFBMzNUU2tWUzMzbmd2eWNY?=
 =?utf-8?B?MTlqWEpGdXltVE1CRzlVdUFpS1E5YjNRZ080cXZBd3BZMVF1VElGU2hJZVVD?=
 =?utf-8?B?YWxNdThvcExBS2NjdmdETU9LaFdUZGF6OWpZVU1QVkdzQzR4eU1GMXR1SXkz?=
 =?utf-8?B?L2t4Vy94eEVGdW5BU2FjR0U2WVg1aVZqdFFRYWVDOVkrbWVFQmJYZ0hoSkUy?=
 =?utf-8?B?THlzdjZweWo5cnBoMlppL2E3WjgyL011SHl2WS9wZVB5QnhDTS8wc00zSSt2?=
 =?utf-8?B?S2g5SGhvRVFQZ1M1Y3p0cjAvVVFjc2xEaGJ3RG9ZL1FzRzEvUGpxSkRJS1NB?=
 =?utf-8?B?RGRjV3JGczJlTG5BNkdwMWJpeXhBM0tzUXZhWnp0Zm1DYkNTbVcvVkNNRS9q?=
 =?utf-8?B?bTBPWmlYdmRqYnBhZ0s1TVJYa2JWZDk0enh0aGVyYkhlVXdsNEZLc21JNGV0?=
 =?utf-8?B?YnFLN00rR3NTZUlxUVdkeUw3V04vdHZzODBkOWU4VmVGd1NmNXVlOFBJdTVU?=
 =?utf-8?B?RHowSHVCNVR1eXJEWmNnQzJueFcwT0V2WDlQMWRVeGhQZmVpeHpxYnFzbldF?=
 =?utf-8?B?bHFrM0psK0ZDbWpIcjZGeDlCdkRnUTVIMzV4OW1mbHMxQTlJeE83cXpPdUoy?=
 =?utf-8?B?VHRyREcrSlo1RGNkUldIZHE0c2pJSDVVNEgzaDkvNmJTQ0Z4enk3bE81Nmcv?=
 =?utf-8?B?aHVaZHNDNE9QNnpoc21Xa3I5RnRLUk9mMkt5cVRjcjFZWHBqNUJHa01aZ0o3?=
 =?utf-8?B?WWFRTjFJRjR3WDMrbHAzeVppSmJwYVZkc1dyb2hjV3dwNVArQldxWm5ENUNG?=
 =?utf-8?B?RWlzZ1JhMHRoeVE1bU4weDV1a1R0b3V3MGM3bEhVT1A2U0VVdzk1YUNCVzFS?=
 =?utf-8?Q?/EH3U3ZL+U8Qrd+Aeuuy2DGfVNmh7CHkCc1XEuL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 128796bb-6948-45f7-a011-08d90a5060ce
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 14:17:38.8810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dB6/xuKusGmZw8z4VzyVhuMnD85ZjhyXHCpTDFv4xX/sjsx2oocXqCKE5jR2cCi7ob1z6LzLyHQkAljT/qNqw0V/MGkay9QxjZZqTcILpyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5567
X-OriginatorOrg: citrix.com

On 28/04/2021 10:14, Jan Beulich wrote:
> On 27.04.2021 19:47, Andrew Cooper wrote:
>> On 27/04/2021 16:53, Jan Beulich wrote:
>>> On 26.04.2021 19:54, Andrew Cooper wrote:
>>>> @@ -497,7 +501,9 @@ struct vmcb_struct {
>>>>      u64 rip;
>>>>      u64 res14[11];
>>>>      u64 rsp;
>>>> -    u64 res15[3];
>>>> +    u64 _msr_s_cet;             /* offset 0x400 + 0x1E0 - cleanbit 12 */
>>>> +    u64 _ssp;                   /* offset 0x400 + 0x1E8   | */
>>>> +    u64 _msr_isst;              /* offset 0x400 + 0x1F0   v */
>>>>      u64 rax;
>>>>      u64 star;
>>>>      u64 lstar;
>>> Any reason for the leading underscores, when none of the neighboring
>>> fields have such?
>> Yes - they're covered by a cleanbit, and for better or worse, this is
>> our style.
> The underscore prefixes are, to my understanding, there only to
> emphasize that the fields shouldn't be accessed directly, but ...
>
>>> Did you perhaps mean to add VMCB_ACCESSORS()
>>> instances for them?
>> TBH, I opencoded the cleanbit handling because I thoroughly hate that
>> entire infrastructure.
> ... via this (or something with similar abstracting effect). So
> for any fields you mean to access directly they imo shouldn't be
> there. I particularly don't view them as indicators of being
> covered by cleanbits (if the respective accessors aren't used).

The leading underscores are enforced by 'vmcb->_ ## name' in
VMCB_ACCESSORS().

The cleanbits are the only reason we can't treat this as a simple struct.

~Andrew

