Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B274AC6BD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 18:07:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267288.461027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH7TW-00015x-HO; Mon, 07 Feb 2022 17:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267288.461027; Mon, 07 Feb 2022 17:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH7TW-00011i-Dz; Mon, 07 Feb 2022 17:06:50 +0000
Received: by outflank-mailman (input) for mailman id 267288;
 Mon, 07 Feb 2022 17:06:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kaUt=SW=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nH7TU-0000bz-CD
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 17:06:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 541cda71-8838-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 18:06:47 +0100 (CET)
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
X-Inumbo-ID: 541cda71-8838-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644253607;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uvVhDJQWqMKWPbwaT60cpH0Ssdw9h6aA84VtREa7C+o=;
  b=hqRgKltqNm//mmtHkuerSJwsaXso9LAd7R7ZwTnR5P10ndEAHco65a9R
   LdsgWNgUEZWOEwlSgDLxaD3nGqBO9NwFFMxWeC+5dx8uT8t60Ky2eIhs9
   HzOkYu2zRjt4Z8t0dh351bRl+V2UhrI0dMb+QNiDcDBVaZxQPLGeYYGVn
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FZYgv2BIVj0YSGpZ88KL4Jgc+PHDz7HrGESVVev2sq8orw9uI3TQgSFSa8bG0CVgqytTg+gCiM
 HMQsHZp/UQsOPM+PWGEcYaEfOmxOIiqhoADJMumsR8izaKlKsUetkkvOzUx6rPKwMSc0sNGnvR
 ShTorvbw4NP2rRZjVOkdLlaYR0ExK/c7xi/oJ991kFIOacGSHp1mV2MIyldvay4wzdOhppeMqB
 VPf7u8wu5uCXmJ2Vm/sg4kqR8P2/Ki9o7bov+59K4Bk+S0RZNjcVsrfFx5MK217ESLviPjekeH
 3GdFfY9SAXzXaMqRT15cZSMl
X-SBRS: 5.1
X-MesageID: 64069245
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:w5UhUqP5m7ZliTLvrR3rkcFynXyQoLVcMsEvi/4bfWQNrUoghGYPy
 mtKDGuBOqmCNGDxe4pxat7n8UoOsZaAx4Q2HQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500o8w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoziojtxel
 JYOjLabVSsHB63yx9otTyANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgmto2JEUQau2i
 8wxd2dqSCXRQyF2HmgYOLRnzOK1xVOkfGgNwL6SjfVuuDWCpOBr65DTN97Sds2PVN9itE+Sr
 WLb/Ez0GhgfcteYzFKt8G+oh+LJtTP2XsQVDrLQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa/kGxUsP0WRH+pXeepwMdQPJZCeh84waIooLL5y6JC25CSSROAPQkvsIrQT0h1
 neSgsjkQzdotdW9UmmB/72ZqTezPyk9LmIYYyIACwwf7LHLoo4piQnUZs1+C6PzhdrwcQwc2
 BjT8nJ43e9Ky5dWiePrpjgrng5AuLDEbx85yVmUHVuPxR9VSrelWdOW2UTiuKMowJmicnGNu
 30Nms675e8IDI2QmCHlfNjhDI1F9N7ebmSC3AcH840Jsm30piX9Jdw4DCRWeR8xWvvobwMFd
 6M6Vel5wJZIdEWnYqZsC25aI5R7lPOwfTgJux29UzavXnSTXFLdlM2NTRTJt4wIrKTLuftuU
 ap3ie72UR4n5V1PlVJavds1374x3TwZzmjOX539xBnP+ePAOCLMGO5cbgrUN7tRAEa4TOL9q
 Yc3Cid3408HDL2Wjtf/reb/0mzm3VBkXMur+qS7h8aIIxZ8GXFJNhMi6ehJRmCRpIwMzr2g1
 ijkAidwkQOj7VWaeVTiQi0yM9vHAMcgxVplZnZEFQjzhBAejXOHsf53m20fJuJ8qoSODJdcE
 pE4Ril3Kq4TE2ScpWVBMsWVQU4LXE3DuD9i9hGNOVAXV5VhWxbI6pnjeA7u/zMJFS25qY01p
 LjI6+8RacZrq91KAJmEZfSx4Um2uHRByut+U1GReotYeVn28ZgsICv016dlL8YJIBTF5z2by
 wfJXktI+biT+9c4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKxQ4Ys4d1H7tx47g54t/j++1Twgh+RS2ZZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQdIdgQ/b+mF2fUFoRXo7Kw4cBfg+St63LubSkEObROCvzNQceluO4Q/z
 OZ/5MNPs16jigAnO8qthzxP8zjeNWQJVqgqu81IAILvjQZ3mFhObYaFV33z6ZCLLd5NLlMrM
 nmfg6+b3+ZQwU/LcnwSE3nR3LUC2cRS6U4SlFJSdU6Untflh+Ms2EwD+Ds6eQ1Z0xFb3r8hI
 WNsLUB0ef2D8joAaBKvhIxw99Wt3CGkx3E=
IronPort-HdrOrdr: A9a23:mwhwX6tUUY71ffoZPXv9h6g67skC0oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKceeEqTPmftXrdyReVxeZZnMrfKlzbamLDH4tmu5
 uIHJIOceEYYWIK7voSpTPIaerIo+P3sJxA592ut0uFJDsCA8oLjmdE40SgYzZLrWF9dMAE/f
 Gnl656Tk+bCBIqh7OAdx44tob41r/2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJpZmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF4t1HqWxa1e
 UkkS1QePib2EmhOF1dZiGdgjUI5Qxer0MKD2Xo2UcL7/aJHw7SQPAx+r6xOiGplXbI+usMjZ
 6jlljpx6a+R3n77VXAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYd099Q/Bmcga+d
 NVfYrhDTdtACenRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtV5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdE15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAW23G4gMyLeFPGC1zwdLkeqbrWnxxEOLypZx
 +aAuMiP8Pe
X-IronPort-AV: E=Sophos;i="5.88,350,1635220800"; 
   d="scan'208";a="64069245"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atl5Os6GcVO+jz4RNiwKeClZmShtlNLzJyhV2npDcHfP8aoIeF0tQR2O0+2g5yCsM8tiVA0ou2d+9rynsWmIBGtjF0XgCb2ZN0UW9IrM5p/39PoQwZKEezqsosVg9QI6z25lJwERoLBibI3zV5t9smItTTGAG8ptLTYa0+3jCFQAMXCfoT1J5aSs/8SPppVztMHCMErZty/PemqA8OAWIyUDvq0X+xNJ9n7HPZs9T9KZaLXXtEZnQRu7QOE/aO9+FET+T4ht4Y+qeWDlLSj3brBOUT2ncWeJDNsOrnVRB4L+GstJkBi8Mh7Xaut5u4qkJSV9rJmMCeMyl1q58COdDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvVhDJQWqMKWPbwaT60cpH0Ssdw9h6aA84VtREa7C+o=;
 b=NVzjI5vev8wq1rJt7jZsnuaT7rK3sRXD24KlnZlI0bn/5FINj48D2+PNO1wG2BbIAgenfLzWmUoLwMG6gZYb7X4uSQkZDm+yNH3fEbHsRxaOd7j9v/tRH6lSENtNJemzPZHfAHivJa9xvTJWundkv43PVVb9j+8/QVsNLTNGc8F+PtUYZvBGCZIJbVmWZZdFgpGUB61VI5gsadEBpB56rAKoCRNKhShFd8+MEfP4gW2D/0wuQmIypkLggKXjRvptME3BGD31GKxqiinDJ/4w03Frro8fxsfoDOukp/0mYQm7WK7R8GtMOOFjI9rVwON6Bzk9nTT6a/7uy4+T2mi3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvVhDJQWqMKWPbwaT60cpH0Ssdw9h6aA84VtREa7C+o=;
 b=TcJzzFDIkgvMULhTBL0fEIRcqPScSrxLJl06xr0RpNHlpLiDLsEaiEvIh0Rhm4iXGFFAcalkP1FpdFzCqALSDywMmAM01l4qXZ8xT8EmLosTRRDQl3IZywEUzSzKMEessTQFKSgGAQOuK3UFJ+Lvj7jd50LatldoXVCSG+nTnjQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/smp: Speed up on_selected_cpus()
Thread-Topic: [PATCH] xen/smp: Speed up on_selected_cpus()
Thread-Index: AQHYGgY/F0hg0t0KmkKX/IIzwuTua6yHwIWAgACVkwA=
Date: Mon, 7 Feb 2022 17:06:41 +0000
Message-ID: <7805e1a3-e80b-91e9-afd3-aa3b1f93afef@citrix.com>
References: <20220204203115.13290-1-andrew.cooper3@citrix.com>
 <613d2033-47ba-1f67-9d90-322caeaef5dc@suse.com>
In-Reply-To: <613d2033-47ba-1f67-9d90-322caeaef5dc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1da02f79-673d-49eb-4471-08d9ea5c3602
x-ms-traffictypediagnostic: BN6PR03MB3236:EE_
x-microsoft-antispam-prvs: <BN6PR03MB32364DEFBE6B3FBBA5AD4EAEBA2C9@BN6PR03MB3236.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L1Ws6V+Wf8bTzfPz+P3nPegYWLBRqePHrJXFaErhXkTgMjNch8xBGhWGK/9KteANV4UWl2MYSXiOkhdJrRl/fH5HGeXZsDWqWoDK55Gp/EtIHUCGK1K5+o5TsOSreLjHJhPu55XH1e/yPTxym1ph8xt82NDG9QQHQZnQZZVWcMvMHXQ4tbRooqBOyAiO/6ujXNgdbtRChcKB8qU/9/gEku2GuKfX4uq1i0HA9Z8yOhdJdNZ1UDcxZF6GvQ6o6aXn/k18LJwo2dyf066DlowtguYogcYaTZnP+avCPV9FlIpF0NGg07jrNLcVsDVlZ3MUMOKYyYXU76SU4gFAdo5pdNwxxSerk0LDMYfyUfiLED7xprQV3DDWsrCZh65XBpWB/K+5fHq+eNDpq+06JioArC9rAG9CGgd2ithb47B0cvk5JSgIvxBTmGb/eLWunBWaG8DZ/FFNO0///Cb7cd6v4NYVbCoSB0rJgrlW3e4ILsPnk0vUi2QbgVyXKoyWSH2EkGu5gAASXcRX2mIVFAKPdhwY5WmLizatZEanALJPzkw7kELoCWUMgcqQhNOzMaJD4QfkM492qYkxMAIAfI0Sar9SnKe53ZM3yWv9K94xbKUa4ZA+f+L1HgfMvdtAWBtIsTwl1Xby+cTbKfiZYDOH4+9IY0JkWTeTEoyxfT1QBq+bppzK2FDbe7rg7MLzsP6MW7rTvhZt4ovTsOrwr2qhiUX50n2LOx4fMgDrpafVsXmZk9qw4CVMSKR1boIEoNfKCpiAV75AB36as0MyqCk+eQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(54906003)(508600001)(6916009)(36756003)(38100700002)(6486002)(82960400001)(2906002)(31696002)(66556008)(66476007)(26005)(31686004)(66946007)(83380400001)(38070700005)(5660300002)(91956017)(122000001)(66446008)(8936002)(4326008)(71200400001)(2616005)(8676002)(76116006)(53546011)(64756008)(86362001)(186003)(6506007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clZZQWErcjVPRVlEVWl6YURIYVloeEU3RGgzVmkwbWhjSU11aXpYcXF5a2lj?=
 =?utf-8?B?b2NNVUV6K0lwZGVkc2Vub1pDMHUwTmErU0h1UjJtWkl2YXpLcEpIVllDT0dZ?=
 =?utf-8?B?My9CNitlb3pEdlI1VHVUdkEyVlBkcWtqOUNuRjVPVXZjc2dSWWN0QWFQcGFD?=
 =?utf-8?B?cy9FVm90QkpqWmMwMFZhVTFpSEV2eStheWZWVCtiNEd6aE52SGVrRDZIaThD?=
 =?utf-8?B?Uy8xNVhDZ2ErYXFtVkpCdENaUnF6VXZBSkZMamVheTRRd1lZdlBqWXE1clM0?=
 =?utf-8?B?eUZSYWlRcEQ0WDcrQ29xM296V1ZiUEtwNWV5b1N4aUhOVW9tZ25EUFhGcFRC?=
 =?utf-8?B?NDM0N0V5clZhYXlqeXlJQ0l1eDhDRXlXL0l5S2VVQjlueDVlVE5EY0Mra0FE?=
 =?utf-8?B?ajlHL2pkTUxvdWlZOFRya2JGdVBJUWFBdzRhWE9STjkvWGttcm9QSjJlTU9M?=
 =?utf-8?B?ZlFuWjVTaCtVRm5rVTZaMnNSMkhmT2wwVE5YeHRlcGVuWU8va0NJRmptRHBr?=
 =?utf-8?B?RjBHaklaRHBmZE54eG9rNHdrVHk5d0NLZjdjWjhHTXkrWnV1YjA5d3o3MlZI?=
 =?utf-8?B?TlRCL09vb1FZNEllY3ZndVVkM2NiOXp2UndhRW1wMElwdlY5UUNCSTl4dXQ3?=
 =?utf-8?B?UERjNkpBUndiTllFeCtNcnNLTW1ocEZDSCtsNHdwTkt2S2p2MmMyY2h5VmRz?=
 =?utf-8?B?RnZVTEpESDQwNGdLNUNIazMrc25oK2xzeUJjckxsV1JDbHVyY2J1dGVxUXpH?=
 =?utf-8?B?UlJrMWlSbmVjTjc4MFpMZi9FS05kbUpiTjQxMVJNWklLNFR4ZWtPT2JPTDFa?=
 =?utf-8?B?UzV5TTRKOE9aYlN1OTlHVHFTYjJUMFVjeVhEb0JSS1ZPMDV0V3M4TjVUZEJZ?=
 =?utf-8?B?SkxnM0NJdkxEZHptZW0yV2Y0WU8yajZkeHp3Z2xxM0p1VXJKU1hKRDlhNTVj?=
 =?utf-8?B?TGFGTkg5N3FEazNPQUdoRXJpYk9CQVVQMzdUUTIxSjZWZG1Sb2N6T0Y3Vzdo?=
 =?utf-8?B?a0tQb1F2Zm9xY1JLdGdkcGNPOWh1VUx3dDljN3NxV1IwYnJTaXpvdEQrTGtk?=
 =?utf-8?B?Mk9ndHNnekI1WnlCMVBKdE9tM08ySHNMZzBJcVIvRThFVW1OcElwU0Q2VTR0?=
 =?utf-8?B?SE1JZmJVV0RPSnovNklDR0tFRFArM0MvMEhNRzM1am02Ly80OWpVdHY0MTNo?=
 =?utf-8?B?eUlua0srYUJudVhTc09NZkx6TjJhcXZXMCtTdktCNXhjR2xOM0grMUV3cGo5?=
 =?utf-8?B?dEwrK1FLMXR2cEtZeFJybTk3SENFT1VrSGdOYWhDYjlMc0ZsMGp0S2p6VGZU?=
 =?utf-8?B?MGRIRjZvOVFZYkVnMjY1YnZqOFVUSUtFdjZOM0ExOEdBWVJRU3RuMWRwYy9J?=
 =?utf-8?B?ZFk2RStSVG1XMzZJUzJaOW85UmNudjBIYTVHWTEwREp3RDNTRVN4TzU5enh2?=
 =?utf-8?B?U20vVVZhYjZmUCtVYW45Y0dhb1ByQ3p1dThyT2JLT2I0U1pQRVpIMENOZ2wr?=
 =?utf-8?B?VTdQTVRzaW16dHFjVjI0eVg5V0p3NklqZGdQbjh1Q25MRjQ1WnFjTmlVdU9O?=
 =?utf-8?B?Q2dscEhyWERCcEk0b2o0eE1SZko0dXAyTWV4SHl5WHFNYnl0ZHYya2d3Sk1H?=
 =?utf-8?B?S3hWUy9oUU1ONit2dzdsVFAybm9vTURueS9kckkwbndtMzVmbXp0Nlh6ZTcz?=
 =?utf-8?B?ZmtTYWsvVWFhTlhJQkcveHNoTjRpL25WSUxUZjJEeGFlYUJHbkVJVnBwUHc5?=
 =?utf-8?B?WVM4Z3dZYVd1N2FZV0ViazVLT0ZrdHArWFJ6enowOWVTSjEwenNQQlF0cWQv?=
 =?utf-8?B?d0NjQ1VDL1cyWWhZK1RFN0k4ajhSaW0vZ2FldmcraVZPSUMyNmhwZUFOb1Nr?=
 =?utf-8?B?dVVFMjM4NlM2VUw5VUluTjhWbzBUVjA5dzYrUzdEMHp1Ym9OOWJLUTZBdWNP?=
 =?utf-8?B?QVZ2QU5OaVVQeFpWMm5iRFp0aytzcnp4UlhDRFd6NXhDSkNpNnBjWEM2bTRF?=
 =?utf-8?B?L0FDOXVyUDl4SkYyZmpMemFBQWRaV0U1TDBLT3BLaFh3NnA0OWswdU0wTmRn?=
 =?utf-8?B?RWlSeE9GMmd1N3czOFNxRnVCaFF3RUtXZy92ZGIrNkJNOTF2T3o3Nlp6SzJ6?=
 =?utf-8?B?aWFybHEwYXN3eXIzSzJFYmxLT2x6d2lyK01JMzJ4Yy9JeHJnWWxuK3hyV3BU?=
 =?utf-8?B?aFNVbzdhaFBTR0tvS0VjMUxEZThUVkVkSExySmVUcTNjK2RqWGZKSkM5YXM4?=
 =?utf-8?B?b1ZIS1NuYm1INkRWSXRGTVRqVXd3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <621FD0B4B6B14A4FB431C530257E60B2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da02f79-673d-49eb-4471-08d9ea5c3602
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 17:06:41.2551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RVAUVd9HjeePwamqKhj9SBcQCLlb8tubyR8ZatvepDDIbEnnZSGm/gMIykp1kh8TGdsO3n3U12VI+VNVogN8921wubJdXVQ0nX7BENi9cd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3236
X-OriginatorOrg: citrix.com

T24gMDcvMDIvMjAyMiAwODoxMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA0LjAyLjIwMjIg
MjE6MzEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBjcHVtYXNrX3dlaWdodCgpIGlzIGEgaG9y
cmlibHkgZXhwZW5zaXZlIHdheSB0byBmaW5kIGlmIG5vIGJpdHMgYXJlIHNldCwgbWFkZQ0KPj4g
d29yc2UgYnkgdGhlIGZhY3QgdGhhdCB0aGUgY2FsY3VsYXRpb24gaXMgcGVyZm9ybWVkIHdpdGgg
dGhlIGdsb2JhbCBjYWxsX2xvY2sNCj4+IGhlbGQuDQo+Pg0KPj4gU3dpdGNoIHRvIHVzaW5nIGNw
dW1hc2tfZW1wdHkoKSBpbnN0ZWFkLCB3aGljaCB3aWxsIHNob3J0IGNpcmN1aXQgYXMgc29vbiBh
cw0KPj4gaXQgZmluZCBhbnkgc2V0IGJpdCBpbiB0aGUgY3B1bWFzay4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBNYXkg
SSBzdWdnZXN0IHRvIGRyb3AgImhvcnJpYmx5Ij8gSG93IGV4cGVuc2l2ZSBvbmUgaXMgY29tcGFy
ZWQgdG8gdGhlIG90aGVyDQo+IGRlcGVuZHMgb24gdGhlIG51bWJlciBvZiBDUFVzIGFjdHVhbGx5
IGVudW1lcmF0ZWQgaW4gdGhlIHN5c3RlbS4NCg0KSW4gYWJzb2x1dGUgdGVybXMgcGVyaGFwcywg
YnV0IHRoZXkgYm90aCBzY2FsZSBhcyBPKG5yX2NwdXMpLsKgIEhhbW1pbmcNCndlaWdodCBoYXMg
YSBmYXIgbGFyZ2VyIGNvbnN0YW50Lg0KDQo+ICAoQW5kIG9mDQo+IGNvdXJzZSBJIHN0aWxsIGhh
dmUgdGhhdCBjb252ZXJzaW9uIHRvIFBPUENOVCBhbHRlcm5hdGl2ZXMgcGF0Y2hpbmcgcGVuZGlu
ZywNCj4gd2hlcmUgUm9nZXIgZGlkIGFzayBmb3Igc29tZSByZS13b3JrIGluIHJlcGx5IHRvIHYy
LCBidXQgd2hlcmUgaXQgaGFzDQo+IHJlbWFpbmVkIHVuY2xlYXIgd2hldGhlciBpbnZlc3Rpbmcg
dGltZSBpbnRvIHRoYXQgd291bGRuJ3QgYmUgaW4gdmVpbiwNCj4gY29uc2lkZXJpbmcgc29tZSBv
ZiB5b3VyIHJlcGxpZXMgb24gdjEuIFRodXMgd291bGQgaGF2ZSBmdXJ0aGVyIHNocnVuayB0aGUN
Cj4gZGlmZmVyZW5jZSwgd2l0aG91dCBtZSBtZWFuaW5nIHRvIHNheSB0aGUgY2hhbmdlIGhlcmUg
aXNuJ3QgYSBnb29kIG9uZS4pDQoNClRoZXJlIGlzIGEgcGVyZmVjdGx5IGNsZWFyIGFuZCBzaW1w
bGUgd2F5IGZvcndhcmQuwqAgSXQncyB0aGUgb25lIHdoaWNoDQpkb2Vzbid0IGZpZ2h0IHRoZSBv
cHRpbWlzZXIgYW5kIGFjdGl2ZWx5IHJlZ3Jlc3MgdGhlIGNvZGUgZ2VuZXJhdGlvbiBpbg0KdGhl
IGNhbGxpbmcgZnVuY3Rpb25zLCBhbmQgYWRkIGFuIHVucmVhc29uYWJsZSBxdWFudGl0eSB0ZWNo
bmljYWwgZGVidA0KaW50byB0aGUgbWFyZ2luYWwgcGF0aHMuDQoNCkkgd2lsbCBhY2sgYSB2ZXJz
aW9uIHdoZXJlIHlvdSdyZSBub3QgYWRkaW5nIGNvbXBsZXhpdHkgZm9yIG5lZ2F0aXZlIGdhaW5z
Lg0KDQp+QW5kcmV3DQo=

