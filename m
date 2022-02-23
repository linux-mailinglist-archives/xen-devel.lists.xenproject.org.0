Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324A24C1055
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 11:34:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277292.473743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMoyP-0001Og-G4; Wed, 23 Feb 2022 10:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277292.473743; Wed, 23 Feb 2022 10:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMoyP-0001MY-Cd; Wed, 23 Feb 2022 10:34:17 +0000
Received: by outflank-mailman (input) for mailman id 277292;
 Wed, 23 Feb 2022 10:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMTg=TG=citrix.com=prvs=046033a78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMoyO-0001MS-9J
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 10:34:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2490e881-9494-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 11:34:14 +0100 (CET)
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
X-Inumbo-ID: 2490e881-9494-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645612454;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xnBbGmMvvqr742lxz/97xnbS6iPLtn5CQAdCTkMymAM=;
  b=G+q0qJQAXogOoI1uMIBRf0O3+B/y34xmQ7zSDOEV7qDVwE0Z3zJ//x/a
   UmFB4DU0wms2S2nakUgsOZAd5CGueHZJ1UvXqyG6tHBbXzQE3OrtKsC8o
   wtKE+Hk9B3BAA9gDTc39fp/w3azvlL0PUJb7gymZRBsCe4UYBS3DK3xfq
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64689618
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HjR5WK2aQ5YQX+NL+PbD5d1xkn2cJEfYwER7XKvMYLTBsI5bpzIBn
 2obUGiHa/fZazfyLtFwbo/jo0kPuJXQzd5lTwZspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQy2oDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /10uJiyZgsEL5HBs8Y5TSlDE2ZsfrV/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiCO
 ZpIN2M/BPjGSzIVO1kzUoJ9oPWXvVbAai1mknG0rKVitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoQHrCl8v9hgHWI23ceThYRUDOGTeKR0xDkHYgFc
 gpNp3Ro/fNaGFGXosfVZhC8olGIkw8gVvFyN/MK8wHK2OnM2lPMboQbdQJpZNsjvc4wYDUl0
 F6Vgt/kbQBSXK2ppWG1renN827rUcQBBSpbPHJfE1NZizX2iNxr1nryosBf/LlZZzEfMRX52
 Hi0oSc3nN3/ZuZbhvzgrTgrb99Bz6UlrzLZBC2KBgpJDSsjPeZJgrBED3CBsZ6sy67DEzG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWjwpiP9JdAKvG4uTKuMDiriUWW1C
 KM0kVkMjKK/wVPwNfMnC25PI55CIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrdMuZd2l3tW7T6CGvjGI+GPjOP2iIi9EuxebjNjr4kRscu5neki2
 4wBb5DTk00HCoUToED/qOYuELzDFlBibbjeoM1LbO+TZA1gHWAqEfjKxr09PYdimsxoei3gp
 BlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:bhHi0q7Ds+Cu1CcV1QPXwWaBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhJU3Jmbi7Scy9qeu1z+873WBjB8bfYOCAghrnEGgC1/qv/9SEIUPDH4FmpN
 5dmsRFeb7N5B1B/LzHCWqDYpcdKbu8gdiVbI7lph8HJ2ALV0gj1XYDNu/yKDwseOAsP+tcKH
 Po3Lsgm9PWQwVxUi3UPAhmY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 j4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv6/VXEO0aOSAWQR4Z
 3xSiQbToNOArTqDyeISC7WqkzdOfAVmibfIBGj8CPeSIfCNU0H4oJ69Pxkm13imhAdVZhHod
 J2NyjyjesnMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1VwKp5KuZIIMvB0vFuLA
 CuNrCp2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZMyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR+2Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NKwgFCvsukKSRloeMNoYDaxfzO2zGu/HQ1skiPg==
X-IronPort-AV: E=Sophos;i="5.88,390,1635220800"; 
   d="scan'208";a="64689618"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CInNwboxKGQAgv85lCnk9GuOlRPG89bHzvum3nqG3hwgUTogHysNVKiuEH0+sgKh/c4vzhoaxreCEC/xowlWZCzbqhJtQN0M27bUvyqdgrprCb9L6T6KROOql8rdaTvX8hc1Emp3aZI39pgv5Bcq7bYxVKKq90sOiZmCwOCjS3qQH8+QAQeK2vq70k+Xqc+uP2g0H8z4GJBjrI4vgXehhqqx/+y+Dknq5uSAmUhuVix6wG0mWBBowcmKBa/G6ykvGEjnM+TLrnW+wIurvIIn0yCtg2igD1mXKqEZdh64v4hBZ2bl7wLFmMviQZGdEcAlrn1pDU1nhqNDOgC4m83lpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnBbGmMvvqr742lxz/97xnbS6iPLtn5CQAdCTkMymAM=;
 b=faj6XOSIDPsLlcHe/zAfD/ajhqROA4UUbUeZfI5Hs6nRKNzDYw3DYyHfnabXT3uHxE7/4qTG35bYVIutn1AgmfDwzSaOf0qr7kY+Q6fBIWsugImN7qVSRqwT2hrEydnKU9u+OQXQpajhRxWwb6QFXQESUsLgmeSul1i3UuJYSCalDX/DdC/FBTAMbXjbGd6d+HpMiHl9Ep4uV0LNPXeYK1+xDhQkB5Xqko3iQc5nFI3kZjhMmoy5rOswkI4M5SUOH2i8U0ECE7CJe/e1ww+VGMFtVnaV30bG1e0nH0zC4JJHsGXt65aN3AxWce2w07gt9C6OmJLdT+ybjRV8ZAhiMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnBbGmMvvqr742lxz/97xnbS6iPLtn5CQAdCTkMymAM=;
 b=nDqeHj0MLWNXHVL6ZTsOKCqw2bjUh90MoDk8+brbD1RffYqGTFiZEEJaZmY+MWYo4bJpT2p0IHR9mQB/uR44NvgZ5pFusD+BlIeLA3bKwm4mdeTL8akwAI4HqafLR/PAEyH3eSJe+c6KuGP3LPw/NuVM4vembLDl2NzYbqlxROs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 29/70] xen/misc: CFI hardening
Thread-Topic: [PATCH v3 29/70] xen/misc: CFI hardening
Thread-Index: AQHYKAC1Wg3VwzQSaUqtYiPtXsy9Payg70mAgAACdoA=
Date: Wed, 23 Feb 2022 10:34:04 +0000
Message-ID: <8b28c6e2-c953-5693-a198-27f013ceb347@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
 <20220222152645.8844-10-andrew.cooper3@citrix.com>
 <fab0ba40-9840-9bde-e4da-822d797985f1@suse.com>
In-Reply-To: <fab0ba40-9840-9bde-e4da-822d797985f1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3cab140-fd76-4f4e-1e69-08d9f6b80394
x-ms-traffictypediagnostic: SA0PR03MB5452:EE_
x-microsoft-antispam-prvs: <SA0PR03MB54525424C6A2878473CA5915BA3C9@SA0PR03MB5452.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sbpkxrOGSvJvL+Tn+PGtkjm9cNneUaa6FEjiMvjEZAKAthVshWOPYwaoXb7qiCyIDG3NAXswmiKEeqOu3oxWX7VtR9FSkaKLttW3FFFZrer51aULCY5u0Nx24nS5fijtJlythD3Eed7b07LrwcSVtC62r8ifof0VvlmFb4h2W1Y91vAz9TXF4qPhpMLY6L9O7kPA0CEQtq6VljD6UtkW+3mon9czCydoI1bTqwaLBR9GdzlU3BQtB9YKQ3cyuJNiNdLHMBvijIaz2IZQy6BneaQblRJqiMACLbNEjeZdq/OwE3kcp/sUVYq1NOrDlBR9gmDCzK8+pff687ytmNVyU1pa/cEPKnuxO9ZuMd+52zY1AXLIa+588cSq/0b5eVx8AUg/eeX/uw6Ue69aoTxfbr3k/haFr9ps9G//IOPuWMyM/TdUiRJeYSIBkBWdRpikmdmCnspW+75fI3FHQWiLiZsKXDuPPJq8B70G07ac/esEyMMSYEpBYFALQvgLO5e3mAoa/A9tkhJp8yqy5b/GV3ecLT4cmEEczRAOvvYWQWqcurD0loQDuFyUo6DCxbsgjtM+tR30kI/u58BOBEE79dx6KfCBUYQ+DPOb4udDofNF/VBOQWPv922i7PBr/5w8n5I67yAAre39JaDAv3tJ+QZavUTFubtJy9o/C4qNtLzrCuJZ4hl46NXp3rYx0tz263LmOgWuVtQRpLpSvgF9ZLjnoMO+6rEr6pO5cARHB8d8btESiTygIB/tg1jGmDkvH/9Mv16S37bZTZlCnkV/Xw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(6486002)(66556008)(186003)(31696002)(8676002)(26005)(4326008)(122000001)(6916009)(316002)(86362001)(91956017)(66946007)(64756008)(76116006)(2616005)(71200400001)(66446008)(508600001)(82960400001)(36756003)(5660300002)(6512007)(6506007)(53546011)(38070700005)(38100700002)(31686004)(2906002)(4744005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFF2MXl2R01RelI4dUpNK1lYSmQ1WVlISEF4eUtaakV6M05iTHJzUHFuUHJr?=
 =?utf-8?B?akcrM1Q1S2J6U1FSdkdwNUhVZUZkWGM1bUYzbEVSNm5yb2VTR3dOYzZrTEtM?=
 =?utf-8?B?RDl3TGx4azR1U3RFWjF6WHV1TVRtbGVxMG52bVFxb3BlSmhmMXVscmhYa3Fj?=
 =?utf-8?B?SXA1VnpZOHFlL1JkU3MwR245YjBHc09SZDBrVEV2NXpvRDRpT01idXpKVFRj?=
 =?utf-8?B?VEZuYnBDUS9IMGlUV2pTWlc4R2lQS2lyTVJKTU1UN2VsTDA5anlvNElnbno2?=
 =?utf-8?B?UjEwNDhhNTRlWkMwTGJpSWhvcTM3eml5MWt3THVldmlqNGlXa3gxTFRnaldW?=
 =?utf-8?B?RGhNQkowLzJhOUFzZTJrRzBLZ1pDWkY5b0p0eTBVMklxK2s2ZWlEZVE0bzM0?=
 =?utf-8?B?dE12cVU1YWNhbndEcHk2NUNJS2ZNeS9UOE9DRmhKTHp6SnNHd0Y1RU9XNWc4?=
 =?utf-8?B?NUs3VVc2elpsSTQzQ0FRUzRlZWR4SndYOENBTDdxM0dBVVR1eUZUWlMzeG94?=
 =?utf-8?B?MFFFZ0lhUktCc2VraEtSUGxSKzlqZEltaGh5a01nY09uN2o0YXFQVXdUWVZ1?=
 =?utf-8?B?eUNLOS9jS2tiZjcwSjhRUFJDYUxtcEo0eUlCZ3NMTXF5dXRRUHZneXF2dVZv?=
 =?utf-8?B?V2lPYmtOdGJSRnh3NEgxZ2JMdWxsVUw5cWs4VGpFU0o0ZHoxekt1U3FsZHBK?=
 =?utf-8?B?YnAvZ1dtTkRWZlIxTG5xYkhSVDNvRy82ZGgzemtwcWVyTnI2eCsxamwyZHVV?=
 =?utf-8?B?Q3FPVWlhNGx0RnRJb1FWd3ppTm43d2FiK0doL2tUUEQ3dnpTYkpPWWJrZm1j?=
 =?utf-8?B?V1EzUEpoYnpkZTVVckUwanFoSTZ0bUphWmV1WkVueERkZVVobGxEWXd0QVlY?=
 =?utf-8?B?S1VLV2V3SGFqYkZQbWRCN0owT28ydjJSb1pFa09PbHdMcTkzRHlYajNuaHpB?=
 =?utf-8?B?ckdRcG5TUVN1VTgrTTEwem5QY0ZNY0RJWWtEOHpJV2gwSGt6K0hCSnc1eURv?=
 =?utf-8?B?N25JQkFqNTNDWEpJM0dqUGRJYnJST2YyL293K1czLzdLZnZsL3BiS3dIUHJW?=
 =?utf-8?B?ZzRjYXpSQXViYkltQ1NUV2VZMlpndHd4d3J3ODBpcm9VcXFhQjFxZEJQbjVP?=
 =?utf-8?B?QnB5SURhVHZ5eURYY0N3YS94a1pQQUdNcy9TM1NsQ2hjVHhKSmk5emhMRUVW?=
 =?utf-8?B?dVVvVFN6cXk0NDVaZFNMM3o5Q0dFVW1RWXU1eEhyaG1tY3g2MG8weTRSekt0?=
 =?utf-8?B?aUFaaXg2WGxoWSttTDJYa3RtZzV1cmZXVmpxNm5tVXg4L0s1WlFqV3hVL1dk?=
 =?utf-8?B?MjhJREpkTWRmQms3UUtSMmNrOXhacWt3M2hpeGdRQVNtZUh1MGVLU0RNMDhv?=
 =?utf-8?B?a2pQbkg4clpGNkpVSGNNbExkb1NpU1ZBZlpoUTJORUMyQlJoM0FUMHA3QzdO?=
 =?utf-8?B?djYzZWpQaC9HSnNadUdlSzJseFBrRVZyRlc5eHcxUDJ4WXUxYm9VTW9CQXhY?=
 =?utf-8?B?R0prQkorbSs0bm0xd3N2V3dnMnI0a3VKbjRUM1dwOVpSdk95TWdBZ1FieDhF?=
 =?utf-8?B?VUs0TC9uVlQrSmVkZFV5U1oxVXYvOFpON1p2U3EydW9FRE4raHVzaEJXODJU?=
 =?utf-8?B?VG5jL3I3eHRNY3BPQVdrN0lPREZRcWx4TzJZeEFPdFFkWDVNSitPSzBqOUxk?=
 =?utf-8?B?cENBeDVPaTg1MUw5cERIN3lZclhNVXg3RnRvUWppVGNEcDloZStKcjhtUExQ?=
 =?utf-8?B?bWxXT3pCcXhKMXRIRUs1WkgrZDNEaFhlcTRlM1VHUW1YUmFBTU1wRUJZVGhj?=
 =?utf-8?B?UEd4NGN6WU5nenN5UGJDYkRLVUdzNHVTSGdWTWJjSWlDTWU5WURpbUVxNnYy?=
 =?utf-8?B?Z1J4RnNqSFZFTE9MQWNIZVpIM0lGZUMzdS9GSis5M0JiQ3B2a2Q2YkhvSFNa?=
 =?utf-8?B?NkVmQXpGcFhtOVl3VDdseWxDQ0R5WU9Wd0xkQ3lIVkNrUVd2NldMTXZRQTJM?=
 =?utf-8?B?SWNqQU9nS0QwcU5yU0hSK2NqK3BGeGJFZzgzSzFpZldpaVZzdkhqQlZCd3dH?=
 =?utf-8?B?RmwrMlplT09FTW5RUFJGY2JaQ0I1aDZnTDd2MUdCYjk2V3BYdXgzenIwbFl2?=
 =?utf-8?B?ejd5K3B0NW91RTJaL1NLdGlqVktnTjJEc1M5Q0FnTW5ja3M2dDlDWkFmalZW?=
 =?utf-8?B?Z1Rkd0FsOVdEa2FMZThpeFJzaFlXNWQzUnkwUXBMbnZDRFcvVUFoc0llbENi?=
 =?utf-8?B?VzJ4WExUdmVTTkRvcUloRDhteGNRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <55ECE487850C324494F2D24570457999@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3cab140-fd76-4f4e-1e69-08d9f6b80394
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 10:34:04.3464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tv2wX1s4AhmoaZrXCMHBSSXhAzE4LsulzH27g5rL38dv1CgE2p0FD7vBXfGFt0gJM926SRjH8qgPe3q36DXuIFN4AkYFvPlHopTkofqgEkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5452
X-OriginatorOrg: citrix.com

T24gMjMvMDIvMjAyMiAxMDoyNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIyLjAyLjIwMjIg
MTY6MjYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBDb250cm9sIEZsb3cgSW50ZWdyaXR5IHNj
aGVtZXMgdXNlIHRvb2xjaGFpbiBhbmQgb3B0aW9uYWxseSBoYXJkd2FyZSBzdXBwb3J0DQo+PiB0
byBoZWxwIHByb3RlY3QgYWdhaW5zdCBjYWxsL2p1bXAvcmV0dXJuIG9yaWVudGVkIHByb2dyYW1t
aW5nIGF0dGFja3MuDQo+Pg0KPj4gVXNlIGNmX2NoZWNrIHRvIGFubm90YXRlIGZ1bmN0aW9uIHBv
aW50ZXIgdGFyZ2V0cyBmb3IgdGhlIHRvb2xjaGFpbi4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4gQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gdjMNCj4+ICAqIEFubm90
YXRpb25zIGZvciBnY292DQo+IEhtbSwgLi4uDQo+DQo+PiAtLS0NCj4+ICB4ZW4vYXJjaC94ODYv
bW0uYyAgICAgICAgICAgICAgICAgICAgICAgIHwgNiArKysrLS0NCj4+ICB4ZW4vYXJjaC94ODYv
c2V0dXAuYyAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tDQo+PiAgeGVuL2NvbW1vbi9jb3Zl
cmFnZS9nY292LmMgICAgICAgICAgICAgICB8IDggKysrKy0tLS0NCj4gLi4uIHdoYXQgYWJvdXQg
bGx2bS5jIHRoZW4/DQoNCkdvb2QgcG9pbnQuwqAgSSdsbCBmaXggdXAuDQoNClRoZXJlJ3MgY3Vy
cmVudGx5IG5vIENsYW5nIHRvb2xjaGFpbiBjYXBhYmxlIG9mIHNwb3R0aW5nL2NvbXBsYWluaW5n
IGF0DQp0aGlzLCBidXQgdGhlIENsYW5nIGRldnMgYXJlIHdvcmtpbmcgb24gdGhpcy4NCg0KfkFu
ZHJldw0K

