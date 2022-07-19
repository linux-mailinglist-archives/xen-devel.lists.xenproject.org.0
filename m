Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B34E579669
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 11:34:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370501.602289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDjcr-0000Dl-Qt; Tue, 19 Jul 2022 09:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370501.602289; Tue, 19 Jul 2022 09:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDjcr-0000Bj-NT; Tue, 19 Jul 2022 09:34:45 +0000
Received: by outflank-mailman (input) for mailman id 370501;
 Tue, 19 Jul 2022 09:34:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LuP=XY=citrix.com=prvs=1929f1d84=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDjcp-0000Bd-Vk
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 09:34:44 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0364c719-0746-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 11:34:42 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2022 05:34:35 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6166.namprd03.prod.outlook.com (2603:10b6:208:31e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Tue, 19 Jul
 2022 09:34:33 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 09:34:33 +0000
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
X-Inumbo-ID: 0364c719-0746-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658223282;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=jGaxPw67yNaomW5LUh7x/857Ud68s40Hrtq/0GtuPKk=;
  b=OT+T3IdAolnJ5Whe+Z7FtARTnjxKX7RTIMDAeXVYvT0XY7WJ4uMorEvs
   Gvkn2uCgscehZE0Vaw3N5IVghzQLEQrhaRMWWMRmhzRyAxrv32eDumw2c
   VELqJ+xPIBs2KvHuVi8RripbrTKQYldYGs1gEV0lvxM6j0DP++DO+ShKZ
   o=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 78681832
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:U9XF56Cxa/6VaBVW/zbiw5YqxClBgxIJ4kV8jS/XYbTApDoj1WEOz
 DYZWWrUaKuONDOhf9lxO4m+/UID75KHz4UwQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pe31GONgWYuaDpLsvPb8XuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW1D++7IpAFEqAdIn6+hTJXlFz
 d0lMC9YO3hvh8ruqF66Ys9Fo517aePNY8YYsHwmyizFB/E7R5yFW7/N+dJTwDY3gIZJAOraY
 M0aLzFoaXwsYTUWYgtRVM14w7/u3yGmG9FbgAv9Sa4fym7f1gFulpPqN8LYYIeiTsRJhEeI4
 GnB+gwVBzlFZILPkGreqBpAgMeeoxP5eosgU4aA++Rmp02p+kBKMx8/AA7TTf6RzxTWt8hkA
 0AF/iMooqUo+EWvX/HlRRqkp3iBtx8YHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbQGDq5WQQHOZs72S8jW7PHFNKXdYPHddCwwY/9PkvYc/yArVScpuG7K0iduzHizsx
 zeNr241gLB7YdM36phXNGvv21qEzqUlhCZpjukLdgpJNj9EWbM=
IronPort-HdrOrdr: A9a23:ASnMCK+NBKFDXgWdRhJuk+Fndb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQkdcKO7SdK9qBLnhNVICOwqUYtKMzOW3FdAQLsC0WKm+UyYJ8SczJ8W6U
 4DSdkYNDSYNzET4qjHCUuDYrAdKbK8gcOVbJLlvhJQpHZRGsNdBmlCajqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOrXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6S64aT1eUZpDLS8KoCOCW+sLlXFtwqsHfrWG1VYczCgNnympDr1L9lqq
 iJn/5qBbUI15qYRBDJnfKq4Xis7N9m0Q6c9bfT60GT3fDRVXY0DdFMipledQac4008vMtk2K
 YOxG6BsYFLZCmw6hgVyuK4Iy2CrHDE1kYKgKoWlThSQIEeYLheocgW+15UCo4JGGb/5Jo8GO
 djAcnA7LIOGGnqJ0zxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NY2SoVC5e
 7DLqN0/Ys+B/M+fOZ4HqMMUMG3AmvCTVbFN3+TO03uEOUdN3fEu/fMkcAIDSGRCe41JbcJ6e
 X8uQljxBAPkmrVeL2z9YwO9AzRS2OgWjmowt1C5vFCy87BeIY=
X-IronPort-AV: E=Sophos;i="5.92,283,1650945600"; 
   d="scan'208,217";a="78681832"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6S8c50RlW/kN/tvJAdH6uYQsHrjzvfzB4JKFcY69QWc2aIp0NVVTRGiZoDKW3msyjGo8WreY0G0jFV9OQp9AtEtp4Vi1WvNcFrvhyA4488JC575vIfRsVBOdGnC9DS9ZesAftkJzEK/jK3FAfuTL5VRT2WO1RN/uEbP9SK6qRyF2MGgutSmZqfn3TMGtAzC7QgFMcLGnaUY/r46B63ByKE1p79q8VIsNZRDrJanjGAKmyWbpkw2L3DgBGdAKAF6Un/fWHabJnVw5M5UqMJsuE85051S2aFYuH0x/GMunlVu4FtB17xQeS9XSiUKKyF/D55hwaiGOfgtxahq8zu65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGaxPw67yNaomW5LUh7x/857Ud68s40Hrtq/0GtuPKk=;
 b=mDUV5kUGrv2e+NHhZ3D+D+sgMOoHV9gGaiWlWJwp1C2FUtE22UIoKu8dd7P1r0EY8OgWVHGLsDjb3XhI9okOrQrkpYNUJ7eijp3M4fpElexXJyyWPC1PGWDofCeMImGILi6+PrHHk4wkhfQgNCfG+FkUlE8I0vZwz1UKbr7mmg+U/ZsjjNfONG4D69RtKFStq8I3F10C4DkAABNVmJ/4pqKZa2/+Dhpoo4AXNU5HkXHXIWmnzScXc3Tv37Z7SrJXn3Vd9LdW9WKLrYpdqZs+3BT2+AO+2G9jAEFvrMmXmqHSqNg6nqjGbnh4KTWhRlvsOuTjWXRY9ZGI7tSLa1Almw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGaxPw67yNaomW5LUh7x/857Ud68s40Hrtq/0GtuPKk=;
 b=G1O09IQPvrAhzom3SCpG/7IX7/4QIMDaffXsDrAyfnVSUcB5/wLU+5iDhP2lvIU17Jrrwm95ILJG9Ze4/3xYFRRheqg0vM+dCLcD4oD/38PI1ClThf9kYBQq5a9uMDeLZm2dp1ZJoaCTLqNWEATQ1eySOn0b6pq9NvtuvZcBppQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Dylanger Daly <dylangerdaly@protonmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Ryzen 6000 (Mobile)
Thread-Topic: Ryzen 6000 (Mobile)
Thread-Index: AQHYmvrX1sLvM09bk02pTR45nk82162Fb4oA
Date: Tue, 19 Jul 2022 09:34:32 +0000
Message-ID: <4c3976aa-dad4-2707-2852-9b26593692d0@citrix.com>
References:
 <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
In-Reply-To:
 <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66ca9dc5-b183-4d0e-2e65-08da6969e32f
x-ms-traffictypediagnostic: BL1PR03MB6166:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3LbRalYS1x9ftqeoAKvrFYbhtjHKGkUZmpzaH3c91PRgyVPtdQuSK5+R0EOkIIh6PLAAlPK/K66dqX/hkDHQsDwGAIdvLnm0YmCK2wzgRpbtY3WYwGZljZQOgo0/BhCdokSgEcm6NSHahGvXEMISqWs7+74JOAoGamqxX5Vd6JFwwvWTcu59CCw04xpKYwbqyIbQCADDP3YOK96uBFIenr1N236wnOg+jOX3fxXWxvbL3P2iwzgh8Bon9j9iqaESCqpZ6QtiPmuYWvKIo8wUReR2W6GU9G1IlVDvdaS3mB53Vmj8UnnM9a3azRc69qoHt4Tk8zLXUjvQpyiMDOKpOFFQZPZ43g8AgqHQAv6/fZZQ4rWwAlpvqjZlfUpikROvZMvhkUTkAOqH+Aka6Z1tYnLCmkqhQvAjURuWQ9t6Dn9wmLb0Svv2gW+L4ITFkwVVbvP/TnszKQ4SlBXXs3ZKSsOg8UM+w/UbiyZnEGIgKoNWtoHR0JoVkXjedZL8wThQ2AE2oA5KVhdiNRssCfMTdZ4nM9DyIlKmv5oQTpbX0cqcYOtbbNYDlucFUtk6VhCdbmhFDi3PZ2m9k6fVLNvEbv+hCmeUtkA8Rs7AdK2v8fIP0sMW7c7XYfGNM/ld2I4/FxUCU+cm7LRAFKpHinG7nbeBH8N8dnjIYkC3C6FcsFKpTexVDfRVC/qxAhjBJe/ZbHjbPs5oeWbcu9WEZDugWG500C3e48EZp2EOqoeV9kBfUfyUDWWA1y22xrwxBv18J0ZoqDxUpy3BCNMZLRr+moZ7fRxraB6360p1UP4uDKAyAMZms4UPNIRwxeXjsLLLjRGQa1fDEFni9CbK87K6WQ5PVLyRuUkadaSLgqmSrXiihYXSazZQvg7PVgJ1751a
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(83380400001)(38100700002)(110136005)(5660300002)(966005)(186003)(2616005)(316002)(38070700005)(82960400001)(166002)(6512007)(31686004)(86362001)(66946007)(64756008)(31696002)(76116006)(66556008)(8676002)(66476007)(91956017)(122000001)(71200400001)(66446008)(26005)(6486002)(53546011)(6506007)(41300700001)(2906002)(8936002)(478600001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWxjK1k2ekNzSzgrMFc5blVJYzVJcHZiTGM3SDhPSlo0cXdWV0p2TGNvbEJY?=
 =?utf-8?B?Zk41NUVjR2M2YkxDbVRKZ2J6aHBlcmFscXBpUm1GelpuYzdDc1dJREFURlpQ?=
 =?utf-8?B?NHpiWnBSWWdDaldxL3pYRXI3ZG1HLzNrYVdkZitBay9WTVh0V1pVcncvWFcx?=
 =?utf-8?B?eTBLWGJWS240NTNTTEhIYy9BOFVwZTBjSk9IT1JOTFhpOTBvRTBpT1ExOFhP?=
 =?utf-8?B?MHZ4akprRFF4Q05lNCtqUk51VnJNYXZ4VzEzMzlHaDlON3RVWDhxVGs2VWZ4?=
 =?utf-8?B?Q3ZCMVdmdk9JRmR0a29GS0tWRjBlMHlNbll2aytnR0tITGZCQUxKMUF6VzND?=
 =?utf-8?B?QXpleHg0aEExcElhaHlCUjg1ZUFxQ3ZCZElSTXJnOUVZZzcxZjNnSmVrYUFB?=
 =?utf-8?B?cDN6bVpTTXowandpMml5ZUQwUldmbGxtYkN5N3BPUTNNamJuRGw5bHFTMEJy?=
 =?utf-8?B?bzBkRTl5eEdxdG9DM3JBMkZxQUdCTzQ5cUxYbVd3RnFBZXc5QitrdmVTcWt5?=
 =?utf-8?B?ZnBXZTM3eXI0Tk94U0xTa05QQkV4VWFKWURweVdiN3hLQ0ZPdzRtbmhtNWdQ?=
 =?utf-8?B?VEFSS2xTY05xVko3QzlwUmRGZVN4Zjg1NEhTUGZUN3ovYlJsTlZLamhjUnlD?=
 =?utf-8?B?bDJUS1hOL0JoR3BRcHUrNE9FK0EvbUdWdU4vWEg3UU5ubUVlMm54NWpIczBP?=
 =?utf-8?B?T3J6Z1R4UHQxSTFvQVhvM1NFeit6ZmxOOFFhR2hwWFJTMVd4b0M3Qlh1bXpG?=
 =?utf-8?B?R3dXV3htMytiWTN0VTNzZHpJeG52cFlHWWVWQkR0VjBqcDN5VUtLSVJzTlZF?=
 =?utf-8?B?SGdUMnBrNFlUNXVUbXU1U2VGZ29TaEF5Nm5zSlFsb1FkcHBHRUFtMi9oa2xK?=
 =?utf-8?B?MDk3TFkxRmR2RkJtRnQvWEk5eG5GSklwWFhJNzJuWDlKK1lPZ2tJOERYcFNw?=
 =?utf-8?B?VzVxd2R3dHF1L0F3eWxEV2I3ZlhQWVlDbzVHZG91ZjhuZXlxcXZueElTOVpN?=
 =?utf-8?B?VUVwRk9pbXJreCtsWllsR0U3L2M4QUIxVHFyTC9sbW90a1hDZ2l6YlF4OUxx?=
 =?utf-8?B?eHo5dHN0Vjl1eFZYK2UveXpVL2JnU1hINS96bzI4Z3pKb1pPcU5jSTBjOWt2?=
 =?utf-8?B?TlI3SFBvRUxNdStwS2hOTXJUSFFrRWxldVY0S1FXd3FYSHVJWFI1VmQrN3Fh?=
 =?utf-8?B?Vk54RGRmTDU0bHhjcG4xRUIxNHVJSFNzOFJ0TUkwNzg3TktSV3ByWFdQR2c3?=
 =?utf-8?B?N1kyZ2taand0Y2lEVVJxNFBhbFJkOW9OMnZwcHBaVWd4SjVVS1VvY0MxUC9P?=
 =?utf-8?B?Z25SV2pieHpWbk9QTlp4RVVlSGhFVnpJTjJ6TGpOY3phMnA3aGVEeGxvRFkz?=
 =?utf-8?B?YkZCTkEwdmtDb0E3c0hTbHdCd1NjUjlnd3BIbTVOcXJjbGJxSitObmFxWmla?=
 =?utf-8?B?aXRyZzhMb3MxUTdDaVFwRFFZczZwWk1UR3pDWkRtdXNJUllwSlJ6QUoxclho?=
 =?utf-8?B?RzFlV0NnMjZsS0xpa1lJMEg1R3c0QnczWEJRdHZzNW5IZGI0eEFRaUFIR1pD?=
 =?utf-8?B?ZjZCdllYOHNUd1JCWi9nbDcrTlNSQks0U21DUnZiSk5jSlRVSHVlMW9sTTNH?=
 =?utf-8?B?amUwQ2xvckQyVzlYRWpwMzdTTzNrYjd5R3IwL3Q0SVV0dWM1dzA4eUZVaE5W?=
 =?utf-8?B?Sjl0RkFUayt0M2hXdzlZNWZ5SmIyMWNZOUpETWtqeEEzRytnL3YyRTFWN2Jn?=
 =?utf-8?B?VW5BMUFDQmE4em9ISS91RVZGSDAwRmFQLzNCZW1zMDRHQTVkYTdxMlRlMVUr?=
 =?utf-8?B?SDJ3bnRJZlZLTXRYRURJU3NnVnFlVXhaZEc4OW5tQnJlcmRteXRSVXN2WXVP?=
 =?utf-8?B?QXB6RVNPNlkxT09tbDc3dlpTM2gvWkdXMDN4cHNDUk90WURjRHZQZTV2VXpi?=
 =?utf-8?B?d1Nud1MvdVdRT2plMmlvekQzb2drVDhmcThMWWhYREY0UXByYjVqam1jVXBz?=
 =?utf-8?B?TGMwekZUZWdJQ1VPdU9RZW9yYUJDdkg0aC9FM2srTmZIV3FvVTFTU2N5VmlZ?=
 =?utf-8?B?WHFGYm9OUmFVVWU2SDViSU5UOXJ2MVhQTFRNNElkZm1TVUpWMFovV1lkdEFF?=
 =?utf-8?Q?guilVG+ld/94fV/6c19sX5LQa?=
Content-Type: multipart/alternative;
	boundary="_000_4c3976aadad4270728529b26593692d0citrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ca9dc5-b183-4d0e-2e65-08da6969e32f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 09:34:33.0036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+BQ+5b6JP/i4DQJ/iIp84KGyZegiWuenNQuvnBFLyCWkpW5EmF8M3z7qBLB4xBIGQa17Uy/1mM3aS9YP10+zeahi/AomfXLIxSpd/FL6DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6166

--_000_4c3976aadad4270728529b26593692d0citrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMTkvMDcvMjAyMiAwMDowNCwgRHlsYW5nZXIgRGFseSB3cm90ZToNCkhpIEFsbCwNCg0KSSdt
IGhhdmluZyBpc3N1ZXMgZ2V0dGluZyBRdWJlc09TIHJ1bm5pbmcgb24gbXkgTGVub3ZvIFlvZ2Eg
U2xpbSA3IFByb1ggKEFNRCBSeXplbiA2ODAwSFMpDQoNCkZpcnN0bHkgaW4gb3JkZXIgdG8gYm9v
dCB0aGUgZGV2aWNlIGF0IGFsbCwgSSdtIHJlcXVpcmVkIHRvIGFkZCBgZG9tMF9tYXhfdmNwdXM9
MSBkb20wX3ZjcHVzX3BpbmAgdG8gZG9tMCdzIENNRExJTkUsIHRoaXMgaXMgc2ltaWxhciB0byB3
aGF0IEkgaGFkIHRvIGRvIHByZXZpb3VzbHkgLSBodHRwczovL3hlbi5tYXJrbWFpbC5vcmcvc2Vh
cmNoLz9xPVJ5emVuI3F1ZXJ5OlJ5emVuK3BhZ2U6MSttaWQ6ZjNoZWw0eWoyNXFpbGFiditzdGF0
ZTpyZXN1bHRzIHdpdGggdGhlIFJ5emVuIDQwMDAgc2VyaWVzLCBob3dldmVyIHdpdGhvdXQgdGhl
c2Ugb3B0aW9ucyBhZGRlZCBkb20wIG5ldmVyIGZ1bGx5IGJvb3RzIGludG8gRmVkb3JhLg0KDQpU
aGUgb3RoZXIgaW50ZXJlc3RpbmcgaXNzdWUgSSdtIGhhdmluZyBpcyB1cG9uIGJvb3RpbmcgYW55
IFZNLCBqdXN0IGEgbm9ybWFsIHNpbXBsZSBWTSB3aXRob3V0IGFueSBQQ0kgZGV2aWNlcyBhdHRh
Y2hlZCwgaXQnbGwgc3VjY2Vzc2Z1bGx5IHN0YXJ0LCBhYm91dCAxIHNlY29uZCB3aWxsIHBhc3Mg
dGhlbiB0aGUgZW50aXJlIGRldmljZSB3aWxsIGhhbmcgYW5kIHJlc2V0LCBpdCdzIHZpcnR1YWxs
eSBpbXBvc3NpYmxlIHRvIGdldCBhbnkgbG9ncyBhdCBhbGwgb3V0IG9mIHRoZSBkZXZpY2Ugd2hl
biBpdCdzIGluIHRoaXMgc3RhdGUuDQoNCkZZSTogUXViZXNPUyB1c2VzIFhlbiA0LjE0DQoNCk9r
LCB0aGVzZSBzb3VuZCBsaWtlIHR3byBkaWZmZXJlbnQgdGhpbmdzLiAgT25lIGlzIGRvbTAgZmFp
bGluZyB0byBib290LCBhbmQgb25lIGlzIHRoZSBoYW5nL3Jlc2V0IHdoZW4gc3RhcnRpbmcgdGhl
IFZNcy4NCg0KTGV0cyBzdGFydCB3aXRoIHRoZSBkb20wIHByb2JsZW0gZmlyc3QuICBUaGUgbGlu
ayB5b3UgcHJvdmlkZSBzdWdnZXN0cyBhIGNyZWRpdDIgYnVnLiAgRG9lcyBkb20wIGJvb3QgaWYg
eW91IHBhc3MgYHNjaGVkPWNyZWRpdGAgb24gdGhlIGNvbW1hbmQgbGluZSwgaW4gcGxhY2Ugb2Yg
YGRvbTBfbWF4X3ZjcHVzPTEgZG9tMF92Y3B1c19waW5gID8NCg0KfkFuZHJldw0K

--_000_4c3976aadad4270728529b26593692d0citrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <9064591F4A3019449D7908F9F2AF507B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBjbGFzcz0i
bW96LWNpdGUtcHJlZml4Ij5PbiAxOS8wNy8yMDIyIDAwOjA0LCBEeWxhbmdlciBEYWx5IHdyb3Rl
Ojxicj4NCjwvZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOndNVjRva29J
bld4VHFBYUg2c3hVdWc2bXk5Qk9sa3VyT1d1Q1VJTEdGeG9ZZTk2VV8tWi1LUGpEZGFjUm11SWtz
T01YLWNoYUFOMGxuR2o1WGV2Zk5KS3c2ZklWaHNTSXFCQ3hHSHdlSy1RPUBwcm90b25tYWlsLmNv
bSI+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogaGVsdmV0aWNhOyBmb250LXNpemU6IDE0cHg7
Ij5IaSBBbGwsPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogaGVsdmV0aWNhOyBmb250
LXNpemU6IDE0cHg7Ij48YnI+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBoZWx2
ZXRpY2E7IGZvbnQtc2l6ZTogMTRweDsiPkknbSBoYXZpbmcgaXNzdWVzIGdldHRpbmcgUXViZXNP
UyBydW5uaW5nIG9uIG15IExlbm92byBZb2dhIFNsaW0gNyBQcm9YIChBTUQgUnl6ZW4gNjgwMEhT
KTwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IGhlbHZldGljYTsgZm9udC1zaXplOiAx
NHB4OyI+PGJyPg0KPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogaGVsdmV0aWNhOyBm
b250LXNpemU6IDE0cHg7Ij5GaXJzdGx5IGluIG9yZGVyIHRvIGJvb3QgdGhlIGRldmljZSBhdCBh
bGwsIEknbSByZXF1aXJlZCB0byBhZGQgYDxzcGFuPmRvbTBfbWF4X3ZjcHVzPTEgZG9tMF92Y3B1
c19waW48L3NwYW4+YCB0byBkb20wJ3MgQ01ETElORSwgdGhpcyBpcyBzaW1pbGFyIHRvIHdoYXQg
SSBoYWQgdG8gZG8gcHJldmlvdXNseSAtJm5ic3A7PHNwYW4+PGEgdGFyZ2V0PSJfYmxhbmsiIHJl
bD0ibm9yZWZlcnJlciBub2ZvbGxvdyBub29wZW5lciIgaHJlZj0iaHR0cHM6Ly94ZW4ubWFya21h
aWwub3JnL3NlYXJjaC8/cT1SeXplbiNxdWVyeTpSeXplbitwYWdlOjErbWlkOmYzaGVsNHlqMjVx
aWxhYnYrc3RhdGU6cmVzdWx0cyIgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIiBjbGFzcz0ibW96LXR4
dC1saW5rLWZyZWV0ZXh0Ij5odHRwczovL3hlbi5tYXJrbWFpbC5vcmcvc2VhcmNoLz9xPVJ5emVu
I3F1ZXJ5OlJ5emVuK3BhZ2U6MSttaWQ6ZjNoZWw0eWoyNXFpbGFiditzdGF0ZTpyZXN1bHRzPC9h
PiZuYnNwO3dpdGgNCiB0aGUgUnl6ZW4gNDAwMCBzZXJpZXMsIGhvd2V2ZXIgd2l0aG91dCB0aGVz
ZSBvcHRpb25zIGFkZGVkIGRvbTAgbmV2ZXIgZnVsbHkgYm9vdHMgaW50byBGZWRvcmEuPC9zcGFu
PjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IGhlbHZldGljYTsgZm9udC1zaXplOiAx
NHB4OyI+PHNwYW4+PGJyPg0KPC9zcGFuPjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
IGhlbHZldGljYTsgZm9udC1zaXplOiAxNHB4OyI+PHNwYW4+VGhlIG90aGVyIGludGVyZXN0aW5n
IGlzc3VlIEknbSBoYXZpbmcgaXMgdXBvbiBib290aW5nIGFueSBWTSwganVzdCBhIG5vcm1hbCBz
aW1wbGUgVk0gd2l0aG91dCBhbnkgUENJIGRldmljZXMgYXR0YWNoZWQsIGl0J2xsIHN1Y2Nlc3Nm
dWxseSBzdGFydCwgYWJvdXQgMSBzZWNvbmQgd2lsbCBwYXNzIHRoZW4gdGhlIGVudGlyZSBkZXZp
Y2Ugd2lsbA0KIGhhbmcgYW5kIHJlc2V0LCBpdCdzIHZpcnR1YWxseSBpbXBvc3NpYmxlIHRvIGdl
dCBhbnkgbG9ncyBhdCBhbGwgb3V0IG9mIHRoZSBkZXZpY2Ugd2hlbiBpdCdzIGluIHRoaXMgc3Rh
dGUuPC9zcGFuPjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IGhlbHZldGljYTsgZm9u
dC1zaXplOiAxNHB4OyI+PHNwYW4+PGJyPg0KPC9zcGFuPjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9u
dC1mYW1pbHk6IGhlbHZldGljYTsgZm9udC1zaXplOiAxNHB4OyI+RllJOiBRdWJlc09TIHVzZXMg
WGVuIDQuMTQ8L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjxicj4NCk9rLCB0aGVzZSBzb3VuZCBsaWtl
IHR3byBkaWZmZXJlbnQgdGhpbmdzLiZuYnNwOyBPbmUgaXMgZG9tMCBmYWlsaW5nIHRvIGJvb3Qs
IGFuZCBvbmUgaXMgdGhlIGhhbmcvcmVzZXQgd2hlbiBzdGFydGluZyB0aGUgVk1zLjxicj4NCjxi
cj4NCkxldHMgc3RhcnQgd2l0aCB0aGUgZG9tMCBwcm9ibGVtIGZpcnN0LiZuYnNwOyBUaGUgbGlu
ayB5b3UgcHJvdmlkZSBzdWdnZXN0cyBhIGNyZWRpdDIgYnVnLiZuYnNwOyBEb2VzIGRvbTAgYm9v
dCBpZiB5b3UgcGFzcyBgc2NoZWQ9Y3JlZGl0YCBvbiB0aGUgY29tbWFuZCBsaW5lLCBpbiBwbGFj
ZSBvZiBgPHNwYW4+ZG9tMF9tYXhfdmNwdXM9MSBkb20wX3ZjcHVzX3BpbmAgPzxicj4NCjxicj4N
Cn5BbmRyZXc8YnI+DQo8L3NwYW4+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_4c3976aadad4270728529b26593692d0citrixcom_--

