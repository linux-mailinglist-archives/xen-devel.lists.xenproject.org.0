Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850907633CB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 12:33:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570282.891993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qObpS-0007jZ-ST; Wed, 26 Jul 2023 10:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570282.891993; Wed, 26 Jul 2023 10:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qObpS-0007hs-Nz; Wed, 26 Jul 2023 10:33:14 +0000
Received: by outflank-mailman (input) for mailman id 570282;
 Wed, 26 Jul 2023 10:33:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qObpR-0007hm-92
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 10:33:13 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1606bcb-2b9f-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 12:33:11 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9175.eurprd04.prod.outlook.com (2603:10a6:20b:44a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 10:33:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 10:33:09 +0000
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
X-Inumbo-ID: d1606bcb-2b9f-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEKu4H5/KA/7ug4A//MCHkUTExtYmWcW/xp8/4bv4ryRMoP93r/tTQKpTowX/7UUjIsKFADjfRdnWVnaq2W3+c30od/O0RgZeL8O0kheB6g1AYz7gxbLU6w/q4GU5XKKRZc+0aA4t5G8pLIITEdKEge5HXrKUWw+ourARIPSDso1854UhPksdXc/YOX7puoRGrKx5M01BfjcCSzpd4jF2IIb/BQSNHLswzwnFMrBnFljPk9k5Qo+goRQ5JVomfs8+FqYK8QEnHfouFenf/i0ThCBuSt/SW/g8AznOdtbrXK81YuJtGebOedW8tgve601oGg0XXdhrxr3dE+a9NVwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUQNrBvwkCW3i8IvMZ9HOVhTuG/uMRjUcx7MUJQ2KDs=;
 b=BqiMFfDHMyCh6kt6o/J9vFXJIUoOERDjuXhf5T1MLG3pWGLRbEZLfTovXT0Pzn7MySSZPP8lCDTm9dj2/4htp5A3y0XOkyEr2tv9J7r/SNd/5P7Nhp4MxH4IQrEa+lQsIHy+Wj8KwkTs+u4+fj1ZzPIN2j74gpHjHctJJOe3uRcLi13Lms5zNnPsiJPE4BE4gaNwnYX8bFfPmECT1svyAK0z62jamfAFg5fPy0bUO+mdhMuChIyl7z+wD8KMOD0VVszkoGzIpb8g4B0FVREKxY93KT4DKacYiLeVOlH84Lbev69trJInBcfllr8Pzvh8xGRVoiWB/k7hWUM77Cxbsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUQNrBvwkCW3i8IvMZ9HOVhTuG/uMRjUcx7MUJQ2KDs=;
 b=F3D/c9wASpnoUlsGnSkTbc28lFwnr/C060k4jXaM1+dUCfh9+GTASptadQrHCGsBhQEwazmmcGwrCgGy5CgbbVOEWlCTps1EEE2avS5E5jQK+0Aa3JBivjMtHslhd+DlSvf4gfMXceeV2FDdp0kcWQDrbhMb2cZU1egursNJ+w4ioffJIBqNByv4om3dU0je2LXzPfDFkEpwMKaEcGL2DJaE0CtkUuSM4FmK7vQZprgjxOnReg3G3vzoXAbPa1uo5MrPfGrPc53LMFlgzto5gKS7lQbYLBLfrNfNtVnKs4534H6/0+NBR8cJF27Zpvih4NNemhKu6JNTch3r0fUXSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60da37cf-abec-be58-d433-e98eec0c59bd@suse.com>
Date: Wed, 26 Jul 2023 12:33:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 1/5] build: make cc-option properly deal with unrecognized
 sub-options
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
In-Reply-To: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0894e5-913e-4ea7-586a-08db8dc3b487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dO0ZO6NNcmo7vhh8sQOispNr04T0/FSewxKg/zkrAlnNXFCD1u6N4jPF4AivX+bqW2U4BwkvyUmkX/jSdDm0O2zY9iQS0YnlHMww32VeZsuTQ4Pze2SbKWxXSQ30YWDGYlhjdqRkqG6795DdegWcpRl7zMqWBPHKV7cMI6ECp0dR+PyenpdE4qeod63VDooZ2NqVu0rtrJo+cQ2cCiXrV0qcyHPAP+Ifzx3TIzKJD3xX0mt7W9owWI77uBeTOQ9XPXpwxLAlwc3Kvh+L+cp8Khev4CbB8A9EdE2U8LJJvmSrI5FF8ArKs+KNUTZp0zPgbPSbNINuFsOh1f/Ieb6ZvJIwn5Ws0yqbmg+LsHHbw3PLLCYtla9U+eKq/rUVxx7IkWVhqrw2bw0LZuhzT9pmgP+78iNUd9CYuP1GhBQ681ylC/Ye4a9IikEsjUP/zVP4tdoas6KQxOKeKXeYgyBZdX4asysEWFVUoNfRVDl4MgTB/LWIB2Pp19k9juDv5tu1N4L3R8+A3Xx6iN0Tcj39NEw5iouULOPFYlvuZdBhnGcBl6I25uRkHm6e+4/UUtK34E4xkjIlj9cGM+RmR5r2pig6vB/QaSxz2xJHKmqbk1yKTm9+dZS6HP2Jubu7UytEvOrGSjAJRUN+wXc5qWqfVQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199021)(54906003)(6512007)(6486002)(478600001)(66476007)(2616005)(26005)(186003)(6506007)(2906002)(66556008)(6916009)(66946007)(316002)(4326008)(5660300002)(8936002)(8676002)(41300700001)(38100700002)(86362001)(31696002)(83380400001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekZXRnFaMFByNlhFUW05bi9qYVZJaUJxWHg2L3JBK3RFeWxTN3lSRTRFTDhC?=
 =?utf-8?B?RTY3dk5ZeEY2L0wrclZhWXlGSnNHOEc1ZmN2Z0s5b0ZQNjVtditLbUphQjBo?=
 =?utf-8?B?MnNEcnVlQWEzWVQ2K002SkpQOHMwS1JwdDAyOWtlcy82MlNCdGMrYk92SExH?=
 =?utf-8?B?Tkc0OFZBVWlUOExWbGpjSmFCVnorcEFOOGVSb0QzKzc2c1NoQmNGbTFuNFVV?=
 =?utf-8?B?Q3hzQTJoZCtVbmRFbFN6elNhcTFyVTlzZGcyU3Q0K0VMNTRZeFFEK3lWcHRI?=
 =?utf-8?B?cDR0Qzg1NUMza3NTdG5KcUlPTHMrK1FVNnl0S003SnZrQ2NzZnVERVUrOXJD?=
 =?utf-8?B?MXYzbTVldkNwMFlmM0ZKVit6VkxYQ2RkdjgxUUoxeDhTSlZYU00yLzJZaEhy?=
 =?utf-8?B?djRnUHBaS3VyQXVMMGhDNVhwMkUyZFA1Qk82akZKQ1BOc1ZIRGdVYndCK0Iz?=
 =?utf-8?B?aUE2N3VLRUZVTGJsUHA3dG1EVENiVUZrNGhBWFQ3Slc5K1hEQmc4NitIcE92?=
 =?utf-8?B?NS9neHprcElobUZHUlVSeDJWYlNKcitydENXNmZTY0Q4NFVjS3N3T21kOXBv?=
 =?utf-8?B?YWdQWFh6ZEx1Tm1mU1NKc0ZVQkZkdXlMNDQ0RERLVUg0bnJYeXl6ZkJEdzlh?=
 =?utf-8?B?Y1lQM1g3WjFGRGFGRzhYMFMzYm1uZ0Q2c1ptalI5OGdnNG9JUGtoYWxVUXpn?=
 =?utf-8?B?SUtmYmc5WHVYeXRIYmg0N2RmeE44Rmg1dlVQSjg4dFIvclJ0QlVRS3FiWHpp?=
 =?utf-8?B?VXhOWE8yV3pzc0RvbzFIUk40Zmp6bmE0bCt3SFpoMzh2czMyTytvK2FXS09W?=
 =?utf-8?B?d0pOQXArczF0WWQyL2hlcHIzSkpYOFp5YmpNRjdSTGdid0hiVmVHZnpWNCsv?=
 =?utf-8?B?bm05cTlaeXJPcC96TXNHbjRxSFNWMVc0V0lBTk5LdnF1dExnL1VKOVNlR3Ji?=
 =?utf-8?B?RXdYWkhtS21XR2wwcUx3d24waW4wN2QwYXViWkhOY2t1ZDhjSERIRmFJRWYw?=
 =?utf-8?B?dVB5RjV0a3h2Qy9vUENmNWZVNktqKzZmbXhmSzd4WjZwTTlDUFNkM0FtNEJk?=
 =?utf-8?B?MFNFczF4RUJFN1B2RGRXTG5sTTYzMFBxSVM5QTQ1MXVMUHk4d1Jtb2VNRHRE?=
 =?utf-8?B?UUMxbXVRV1NZK1NtSnJqU2xEK0NKMjd5N3JpZWM4cHcvQWorRjFXNE8wYmRn?=
 =?utf-8?B?bFJZSWQ0Y0FRazFpTGhGa3dQYlhIN2lLN2MvTmdua0NnZlFvMjFHWCs1VnFl?=
 =?utf-8?B?elFTV3Zrem15Y0wwU3hjeVI0bUV1Ym9kK2sxcUxkRDJHVUowTWlOakZ5SExO?=
 =?utf-8?B?cXhIV2ZGZlpKMjZFYUd0am5oeHdDOHh6dk1VRitZa1EvUkp6QlFhRnl4WVhs?=
 =?utf-8?B?QTJsL0RHUlFUS21PUS9ad0IwT20yVW5NSWg5eHo2YS9wVjBGQm44RkVJZ0xy?=
 =?utf-8?B?dXl5MlZpU3V2QzlnTFdINklHa2xQWTUyMERnTGQ5N09Ya2Z2d2dabysyM0JK?=
 =?utf-8?B?NG9RQmpKeU9HTWJvckJDQm0vZlJZYWtBQ0RBNlQ2RVdlaUUyK0R3V3dhRVFr?=
 =?utf-8?B?TDhkc0k2Sk90d0QrL24vVys3N1NsYjZuamZsOEJ5cENzQzdYNUwyOUFqRmRS?=
 =?utf-8?B?cFFJakROa0t3NGFlaFAyVzlkUXpEZ1BhWnVZU3NEbHhUMVpzYkcrelk2RXhv?=
 =?utf-8?B?K1dxTDZyUXpZU2dyWkVLQi9LdURiNmF2N284MGl1NmFiN2hWVEE5bGZiQkp2?=
 =?utf-8?B?NkpSN0pFaVdVQ1A0Y28zQzlmS1NvOTVpODZEbWdMSy96Z256WXVSaWtrTGha?=
 =?utf-8?B?V2FQaGt1U1Y5N3dkMkZBWUVvY05DZUFCUXpDdG5zbTVoQy9MK1AyZGhaTDhK?=
 =?utf-8?B?b1VQbmJpdUk0ZGFqNDlNT2NlTkxrL1Azd0Rkb2hHRDZ2cmo0NXpHY1ZuaUFL?=
 =?utf-8?B?WjNvWjIzSlgyM016amN3aFE1WGpKeWk4bFZuaFNZV1Zldmd5Y1RIVE1WRHRO?=
 =?utf-8?B?RGZlei9mN1JGU1FJanJ6N0tsSkFUWHcvMm5kSENpTEszNVRXeGFtSUNldUJB?=
 =?utf-8?B?QTlRWDhaRkNiL05jVUxFbCtmNm9iOHRrY1lNSFlaLzdSU1RCOS9WN2JPTkk3?=
 =?utf-8?Q?47GkpKplqgKSbZ/oEEne9OdGs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0894e5-913e-4ea7-586a-08db8dc3b487
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 10:33:09.3501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLHqeQ3epvvmn3b8VZyKNOaBn/Pp5f/+DzKI6LXyt3+u+E2CTPbbU/O7dmO5EM7Ex+mLj/YABvE1EhLi/HXiww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9175

In options like -march=, it may be only the sub-option which is
unrecognized by the compiler. In such an event the error message often
splits option and argument, typically saying something like "bad value
'<argument>' for '<option>'. Extend the grep invocation accordingly,
also accounting for Clang to not mention e.g. -march at all when an
incorrect argument was given for it.

To keep things halfway readable, re-wrap and re-indent the entire
construct.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In principle -e "$$pat" could now be omitted from the grep invocation,
since if that matches, both $$opt and $$arg will, too. But I thought I'd
leave it for completeness.
---
v3: Fix build with make 4.3 and newer, where the treatment of \# has
    changed.
v2: Further relax grep patterns for clang, which doesn't mention -march
    when complaining about an invalid argument to it.

--- a/Config.mk
+++ b/Config.mk
@@ -8,6 +8,7 @@ endif
 comma   := ,
 open    := (
 close   := )
+sharp   := \#
 squote  := '
 #' Balancing squote, to help syntax highlighting
 empty   :=
@@ -90,9 +91,14 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)
 # of which would indicate an "unrecognized command-line option" warning/error.
 #
 # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
-cc-option = $(shell if test -z "`echo 'void*p=1;' | \
-              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
-              then echo "$(2)"; else echo "$(3)"; fi ;)
+cc-option = $(shell pat='$(2:-Wa$(comma)%=%)'; \
+                    opt="$${pat%%=*}" arg="$${pat$(sharp)*=}"; \
+                    if test -z "`echo 'void*p=1;' | \
+                                 $(1) $(2) -c -o /dev/null -x c - 2>&1 | \
+                                 grep -e "$$pat" -e "$$opt" -e "$$arg" -`"; \
+                    then echo "$(2)"; \
+                    else echo "$(3)"; \
+                    fi;)
 
 # cc-option-add: Add an option to compilation flags, but only if supported.
 # Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)


