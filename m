Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED255831F1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 20:25:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376413.609161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGlid-00076j-E2; Wed, 27 Jul 2022 18:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376413.609161; Wed, 27 Jul 2022 18:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGlid-00074C-As; Wed, 27 Jul 2022 18:25:15 +0000
Received: by outflank-mailman (input) for mailman id 376413;
 Wed, 27 Jul 2022 18:25:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEwU=YA=citrix.com=prvs=20023c9d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGlib-000746-Ed
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 18:25:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71cd0ccb-0dd9-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 20:25:10 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 14:25:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5446.namprd03.prod.outlook.com (2603:10b6:5:2c8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 18:25:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 18:25:03 +0000
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
X-Inumbo-ID: 71cd0ccb-0dd9-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658946310;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eQzNJuj920UfW/Be2q487o/iz2aiVXytfzwbZjlyfp0=;
  b=WKHA5/1mymzCdbXpis4Md7yabyApGsoqYsGaJp71btGNRWh7rOv+6uHc
   sc0v+pcjmfH79wuuCtlGdBIGycSmeiuoHa4KCHss9Owd6P+nhihaHGvvQ
   VjJGLk4VMTRjMHaaJcIDtT2M+AYjQE+A+fFPbY0MkQ9tlQ3Wc+DWPRw8O
   M=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 79339942
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Vg28T6KsFYyNE266FE+R/ZQlxSXFcZb7ZxGr2PjKsXjdYENSgj0Cm
 GcaUG3QMveMMGD3eIp2bITjpksFvsTWzoVmT1BlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/3Z90s11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE5+RXXWIPJL8k8OspQmNw9
 uUfJi4LYUXW7w626OrTpuhEoO0GdZOuFqVP/3ZqwHfeEOosRo3FT+PS/9hE0Twsh8dIW/HDe
 84ebjkpZxPFC/FNEg5PVNRiw6H12z+mLGQwRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPOkmHUoy727gPJtST1ZK0qKue8z+NjnlPImV1QF0EVV3Lu9JFVjWb7AbqzM
 Xc8+CAjsKwz/0yDVcTmUluzp3vslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQCy
 Vuhj97vQzt1v9W9VXOY3qeZq3W1Iyd9EIMZTSoNTA9A6d+zpog210jLVow6T/fzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:KWYU9a7cfiFTD++LWwPXwZGCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+843WBjB8bZYOCAghrmEGgC1/qu/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXerIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonis2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlaQkEyzzYJriJaYfy+Azdk9vfr2rCV+
 O85SvICv4Drk85uFvF+CcFlTOQiArGoEWStGNwyUGT3fARAghKSvapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jRiuCQlGc1sRKEkjTVo+a07bWvHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TpE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZeo6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z44HSKyGG4fIyQZ0Wc9igF3ekJhlTVfsuZDQSTDFYzjsCnv/ITRsXGRv
 fbAuMiP8Pe
X-IronPort-AV: E=Sophos;i="5.93,196,1654574400"; 
   d="scan'208";a="79339942"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhKFUMJdNqyzgQfaGRYDyJzJERdbeMEKTYDJbQ+MLJHm3zSREI2FmlnrMjry1V6cj940pzP9UTYhjFiQ6PTYcPexdOhFPKa61w1zpvGvDK898/rPBWf3lEoMEi8ykHfzlNjqaOxYlbzIaOiHUxSL5jxGk/4F8Wdd7ATXfhLiR6UEIIYdeZBEhH1X+DVsPyEM1rXodF9vlXLDu+HwR6SlNDBWUt7sh2ZrlAto7rpAybLFwf5CPQ0rdwIE70uSLSSJTPM4jroaWEgv4BDJQ++6uneiWsWEJWPjyMfL4IPUGIVQwRIuTuXuNB+PTMJOJw/CwVnLFbNyKB0cj9wA6w7a3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQzNJuj920UfW/Be2q487o/iz2aiVXytfzwbZjlyfp0=;
 b=fjzEGqoN8de9QMUA3dWJOaURu1jjB2/efvKtUIco7wgYIkr5nn290wRzXSsKP+sXcUfFJSryy/M9Bx+IGiIUrYSGQWDvddmIvsv3vQrByW75Kugl11DKDVCx87kkE6hxGEUKJ0AhqKyj9bwuPZgOHDN/mk+w4GGu+WgSxa0rB/+GhXPsgR4p3Xan0JQ8PL0OPS23OvdtjK1DNFXdkNlBjIuFA5js6TccZKHVBwkz7aaAY/0sjMZf7CKmJDcWA4pIiToIhpnRcAYpmls2xxk7eLrm0ubh3k527q7L5jQEasux3wIMhQIi+qOmjs4qEWSaCGhRF0dUWhuwVAD3uFqI6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQzNJuj920UfW/Be2q487o/iz2aiVXytfzwbZjlyfp0=;
 b=SvmTyWMeZB10CFTZR/txXslZms+jarT3HXdlFzz5BPxCpAmGTVpkVfHQG3Ao5R4y4Jp9MHZmCIO4UyJAeEdp+evqZpbjAyt47iAsFKndna7jPARwrbqPGCJy3YJ4uGdAIYV8K57kRwsz88ic1rzz2XWFDYqhd5yQgPPkMT4CFiY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 7/8] x86/mm: adjust type check around _get_page_type()'s
 TLB flush
Thread-Topic: [PATCH 7/8] x86/mm: adjust type check around _get_page_type()'s
 TLB flush
Thread-Index: AQHYoQm4BqyiOS+zvEeDI26X0DRJza2SikyA
Date: Wed, 27 Jul 2022 18:25:03 +0000
Message-ID: <764ae641-d445-f4ba-662a-c965ebcc582e@citrix.com>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
 <40042c40-a2ba-e491-d16a-4bacbfc6154e@suse.com>
In-Reply-To: <40042c40-a2ba-e491-d16a-4bacbfc6154e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba3dafc1-84c9-4ee8-e175-08da6ffd5320
x-ms-traffictypediagnostic: DS7PR03MB5446:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 w9td1j1GuAQrp/Z3PXSJZyH9y1SU1Zn13gYdaix+MLk6ykC3Vepc0yHwAlZR921+JSvdgNyy9bznkeLApQFtAiPorY08Ub8bhO/NKhzThsLg8VflQw/qYDJRwzHOduzfMPAKJHE5MOHHXD4tWr+p1ZrJlliqRCFu4ip+r7QaWqdqw3LmtXV1VMnm/pIAAvth48ppaHwiT7wEFg0TD8HI7UBByITjFWSHoxob8T45Tr0JEs6k+DpxnnlYQ1UTcDKt+MwWOg6JFknQDbb3y4nkmqNaxrqHpJpr88PuxZSuhx2AQYcTRFbNQhmmHsSl1h/MRTk22x2/EQsJ9+F2EupLnlK0Y0RaYhHmXUi1JEk9XuGDCR81NACe/WnZ0amRzGFWQWbJ/jS0nYoJz86qRSh7ruKMjkL8+G+3DDh4v8WQedkWF46niSRisTccxpTa4aex8Vsj8fF2eWLOuzxuLE57K02om3HDvjKV6eVKoW6Jz4L1wvU5heYSW75kKmCk70Dt6Y7meaohUCX0q6p8b4y54NZ+GYZWQXkVdaS86l94nlchJpJrc1rpz7nTa051roHgFKHWivC30ddkhs2/qCO0oh51tOt0kcoRu6cUKOa/7jKfTvLsvy91zF0p5vLj00LOPS9QAURXTeK2YtWoPaxb4RMkgTyBf68lllRd2umUIYJixMH6kDElKWtYNXxBSHjYqwueDcVyUSKN6PWDK4JnEPAcX/OBfcGK+c1x7lghp/Io3z087oBYj0V74a3ldv6wXdJEmFssvLoIJC4sC797t/QRUL06HN7PxM6gnCu3MdsZdA090qQfcqgns+RIA0ewwJ3lP2+taC87R/8hyE3HVKU0Ag06kW89vehz0OFT1DU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(186003)(53546011)(110136005)(6506007)(41300700001)(316002)(6486002)(2906002)(71200400001)(66446008)(82960400001)(4744005)(478600001)(66946007)(91956017)(8676002)(54906003)(66476007)(64756008)(4326008)(36756003)(2616005)(66556008)(31686004)(86362001)(26005)(8936002)(76116006)(6512007)(5660300002)(38100700002)(122000001)(31696002)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N0hSVnFQSUpQdzE1UTFxWXZ1Z1hLVlVWK1NjLzVobk0vcWcyQ3o3SHkvTStv?=
 =?utf-8?B?djVSYTdPWVgzLzFEakwwZUNPL1VyMmJJdC9ENnAva3MzSmRGaUc3aUdGQ3V6?=
 =?utf-8?B?Z2pXaEhBQTBQODZjZW9yb1JaUGdNN1NtOVFkTUI1ZDlnOENaSzY5cW1DaVFr?=
 =?utf-8?B?TmRCRmdGVkVvZStVOTl4S0p5Q2lZV0ZIREltTTAwMHo4RU16SjNkdk1GdHd2?=
 =?utf-8?B?UjdudU45Qjc3UlFDM1k3YlFWY0dRSndybHJCc0lPTVBweVNxMEo1VFdhcnZo?=
 =?utf-8?B?U2Qyd3VyTFpTQjNWdFRldnlJakhFdXp0R0w2R2tHMS8yN2xvbXVhZEVKQXMr?=
 =?utf-8?B?VFN6dEw2OU4yUkdmeXJNOU9wc3ZmRnVCeXQ3enhRenI4ZUlSMVVPTEd5blhT?=
 =?utf-8?B?bEhubWxNYmVjdUw2dW9UVHBkeTIwWFQ3UEtGVjg5SU9kWjJrK1N3YlBVNXdo?=
 =?utf-8?B?aS92bW14Mk9IMmRWNFE2RnlLZjVBZ3Fidkp5QmZhMHhvb3p4cHRGNjlkNSt1?=
 =?utf-8?B?R0hHeVNPa0ZNZGluRmMxVnZMWWtnanVIM3FkMHBhalhYYzY1V001Y1NuS3ht?=
 =?utf-8?B?L3FCZ0pYNGIrcGxISXJyWlI1MEQrZzNHY3JFekx5aU51eWR5UVRNZkVrMnhF?=
 =?utf-8?B?QXlTa0VvVWNpZXgrUS9yZDBBTStjTnE3cXdxbzQ2M2V5UG1MWHB6SjFUZWNT?=
 =?utf-8?B?YXI2R0FVa0JVTTkyVExkbGhVd2hLRXFuWlFYQTh4TkJMblVmR2xiellOUmdV?=
 =?utf-8?B?N0tDQXJxU2tuQlNybWZHNzF5ajlzc3ZCYWFIaDNEaVpqUklzTi9FU1BwVWFx?=
 =?utf-8?B?am1nZ01TdU11aUR5ZXVpY3M1ZnNDbFVtem1LYXJGVTk2ZnpYU3ZJeEpQd1lL?=
 =?utf-8?B?UnFCQmxENEZzV0ZxZ0lGdTFXalhlY3VOL0RHLzZXYS9aTWMrYTVqM1E2UWIy?=
 =?utf-8?B?YVlKZExROVJ3eUlwTjhZeUlmTW9wM0xFU2trTzQwWEpCMzRvVG0yb3NBYjEy?=
 =?utf-8?B?aS9xZkw1YUpHWmUxbVJ1Ump4ejJjOTdIYllxK3Z1MkJYdGorQXQ0RU9BSkwy?=
 =?utf-8?B?TTZoR3RyOXhKM0hmdEVzRjFhcGh2MEdaTlJjbWNNZXNHbUI0cEN4T1RKSmpJ?=
 =?utf-8?B?Vkw5dlVZVjVxSVgwdTVOQW5NVDc0TTg5ckxSL1ZQcnJJbTljNDN4bDNpWnYy?=
 =?utf-8?B?dHRLZXA2YXdUKyt0b3R5QzVaUUVOdXluZDBPc2NLZmV1UE0wSEY3RE9XYThx?=
 =?utf-8?B?ZFNQdDNObXNMbTl6d214MDZHUTZUeWgraVBQVDVuTE9VdUhtRWVFc05vVzBa?=
 =?utf-8?B?T29kaElGbWsyUWdKNTU1dzd0QmM5OXFhVWVGekZ6RlUxZElKWWNmZUYvYjJE?=
 =?utf-8?B?YWx4UW9jeGQyQXl6SVFiTXpKN01rRnJqRjBLMWVDRGY5ZE9GQ1JZN294emU2?=
 =?utf-8?B?eDUyS0pzZjRZcE5leDkxaU8xM1BaQ2hPbys0NTBmUEFZZ1VQM3dkbitibG5N?=
 =?utf-8?B?eDFhMGVDVmdsYzR5TlBTSjAyNlhtSHFBNVVmbnU5VHpqeEc3Skcwak41RExL?=
 =?utf-8?B?Q3pDWlFrQzA4M2pQclJCVlpzMWFzWUZvNy96QVRsajBLck5SbFh6dmU4dUJw?=
 =?utf-8?B?SFhtbGtZNmpNM2EwdEFjc3NlOW02MXUxSUhHYUdpYXVqZjJjSjNOTW1WaTB3?=
 =?utf-8?B?S3BRUzZHUUNibW81Z2k5aVNNRy9OQzNrUTNYazIxdE53MjZWWWI4Z2JLWWFy?=
 =?utf-8?B?b1kwZzg3L3UxeklOQ0FTSDRDaGZ0aTNlS09Mc3pNUHhVcENKbk9sWm5CLytD?=
 =?utf-8?B?eUttOEhtTjFIUFVDSFV2cjVXVW1vM2NQVWx6aC9SZkxmbjlPY08wc2hDWXIz?=
 =?utf-8?B?OU52RWp6QjJ1eHFwZnJoSmVxcko4bXB4a3pQV3FLVlFxZXoyTkk5UzRjMnRH?=
 =?utf-8?B?bDR2S2tYcGUzdXJ2MjNlNmhCN3BORXZYeU9WYXMrS1k4VDZ1aDZKdXdkaFVa?=
 =?utf-8?B?eStyZGt6KzI3ek9vV1p1VVJiN3ExZG5jdjRQcmhZaDYrYys3UWlNM0JJMVBX?=
 =?utf-8?B?R0RybEVPTUZkbmYyK0hRZXQ1YkkvUkQ5U3BteXQ1RDVuN0g5V3M1M3laclkv?=
 =?utf-8?Q?n3SI/XojFWDKqvTvYWpYJzKUb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6384283B9EE58A4F8BFE68CF26F1D958@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3dafc1-84c9-4ee8-e175-08da6ffd5320
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 18:25:03.7794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XMu572EB4R09HHmVlk/vel1TGUONkfJpDwCRtAN1/xSWJZpN9iF8C24lpAi/CMX73eEOS1JJZ7w45rKCayYzk5cT0m4Ug4J2gVMD0jyL37U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5446

T24gMjYvMDcvMjAyMiAxNzowNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdoaWxlICJ0eXBlIiBj
YW4gaW5jbHVkZSBQR1RfcGFlX3hlbl9sMiwgIngiIGNhbid0LCBhcyB0aGUgYml0IGlzDQo+IGNs
ZWFyZWQgdXBvbiBkZS12YWxpZGF0aW9uIChzZWUgYWxzbyB0aGUgcmVzcGVjdGl2ZSBhc3NlcnRp
b24gZWFybGllciBpbg0KPiB0aGUgZnVuY3Rpb24pLg0KDQpXaGlsZSB0aGlzIHN0YXRlbWVudCBp
cyB0cnVlLCBpdCBkb2Vzbid0IHJlYWxseSBleHBsYWluIHdoeSB0aGlzIGlzDQpyZWxldmFudCAo
b3Igbm90KSB0byBUTEIgZmx1c2hpbmcuDQoNCkFzIGZhciBhcyB0aGUgY2hhbmdlIGdvZXMsIGl0
J3Mgc2FmZSBvbiA2NGJpdCBidWlsZHMgb2YgWGVuIChJIHRoaW5rKSwNCmJ1dCB3b3VsZCBub3Qg
YmUgb24gMzJiaXQgYnVpbGRzIHdoZW4gdGhpcyBsb2dpYyB3YXMgZmlyc3Qgd3JpdHRlbi4NCg0K
fkFuZHJldw0K

