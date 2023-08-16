Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8494F77E99C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 21:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584901.915790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWM95-0004Wr-AH; Wed, 16 Aug 2023 19:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584901.915790; Wed, 16 Aug 2023 19:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWM95-0004Ul-76; Wed, 16 Aug 2023 19:25:31 +0000
Received: by outflank-mailman (input) for mailman id 584901;
 Wed, 16 Aug 2023 19:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wzLC=EB=citrix.com=prvs=585ac1913=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWM93-0004Uf-Hk
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 19:25:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6d5fe57-3c6a-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 21:25:27 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Aug 2023 15:25:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6486.namprd03.prod.outlook.com (2603:10b6:a03:396::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 19:25:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 19:25:11 +0000
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
X-Inumbo-ID: a6d5fe57-3c6a-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692213927;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VpQfsriir6rkENSihLl2j2T/FVyGjPmkm6Wz+HX/D1E=;
  b=MIGcrIjAcixP+8ftplOIAgQitdlaud/ruJy2kz9CJJHA3FKYhjfoL0ur
   i0OvESawdqDn7Ih/hLg20OIqvk+lzEAFWew9gwY4Lpq1M5vgCWGiHZpit
   yf9f7e6Ns4szGQFytGm+CXNmpDtdY+AjQyb3nNnlZjvK5EGsXrzdiW5Oq
   k=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 118366643
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Aqq3la5xxq6W/5LuYqgpDgxRtJDGchMFZxGqfqrLsTDasY5as4F+v
 mMYXz+OM/ncMDOmfot3bYvj8k8D78eDz4M3QAJtrCFhHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPaAS4geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 +0yOBQ/Xwm/h82Uka3rVdF3lNU6M5y+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojuiF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLRObmqKA22zV/wEQ6NUZGenfkh8CEjxCTYfZid
 GkGpHQX+P1aGEuDC4OVsweDiGWfohcWVt5UEus7wAKA0KzZ50CeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaOyETIXUTeCwsQg4M4t2lq4Y25jrtZNt+FK++jvXuBCr9h
 TuNqUAWmLE7ncMNkaKh8jjvgS+op5XPZh444EPQRG3Nxg92aIOqfYWA9UnQ7fEGKp2QCFaGo
 hAsl9CF6eESDbmEjCGXXPgWB7at+uqENzvHx1VoGvEJ1zmr4W/lQolW7xl3PkIvOcEBEQIFe
 2fWsAJVoZVVbH2jaPYuZ5rrUpp6i6/9Cd7iS/bYKMJUZYR8fxOG+ycoYlOM22fqkw4nlqRX1
 YqnTPtAxE0yUcxPpAdajc9EuVP37kjSHV/ueK0=
IronPort-HdrOrdr: A9a23:WpWhEq+wFAK1/ziI8bpuk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-Talos-CUID: 9a23:jqFSDmF1XcCTYQ4yqmJN5WQEPvIUa0Hd41WBPB+nMX17WaSKHAo=
X-Talos-MUID: 9a23:vV/tigUHJ7IXzILq/BbR32FNGJhO2pmrVm03tahZntvaaxUlbg==
X-IronPort-AV: E=Sophos;i="6.01,177,1684814400"; 
   d="scan'208";a="118366643"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRJKPV6dNt4xTYuDlP4GseqUDScvleRFhOaCBAVv0WLzFTf/BPuD9GwKolplINjZHn9G0mlfQQYHyByMHeDX1pExxdU6rrl6Y6P62g3riwzYz0S/xzre2iQMm909E2Xl2hUIOgumQgAA4XS0geATyrF4BSguIiEWeRCwYw0C07ogMSLjCGbnmaYDeiCfr3cAiEQ4ZQovdgEnR5HfaGJwOE+q51mTb8CDJNaPgtuotMQQSP0x+QPDFWlhUCPZij0p1bL+eEAbKfwdZq4NXkP0yDsuOFcqVSTL8eYF4DfceejUEmcNvL8bEWkxP9GuVURXPmB5cZipzo5XZhKZTcm3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoSRE/6FJlL9EzDVNVmBwF59LvyqOcX4Ft5ztafqC9o=;
 b=PvnNlDR7hy/WynOg5NHfjt7+Kp87uFxafmPxdklJHiq0LMCtojn0K/X38d0OpGsoXH6q0LeIOlru6L/v6kofFS3KmdAAx/kN/X7Sk0bMMkwxrcVh7llb0y7KYOK+FU9XcM5ubaaXz4URSXVrm8u/lykeogvx+8/MhzYgW79fY+y0wsU3SDrpcBdtLs3+j626BknYHZMM+M9V2UAvMvzMyVt01/BLjXbUbDQH21xAg6YyytZjj3Sajpt+9hjj6gP8x3eWzoH1q6PZqAt5UcGjboeW5lGiU9U0f1bydmx3XhJkkNBFWOJ2TXKwxJuRwWlccmbWi7Us5v8AJNHT15zZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoSRE/6FJlL9EzDVNVmBwF59LvyqOcX4Ft5ztafqC9o=;
 b=T18OwG5I2HXpY1Odi6JqrKoGEYOezsCbs2qNlx3zNDjg2VpC4wnqdjPQy7C/JrpEPdHvZybi06Bfw+G14TSBRvF+A1GGvCN5tyrqXdoLpuKy5JgjgeWVtV2RBpx8w8Okov8ir3//qNnKFNaMmPDIu1FpcNyBTRD6BCe0lu6ISHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <93efb487-c0d0-92be-5287-b3c67e27fc0e@citrix.com>
Date: Wed, 16 Aug 2023 20:25:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 02/10] xen/version: Introduce non-truncating
 deterministically-signed XENVER_* subops
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>, Henry Wang <Henry.Wang@arm.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
 <20230815210650.2735671-3-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2308151708070.6458@ubuntu-linux-20-04-desktop>
 <5f75e037-1f73-f7be-740c-715902d5d9a0@citrix.com>
 <alpine.DEB.2.22.394.2308161204120.6458@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2308161204120.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0193.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 76fdeb75-9e75-4cdc-40e8-08db9e8e8249
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fpSv1MwuoKYQPOSRnhyWZcymdGBy4DM1DjDcH2tMlypkO5uT3Q6AMMpDo3+At1n3obO4TWJHKYyh22K1uLV9G9RK/8QxbvTWxqLq4rwUOOUfkykwFsQIG0wNVvDllOOilCrPXDuuXkh/SWDli8EbSMIwiQ8CdJOjkcdzjfF3VhfMYJDCXWT1Nq3afeKNhZq0nP/0nJXnqBP+NFEg1m507t8n/z1tQwMy3Swd8e6iUahoNdOObdiXsMXRRJG5f2NZYElUl/4VdJY5K7J5qEIrlhRqDErlMLgN2jNm11T72QGLXHcp9rWc1Aok4w/yXJgVr+dOv9XeGJc7QR6GzI//H2FTHhOzJwD+z2Oh10Vp4A0bBjoMgM5/aLj/AMilok1pg5WZT+UaeEaKzMUKRj4OKQeRrbR91YOpfmDrirgvI76cDjX0gcqTglgEvakbZ2DDkTju3KunkBCEI0RrVZPXCKTwOesOb/xRLYzJSCTAC5h2zRTXvutAC+72/ogVpFHU6okFnbYoHwL4ejg0hX2l7AGT2HlekpkdQj/asFCIEn+BiD+jxNCt9AzWNXS9CJLjbDbxHDCLP8JVld1I8wBLDMC6BBBocdfIT4tg+92SK4qvsqzEyLzI9D3kwYd5qQw3SplXGExkxsgX0KhANZ/9jg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(7416002)(6666004)(478600001)(86362001)(41300700001)(4326008)(8676002)(8936002)(38100700002)(5660300002)(316002)(66556008)(66946007)(54906003)(66476007)(6916009)(31696002)(82960400001)(26005)(2906002)(36756003)(2616005)(83380400001)(31686004)(6512007)(6486002)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmhqTzd1U2RQTCtWcFpBd0N5T1pXd2tpdnNXRGNPdVZNdjFPdElXU2F6VDlz?=
 =?utf-8?B?S05iaHBKdWZVcW82MkpSMUlWYTBUM2hlM2p0U3BQSDEvVVFkaENyRUdWTGFU?=
 =?utf-8?B?eHRjcmYwdWZKbjZpR2VRRFBSODY0cmhzSlYwTDBiZzFONFIvL1BoYjgxdGdR?=
 =?utf-8?B?RnhtTGRld29wczlOWEljU1hKMWRLenM1ZnlXTytKcFlVRloxd2Z0K2QzL2xM?=
 =?utf-8?B?ZU13YjVzMVNPQUpRYWtxNkcxZjZjb1JnaElac2lreDBadFJ0ckhqc0VIV3pn?=
 =?utf-8?B?cEdQSUNHaU1ocHZ2ckEvNUhtaGptbzRuUldVMFJXTUJ3Tms0SCtoYVBRVnox?=
 =?utf-8?B?c2pJb3d1SXAwd0Q4d2x6L1lnOG9kK3FjaTllelRMQXgrVFpDSlgxS1NHRzRE?=
 =?utf-8?B?TW00ZndrMGtZWkErY1FEVzBXdDA0aUZOYVlodEdNdUhmMWpDc3I5eEc1QzdC?=
 =?utf-8?B?V3hNZjJiTDFMaWo2TlpYdEJmd0JlanRZc05KaTlsQ3JYUllNQ2tITzR3WXRy?=
 =?utf-8?B?L1o5cG5QQi81ck5UdGRqNDg3bTRrSW5qenR4TmFTRHdwZXF6b1lkYkE2VVp1?=
 =?utf-8?B?K2lQVXl5RlI2b1FwMk9IR1RLWG9sb2dDZEtmczJhVnFIUUFHemtoSWpIZ0gx?=
 =?utf-8?B?VFhuZk0rMkhjWVpLaEh4TVoyVzFqT0RzcWxpWldVV1g1WVhZU2pKMHJIeTcr?=
 =?utf-8?B?OUNiUXk3Z3J0SHlCcUVrdG1kZnRNUndjUWthcHhDN3dtRE1lb0Y1L1RXcS9O?=
 =?utf-8?B?Uk5IL3g1OVFlbVNFL05XVk95bjI5SXZMUWplRkg1TWg5N0xDQUFWZTBHblJ3?=
 =?utf-8?B?bllZN3loWGxKRzV3VUYxS2RNQ3ZXd1NYZUZkNEdoMXdKTndBdUdjYjdHWktk?=
 =?utf-8?B?YlFkVU10Rk1JNnN0MkR0UlZubXc2WHVzUU04OTRVejJvT21pRlNuYkxCY0U0?=
 =?utf-8?B?ZHhZeStQNXFhNEx1NmpnbjMrYWppNDRHV05FMGpmT0dpUit3d2VTa0tsTmV1?=
 =?utf-8?B?ZThKTTVHM0kvMk00alo3eWVXTnBFM01mTzZrN2NUbjgvenROYkhxYUlEeTNB?=
 =?utf-8?B?VW9RTkdYSEV1eG56ZlJsMHpxbUZVTU1nYjhsb3h5VVFqMXh5T0dNTnI2OENK?=
 =?utf-8?B?VmdsMnk5VTZYOFhvKysrVVY4V1lpUHZPb1VGeHdha3IxV2syVUtLTkprSG5M?=
 =?utf-8?B?enFhK1dqT1JPZFV2eEpGUU85TVdQWGRQQlhSeUVSSFFqQW5GUXU4bEI0ZkFY?=
 =?utf-8?B?OTlZSjM0V1hsVHMrbGo0Y1RVbTVyUkFFV3FuTXlNNTBreXRWTFFoR2lzZUNk?=
 =?utf-8?B?YmFrd3E0UGNsSzZuSFZ4MUxRcVNDdVUvbzg1S01rR3BaWXI0ZSsvbjRvRXRV?=
 =?utf-8?B?TmlOMVEzZjdsTFhnRnJqMGhFQjgxVWtFc1c0T1BJTk9tQWJDQ0lYMUFGTkth?=
 =?utf-8?B?bWdncE9pbHFZNG0wMVdBNTR0ajB4RllISlAybU01QlgyVkdYRGprUllseVUv?=
 =?utf-8?B?OThsUVhWbzNTWUhTbFFNR25KcVYzNHdYajhEZVlxTjkxVzA0K0s2eis1TGor?=
 =?utf-8?B?SkZXQ3FjSEs5RnBwZnFmYlBnaEVYbTZwK1VGNElDYmVnMG5OZk5rTzgzeU82?=
 =?utf-8?B?MG5sRTEvQmR5ckFGSXFDOUtMR1RObnV4SWtQck1QYmxFbnFWSlZ2Zzk2QnVv?=
 =?utf-8?B?WDZrMDJKb2JmQUZOMVkvejY4RHdYNGV3SW1kTDhpR04rVy9PWVlMcGMvbWpJ?=
 =?utf-8?B?anB0UUlndTMrdGJENEdVcUxQakFuUDI2R3l5QzJsTk5RNXRqUHlISnVhNTFj?=
 =?utf-8?B?UWMzWXo4VE43Q3JJTWErS3Z1WGNqNVdBS0Z1VitLUXo4RnJBYWhWeTg2R2Yx?=
 =?utf-8?B?T0N3UHJJRG1QR1BFQkxpSzFrcmFneDBsTGRnVjNYY1lLc2ZFd1VESWJocFFn?=
 =?utf-8?B?WmRNUm9yU2xJYi9MMFVpcFhzZG1IK0dMOTJselVSMTYySzY1ekNqQWZKR21L?=
 =?utf-8?B?VXM2ZGlBRWJ5OG9MeFBGRXhIVUJidWxySGtIclRFV0M2djNXUTRKQ2J2aWJ3?=
 =?utf-8?B?RC9IeDdabXl4MEl3dzhnRE5IYXhlT2kvd3BwMXFUVTR4c2ZuR2p0YlBJSlZz?=
 =?utf-8?B?K3RaTXBCeWgyZFpHeG1PSDl6bDY5SkRya1ViZ2t2clhtVWtKZGF4N1oxK2Zr?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Y3Vta3U0blo5Sys4R3hLUFlhRnpnMmcxVDh3ZzZqSUR0S0pQdzUwejVVOEtU?=
 =?utf-8?B?TkI3S2FwTE9ZWnVMak9ubk5qM3ZDd1RlM1lwR3BHcWJvS0luRHJOUDluVFZT?=
 =?utf-8?B?aFJSbWpjbllRbFppVG1DaWlTN2ovNWMwOGxnMkU4bXFPcy95NkphS1NaVGlG?=
 =?utf-8?B?NFRTTnJhYTV6SU84QnJzSzJOU25IMU05NVo4VUVqTXhsTjF1UWRVWWNkRG9s?=
 =?utf-8?B?VmZaUXZWK1pTWmsvTDhJdTc1NnptSStEWUJnemZxdjRmUVY4RGtjWjJydlll?=
 =?utf-8?B?M2MzbmNGQ0JqOFMxVFQ1OVVFYStCR0dFY21UcStUYTNwRXBvQUUvaW85b1dZ?=
 =?utf-8?B?Q2ZOZFVZekg0MldEb2w4UkpHeHdmeXRkWWVBRWF1UUIxVjVKSkdjZ29hcWNC?=
 =?utf-8?B?bWNyeWd0cVY3RndMRmxHdHd1RlNodHpoaktTV3h3YnJYMVhWbUxOdnhobUQw?=
 =?utf-8?B?RUgyc01tb21lSXpXUElYRFRIVWRTU2xYSWlWVEJhYUJIaDdxeTkwdXRFRk4y?=
 =?utf-8?B?TGlpdHl4TGhrTXMwcGV0L2NLNmtVeWs1Q0hOK3pmcFFhOXZwc0FPNnZWbjN5?=
 =?utf-8?B?WkU0Q2EvR3lNMkJVY2tOMEZWd0pVTktuQ3JTNmprbG9HTFVQT0RCQmZKU085?=
 =?utf-8?B?QkptZ2E1aHBuelpSb0p6YWFrUGhjbDR5bzVGV1d0RFl6M00rZERpRWNtRGg1?=
 =?utf-8?B?UWd2L2VlZWpLZnd1bmZZbWdGNmIvVC9YemlYMEtaOGp6czdyQ0NBaEhBY0M0?=
 =?utf-8?B?Y25IclM0MHRoUHA0ZHJ5Nzl0YjJmbmUxN1JsSjZsem9Pa2Q5d0ozNG1PenVo?=
 =?utf-8?B?MUcvTW04ZUhXdXdyTDRpRDc3NXlnTytUaUEzN2VaNllZSFBiOFMxMzB4NFJH?=
 =?utf-8?B?cTdwTHdDQmsrcitTQ1JOWUZqeGZJZ0djclRIVjdLZEREWkxvQXZ3UGtyQkFx?=
 =?utf-8?B?WVBqbDJJaWw3MkM1WlpLM2RmbGg2WUFtNUswN21IQjdPNGZXb2tUTlJ5NFFU?=
 =?utf-8?B?N0U2ZFRPY0xlLzE1bTZ3dkRjUDZ5L0FrVlpVWG01VEpQNU1RbC9SQ2VBcjRo?=
 =?utf-8?B?QmZWSEozREdWL3lsMVl2N056RUt4OFdHSmxyVjg4UGdNTlJ6NXV1ZVlzb3pX?=
 =?utf-8?B?SklRT3ZxeUc5QjNKamtocnJQQW1NRmUzS2ZVa1lUWCszeEdBcllLZ3cyTHhj?=
 =?utf-8?B?VFZmUjFZTUcwN1VqNGNqalRjWjRUZVR5WXhCbVRmZTQ1dEpnVVFwbkJ3ZDJr?=
 =?utf-8?B?UE02SWZibE5uS0E0Z0tHZEU3NGZ5YWt5aFNxNEtPNEp4clB5cXNWTWlkaUN3?=
 =?utf-8?Q?Kd5mjKg0DGTl8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fdeb75-9e75-4cdc-40e8-08db9e8e8249
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 19:25:11.4167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxAogPkTX37P3eaKAzkvxAtrs4RU1IxsxeyQcZsQYFEofw9RkrZkqu1WFGsDbqzQPgg3Zsnr9Km6ZK5k+7BnsFQvANNisFjse1SFzUMGEdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6486

On 16/08/2023 8:07 pm, Stefano Stabellini wrote:
> On Wed, 16 Aug 2023, Andrew Cooper wrote:
>> On 16/08/2023 1:19 am, Stefano Stabellini wrote:
>>> On Tue, 15 Aug 2023, Andrew Cooper wrote:
>>>> @@ -498,6 +499,59 @@ static int __init cf_check param_init(void)
>>>>
>>>> +    sz = strlen(str);
>>>> +
>>>> +    if ( sz > KB(64) ) /* Arbitrary limit.  Avoid long-running operations. */
>>>> +        return -E2BIG;
>>> Realistically do we want this buffer to cross page boundaries?
>> A 1-byte answer can cross a page boundary, even if the hypercall
>> argument is correctly aligned (and even that is unspecified in the Xen ABI).
>>
>> But importantly, this series is also prep work to fixing the cmdline
>> limit.  1k is already causing problems, and 64k is a whole lot less bad
>> than 4k when we enter such corner cases.
> OK. It is just that 64K seems *a lot* in this context. But if you have
> reasons to believe that 64K is a good number for this check then OK.

Remember that this is all Xen cross-checking (or reporting to the user)
the length of Xen-owned data.

If the system was only booted only 10 bytes of cmdline, this will only
be 10.

If OTOH there really was 5k of data, handing E2BIG to the user when they
ask for it is slightly rude but is infinitely better than just
truncating it and returning success.

64k is just the upper bounds sanity check for "get a developer to look
at what's going on because this probably isn't what you thought it
was".  Eventually when someone does find a legitimate use for a cmdline
longer than 64k, it will need upping, someone (else) can figure out the
long-running-ness of this scenario.

~Andrew

