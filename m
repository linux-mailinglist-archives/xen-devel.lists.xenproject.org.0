Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAC24C6BDE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 13:10:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280475.478416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOeqq-0001ZB-EX; Mon, 28 Feb 2022 12:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280475.478416; Mon, 28 Feb 2022 12:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOeqq-0001VS-BN; Mon, 28 Feb 2022 12:10:04 +0000
Received: by outflank-mailman (input) for mailman id 280475;
 Mon, 28 Feb 2022 12:10:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMlY=TL=citrix.com=prvs=051191599=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nOeqo-0001Ch-Md
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 12:10:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59739118-988f-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 13:10:00 +0100 (CET)
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
X-Inumbo-ID: 59739118-988f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646050200;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BoN8B1+cDkPXX9B0BoNFj3nAifW7TvSeiefJpZxzqc8=;
  b=a4tXeBDkoAwZ0K2UHAopTB+vFsjUTNm1fK+pMjK1kkJziKQzVpLO2p9X
   FacPEV1x+7h0jaa+5K8WAp1njjBw6PPLTd6mWqusr/N43F+Xm/98lelYZ
   WSDu7EidEg13x33VfL6Y4gZV94VG5n6SYbm3TmIU5RyCnlMyb1bToJjq+
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65015440
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XLo0NKrwzOiuEL/FPBWTdZbNpydeBmKpZRIvgKrLsJaIsI4StFCzt
 garIBnTO/3bM2X8KdkkYIi390sHupPRyYNrHgM//y00Qn9Dp5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvX4
 4yq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBPKzHsrw6dBNkSAJ7PfV03JXXEVGumJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI7zjfALADSJTKR6zM6PdT3Ssqh9AIFvHbD
 yYcQWQyNE2dP0EXUrsRIK09uPiU21PBSTEClXfI/IQU7W7R9BMkhdABN/KKI4fXFK25hH2wr
 G/c437wBB1cMdWF0CeE6VqlnOqJliT+MKosE7m/+u9vkUek7GUZAx0LVnO2ufC8zEW5Xrp3K
 VESvCwnrqEw9UmiZtj7QxC85nWDu3Y0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neKks3oA3pzsbSTYXOb6rqQ6zi1PEA9MmsqdSICCwwf7LHLoos+kxbORdZLC7Oug5v+HjSY6
 zKFti8lnJ0IkNUGka68+DjvmCmwr5LESgo04AT/XW+/6A59Iom/aOSA60Xf7PtGBJaUSB+Gp
 ndspiSFxLlQV9fXznXLGbhTWuHyjxqYDNHCqVxuFLN50BOnxyWAeIAI0hVUNHdAI+9RLFcFf
 3TvkQ9W4ZZSOl6jYql2f5+9BqwW8ETwKTj2fquKN4QTO/CdYCfCpXgzPhDIgwgBhWBxyflXB
 HuNTSq74Z/244xDxSH+eeoS2KRDKssWlTKKHsCTI/hKPNOjiJ+ppVUtbQHmggMRtvrsTODpH
 zB3bZbiJ/J3CrCWX8Uv2dRPRW3m1FBibXwMl+RZd/SYPi1tE3w7BvnazNsJItI5wvUFyb6Ro
 i/lCie0LWYTY1WddG1mjVg5NdvSsWtX9ypnbUTAw37ys5TcXWpfxPhGLMZmFVXW3Odi0eR1X
 5E4lzaoWZxypsD8021FN/HV9dU6HDzy3F7mF3f1MVAXIs87LySUq4CMQ+ca3HRXZsZBnZBl+
 OPIO8KyacdrejmO++6NMKP/lw7q5CNF8A+wNmORSuRulIzX2NECAwT6j+MtItFKLhPGxzCA0
 B2RDwteru7Iy7LZOvGQ7UxYh+9Fy9dDI3c=
IronPort-HdrOrdr: A9a23:DBucRK6FepY72BpIUgPXwWWBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhJU3Jmbi7Scy9qeu1z+873WBjB8bfYOCAghrnEGgC1/qv/9SEIUPDH4FmpN
 5dmsRFeb7N5B1B/LzHCWqDYpcdKbu8gdiVbI7lph8HJ2ALV0gj1XYDNu/yKDwseOAsP+tcKH
 Po3Lsgm9PWQwVxUi3UPAhmY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 j4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv6/VXEO0aOSAWQR4Z
 3xSiQbToNOArTqDyeISC7WqkzdOfAVmibfIBGj8CPeSIfCNU0H4oJ69Pxkm13imhAdVZhHod
 N29nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMAjgRBq3PkiFW5uYd499RjBmcga+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zo93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkf8IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehTKYd0s8LAo23FUgMyOeFOwC1zydLkHqbrTn8ki
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="65015440"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnIHTwM0iA0HvlJHXxNS9uWCzEVjVERBgVTwkC1U8srKWkMb96BQ/qQRrTQa3lSAWb5VfrYBNeQLd3/uvLKuKye8wtYGvzi8xDvaigP9xGw5eQqua1jprgx+IN6Az1e6ZLhSqRNLRr712LCyQpraCWw9ZDsIteDxxxiCcXHGkDPqhCwy0CaM9jmPvd3+dOqyq/q4UteKaCqDnhJYLrTl/y2m3/uRtucBVc5bmy1u23cqTSRMF9AYY58MWQcV2vLlBb4BVKUNx7r/X3OqzrJe4R+TLVyiH55N4YapJpSetJANSsOIhZVs3hVc76lQPPkodC+4nGbZGRcHyfqctX1Kcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoN8B1+cDkPXX9B0BoNFj3nAifW7TvSeiefJpZxzqc8=;
 b=QZMpHv2b5hkHfazuedXE7SW0AD9FIGA4uWNioNg0B29ozKYF0IUOKazT5kBmOH5AkBrgBvExHRiPkmd8v1TwSqDu0MyWvR/goYrVum7VQhqpf6x6tOt/uFoO2fKG7GpDlxXizY0GczYMERZvVhTCK930+oN0ZphfOi5JB0t+LJj8WwrKE42MjIzEufmNVFwnpjRppmgkijJGJGrw8v8XAcFD4gpCu06wnPcI+zVSafywq8BWQA/CX09J9jjN5nm25ONtu/QqL7EcLEOmV+SuvOzv7g9ISh6n8UBE+UIuOE5GwR3A+wO/P9fCzB3xreAzHThKQsutps9/RFvtC1aTCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoN8B1+cDkPXX9B0BoNFj3nAifW7TvSeiefJpZxzqc8=;
 b=Rsfl9m9D8+P7P0VmgYB20DT3mBQKy1LgC31omIsi1DE23A/YRqbJ0xtsb9h6bnFGTfRGwQJKrFOeP6ztvzLJvmxv9DWWV3Y3IFedWewcASz8kjdoElhG+MSFbWROxBIiOi1+wbIfZoYZyIjDRjC/cyxkeOmjWFZR4r4L654ABJI=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYJO06JWynylsFtkyl8WR8WaDosKyixjKAgAGyPACABChhAIAATYQA
Date: Mon, 28 Feb 2022 12:09:55 +0000
Message-ID: <b594fe28-6b47-d697-a038-b1a9ee903288@citrix.com>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-2-jane.malalane@citrix.com>
 <0a31970c-c0f8-c995-ce04-67523a4a830a@suse.com>
 <22ae35a0-9df8-9357-4b44-2f00586144fc@citrix.com>
 <de431523-ad71-1cb6-a28d-07418886ee23@suse.com>
In-Reply-To: <de431523-ad71-1cb6-a28d-07418886ee23@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac19d435-d6bd-4aef-7969-08d9fab33b9e
x-ms-traffictypediagnostic: BN6PR03MB3105:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <BN6PR03MB3105AB5E8FC5E11A26DE316B81019@BN6PR03MB3105.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L49invFVqbhuJ1oj9ELhvL8mS8VxJI9qMaTnQwUiWVCPnpUNo8bVe5MVvmXCVXvQjqUB9BLsni7salX2mO+/g6foWHv1JgMxMnqmF3KiaDGEOIGYgcIQusGaqsZRcRx32YEF4o0ocxKc0bi10BCOh7goc17GTHgBIA40TfWL/b39/w3E/Hws5u51SeBMm50QHM2wjEoY0kuDClTb56SjcQdcNAMHWNLypJkEG2MVSG4Zhp2jJ6xmjBNXC0QqU69lxvp19nR6qAc6z0XaWBa5RbA17ZboAeoJeE/Cm3JHwT+/MK63UnUP5k0tEq0mQIc+cyBp9BQV2Aw2/YtY+yum5UebbLrMxnDlMgEpWGrzoXtyvmJprtj8auiNQnrZFNN+xd4mp6olLs7C/n8L8afr9cDT/nFQt7cDo7E0ch/TzGT4aYTbHg+K7kyAlD2cFSrC9ym1wcCGnZ1m9rtLP5zIkKx2yygffZU2I2dGStM/R/ldUW+8OtdaAf2sMCneCxrhdt/NTLlnJlm/MBIEVk2ekjNW2vmV58RmHAU3urgLCqv+24EyvEi6+VElfHi3/7B534RWewq+nk9v4xJ0YiYaX+nTJTVbRGDRGpGMBVOSS1f8yuhMJJFUAChZhe9aSABP/zHzSr+Jtuhxe/lCpwdtUIzRFEMUYRzYBOFtRYEbGiWoWWerpQFmQG+NBoChpdru/gofGCticD6e+2eixMQJxW6eMlAciMFNVb5FaKk8VOtok0wZa9mEXbqkhm0J38IQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(82960400001)(38100700002)(55236004)(53546011)(38070700005)(2616005)(6486002)(31696002)(86362001)(26005)(122000001)(186003)(54906003)(83380400001)(508600001)(6916009)(66946007)(76116006)(5660300002)(66476007)(66446008)(64756008)(36756003)(66556008)(4326008)(2906002)(71200400001)(8676002)(7416002)(31686004)(316002)(6506007)(6512007)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qk5aSDdPTmtRTG9XNzR0b0krcGxGY09Wc1dvUDgvT3A3VHZlYmdSNm9Ibmx3?=
 =?utf-8?B?TjdpeVVOS0ZGaFNuL1p4VzlHYWVqengvL2JoNUVrTjcyM2NQcDBFZ1lNMStx?=
 =?utf-8?B?VWRsc0xwb3U4YVZPWGludVY5MXBHbE9RazhUMzM3Tm1Rc0NQT3dxaXBneXJI?=
 =?utf-8?B?YlFWcXpDSXRWVUJEL08zUVY5TWU0Mnl2cEY2WE13aFpNT1BjYXMvM2h1MzRj?=
 =?utf-8?B?TTFRb2lKeCtBM1UvU0hINmx2VGxVUUlpMXl1emJIZGFydXpkbWpScmlhZ1Nx?=
 =?utf-8?B?OE9Wc0sxa2RqQ1ViU3Vjb2puWFlwN1M3cWNWZFNmRlY4a0NlZlNsZzFpdk5s?=
 =?utf-8?B?b2xhbms1M3VqM3NkakJxdFR1cnkvdzVHTGwxY1BFR1hPaWtWZDM4cmVCM2Zv?=
 =?utf-8?B?MUlSTytta09SeHdEZHViNEtmK1ZKSFVPSm56VlhrS2RSMThRL0hHVTh2eWZj?=
 =?utf-8?B?bHZnZGY5M2VzdFRXVVVpZVFrVXBJaVZveFZIYVBzWFk1K1h2N3c1M05wMlVI?=
 =?utf-8?B?K2VmdVhhbllOTndaTGdVL0FvUURUWXAwQ3FFN2tuTWNaOEJINUpHbEFHMnM0?=
 =?utf-8?B?T1JWSktZOUwxcmQ5T2ZlMXQ5WEsrOUc3NVFnSWJ5cXJyY0JoRUdZNkhMcmRF?=
 =?utf-8?B?T0plRHQzamp1TnY2TU9PcVQrc0dQRUFJUXErUHF2OHlxUnpudE5vOFVDaitP?=
 =?utf-8?B?SWlsWDFabmowbEJNMEN5R0lwMHlzVEtDei9QS0ZCRlhqQm1PWC8wN0NmVzNU?=
 =?utf-8?B?MlRSTDh1NStxYy9PeG8zaGM5TVZ1bHYrVEdGS1RVNVE4L0g4TlhmaG45TzJI?=
 =?utf-8?B?bTgySTY5Q3NoR3IvVDdad1NzU2VVNjFlT0lsZTlzUHNFRTRidHhQZXNqdG1Q?=
 =?utf-8?B?aGRCSmtla2hxUm5sbnYyeGVNQkRnTUVFRXhqZldleWFmbDhPM3FvZmZXWXBZ?=
 =?utf-8?B?amsvWFR6NGpTdEVvU1JMTkJUcVJ6SUp3SFc1Ykp4N0x2WjhLcnU3TmJvL09V?=
 =?utf-8?B?YjdTcG9FL0dkU1BTWlBFVDQrNzVwVHZjY3F3aU54UGo0bkx6eVR6blQ3S2wx?=
 =?utf-8?B?aS9GaW4xT01VRVI1Vmk5RVB3N2UrV0pibW13QlVjaVJLbTNhUWJ1T2Z2V29H?=
 =?utf-8?B?NnpsTjE1NmxaYmdTSzMyRHZEVEh5MVVGNkcwbGtxVVNGbzB5Nk9FL3crdXQ1?=
 =?utf-8?B?YVFQNU1LTURzSmpFanpEVFdScnBrTi9FNUgweVdBNENMWjhmUlRObTZCYy9L?=
 =?utf-8?B?RmFUU2tyNjhHNWhUYWFZeGFIbmQzdUJrS2lRVmUvaFBVRFh4Mi9mV2FkWlVH?=
 =?utf-8?B?TGtVWjJVN2lzOEI0cWtlUHlRREdteWplbDVVd2p1QWhKN1NDZFB0QmNGcC9L?=
 =?utf-8?B?RWg5Q3AzTmlIajBqbW9aTUQyeVFtbUZyMC8xYnJoV3BmdkdxSjRaWmt1UDhT?=
 =?utf-8?B?RVVJTUFXMTkxaUJzTktIWC9CdmxhZjQ3MHhyMmpmaFRsRFJCMWxhTUl1eTVj?=
 =?utf-8?B?VklYSXNjNVlMN1VmTDNXdTN2eUo0cUFWaVB0bzlITFlFdmNMVlFMNEtjU0xG?=
 =?utf-8?B?ZTRJN25za3RzeFhLbVA5QzF0Nk5OR3A3cnlMR0VNanczS2pJUE9uUU4yQ1dn?=
 =?utf-8?B?RElvUjMzenUwWkMvblUwaXZiQmp2T0w0NTRWeFNsYlIxT2JDVTl2c1Y3U2lF?=
 =?utf-8?B?QVBaZTNPU1JUU0M5ams5cnFjRlZmUDcwWS9KVWVPeU5Hdzd3QzcvRWs4UWJQ?=
 =?utf-8?B?ak96SzBoekliNWo1T0NLeXk5Ymlpc2ZWL0JGa3c2TEgzRVRjV3RKdGtMODFK?=
 =?utf-8?B?VHc0emljQ2E2NFlwaVJKZ0RRUkRLcEJXVzl4blE2MG5ON0R4elR6cTJoYk4w?=
 =?utf-8?B?NXRnbS9pY2p5d0JIRDhjYkljSk1INHcrMzZkRXY5RTZxSVpTbHZpandxK05n?=
 =?utf-8?B?cTByWkpYb2hmSVVmeEs0N2MzdEYzSFVlNGJLeUpjZkFURUltZkhuQWlRWkVm?=
 =?utf-8?B?cXFteHhSenhYWHJzUy9tVy9EMHBFbGgxMmpXMUpOV3JxajhENWZHWjQzM0pF?=
 =?utf-8?B?Z29sTExXcDBsMVN2Tmp5L3dXQWkxbk8xbHJaTFZaU09aRm8wb2lUdW8waDAy?=
 =?utf-8?B?Y0lHalJHQ3dDNGorZERTemNhUmQ4ZEFzaGFJSzF1RkZzb0ZRNXh2MnFGS0hW?=
 =?utf-8?B?ZDV3QUVjVnBuQldGQ2c0Qjk3Zmx6UlR5WklLeTRhRTFsV296Sm5tV2ZoM2dh?=
 =?utf-8?Q?npGSucDbeLVdSsEDh8eBZnFnGP8z/sOAITV5BY0VUI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <845152238ACFF945B8B65B6796453EBF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac19d435-d6bd-4aef-7969-08d9fab33b9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 12:09:55.4248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U15xt6h7t3PRQPqFqriWS+7cFCtW3JfGe3CUPaDTYqFhSmCV1xtbMNMNftT5fkT5NAemqMjrdj2FrGgPfZFjGphq35zLzpgjA9WowAps7VE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3105
X-OriginatorOrg: citrix.com

T24gMjgvMDIvMjAyMiAwNzozMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDI1LjAyLjIwMjIgMTc6MDIsIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiBPbiAyNC8wMi8yMDIyIDE0OjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAx
OC4wMi4yMDIyIDE4OjI5LCBKYW5lIE1hbGFsYW5lIHdyb3RlOg0KPj4+PiBBZGQgWEVOX1NZU0NU
TF9QSFlTQ0FQX0FSQ0hfQVNTSVNURURfeGFwaWMgYW5kDQo+Pj4+IFhFTl9TWVNDVExfUEhZU0NB
UF9BUkNIX0FTU0lTVEVEX3gyYXBpYyB0byByZXBvcnQgYWNjZWxlcmF0ZWQgeGFwaWMNCj4+Pj4g
YW5kIHgyYXBpYywgb24geDg2IGhhcmR3YXJlLg0KPj4+PiBObyBzdWNoIGZlYXR1cmVzIGFyZSBj
dXJyZW50bHkgaW1wbGVtZW50ZWQgb24gQU1EIGhhcmR3YXJlLg0KPj4+Pg0KPj4+PiBGb3IgdGhh
dCBwdXJwb3NlLCBhbHNvIGFkZCBhbiBhcmNoLXNwZWNpZmljICJjYXBhYmlsaXRpZXMiIHBhcmFt
ZXRlcg0KPj4+PiB0byBzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mby4NCj4+Pj4NCj4+Pj4gU3Vn
Z2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBKYW5lIE1hbGFsYW5lIDxqYW5lLm1hbGFsYW5lQGNpdHJpeC5jb20+
DQo+Pj4+IC0tLQ0KPj4+PiB2MzoNCj4+Pj4gICAgKiBEZWZpbmUgWEVOX1NZU0NUTF9QSFlTQ0FQ
X0FSQ0hfTUFYIGZvciBBQkkgY2hlY2tpbmcgYW5kIGFjdHVhbGx5DQo+Pj4+ICAgICAgc2V0IGFy
Y2hfY2FwYmlsaXRpZXMsIHZpYSBhIGNhbGwgdG8gY19iaXRtYXBfdG9fb2NhbWxfbGlzdCgpDQo+
Pj4+ICAgICogSGF2ZSBhc3Npc3RlZF94MmFwaWNfYXZhaWxhYmxlIG9ubHkgZGVwZW5kIG9uDQo+
Pj4+ICAgICAgY3B1X2hhc192bXhfdmlydHVhbGl6ZV94MmFwaWNfbW9kZQ0KPj4+DQo+Pj4gSSB1
bmRlcnN0YW5kIHRoaXMgd2FzIHRoZSByZXN1bHQgZnJvbSBwcmV2aW91cyBkaXNjdXNzaW9uLCBi
dXQgdGhpcw0KPj4+IG5lZWRzIGp1c3RpZnlpbmcgaW4gdGhlIGRlc2NyaXB0aW9uLiBOb3QgdGhl
IGxlYXN0IGJlY2F1c2UgaXQgZGlmZmVycw0KPj4+IGZyb20gd2hlbiBYRU5fSFZNX0NQVUlEX1gy
QVBJQ19WSVJUIHdvdWxkIGJlIHNldCBhcyB3ZWxsIGFzIGZyb20gd2hhdA0KPj4+IHZteF92bGFw
aWNfbXNyX2NoYW5nZWQoKSBkb2VzLiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRob3NlIHR3byBp
cw0KPj4+IHByb2JhYmx5IGludGVuZGVkIChqdWRnaW5nIGZyb20gYSBjb21tZW50IHRoZXJlKSwg
YnV0IHRoZSBmdXJ0aGVyDQo+Pj4gZGlmZmVyZW5jZSB0byB3aGF0IHlvdSBhZGQgaXNuJ3Qgb2J2
aW91cy4NCj4+DQo+PiBPa2F5LCBJIHdpbGwgbWFrZSB0aGF0IGV4cGxpY2l0Lg0KPj4NCj4+PiBX
aGljaCByYWlzZXMgYW5vdGhlciB0aG91Z2h0OiBJZiB0aGF0IGh5cGVydmlzb3IgbGVhZiB3YXMg
cGFydCBvZiB0aGUNCj4+PiBIVk0gZmVhdHVyZSBzZXQsIHRoZSB0b29sIHN0YWNrIGNvdWxkIGJl
IGFibGUgdG8gb2J0YWluIHRoZSB3YW50ZWQNCj4+PiBpbmZvcm1hdGlvbiB3aXRob3V0IGFsdGVy
aW5nIHN5c2N0bCAoYXNzdW1pbmcgdGhlIGNvbmRpdGlvbnMgdG8gc2V0DQo+Pj4gdGhlIHJlc3Bl
Y3RpdmUgYml0cyB3ZXJlIHRoZSBzYW1lKS4gQW5kIEkgd291bGQgdmlldyBpdCBhcyBnZW5lcmFs
bHkNCj4+PiByZWFzb25hYmxlIGZvciB0aGVyZSB0byBiZSBhIHdheSBmb3IgdG9vbCBzdGFja3Mg
dG8ga25vdyB3aGF0DQo+Pj4gaHlwZXJ2aXNvciBsZWF2ZXMgZ3Vlc3RzIGFyZSBnb2luZyB0byBn
ZXQgdG8gc2VlIChhdCB0aGUgbWF4aW11bSBhbmQNCj4+PiBieSBkZWZhdWx0KS4NCj4+DQo+PiBM
aWtlIHRoZSAiY3B1aWQiIHh0ZiB0ZXN0IGFsbG93cyB1cyB0bz8NCj4gDQo+IEkgZG9uJ3QgdGhp
bmsgSSB1bmRlcnN0YW5kIHRoZSBxdWVzdGlvbi4gVGhhdCB4dGYgdGVzdCBpcyBjb25jZXJuZWQN
Cj4gYWJvdXQgY2hlY2tpbmcgdGhlIENQVUlEIG91dHB1dCBpdCBnZXRzIHRvIHNlZSBpdHNlbGYu
IEl0IGRvZXNuJ3QgY2FyZQ0KPiBhYm91dCB3aGF0IG90aGVyIGd1ZXN0cyBtaWdodCBnZXQgdG8g
c2VlLCBub3IgdGhlIG1heGltdW0gYW5kIGRlZmF1bHQuDQo+IA0KPj4gTWFrZXMgc2Vuc2UgdG8g
bWUuIEknbSBoYXBweSB0byB0YWtlIHRoYXQgdXAgYWZ0ZXIuDQo+IA0KPiAiQWZ0ZXIiIHdoYXQ/
DQpTbyBJIG1lYW50IHRvIHNheSB0aGF0IEkgY291bGQgYWRkIHRoZSBYZW4gQ1BVSUQgbGVhdmVz
ICg0MDAwMHguLi4pIHRvIA0KdGhlIHBvbGljeSBzbyB0aGF0IHRvb2xzdGFja3MgY291bGQga25v
dyB3aGF0IGh5cGVydmlzb3IgbGVhdmVzIGd1ZXN0cyANCmFyZSBnb2luZyB0byBzZWUgLSBpbiBh
IGZ1dHVyZSBwYXRjaCwgYXMgdGhpcyB3b3VsZG4ndCBqdXN0IGV4cG9zZSANClhFTl9IVk1fQ1BV
SURfQVBJQ19BQ0NFU1NfVklSVCBhbmQgWEVOX0hWTV9DUFVJRF9YMkFQSUNfVklSVCANCigweDQw
MDAweDA0KSBidXQgb3RoZXIgZmVhdHVyZXMgdG9vLg0KDQpCdXQsIGF0IHRoZSBzYW1lIHRpbWUs
IHcuci50LiB0aGlzIHBhdGNoIGluIHBhcnRpY3VsYXIsIHVzaW5nIA0KWEVOX0hWTV9DUFVJRF9B
UElDX0FDQ0VTU19WSVJUIGFuZCBYRU5fSFZNX0NQVUlEX1gyQVBJQ19WSVJUIHRvIGRldGVjdCAN
CmFzc2lzdGVkIEFQSUMgZ2l2ZXMgdXMgbGVzcyBmbGV4aWJpbGl0eSB0byBhZGQgbW9yZSBmaW5l
IGdyYWluZWQgDQpjb250cm9scyBpbiB0aGUgZnV0dXJlLg0KDQpUaGFua3MsDQoNCkphbmUu

