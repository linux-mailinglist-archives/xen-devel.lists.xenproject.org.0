Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21E44A43AA
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:23:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262988.455499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUmL-0000f1-JE; Mon, 31 Jan 2022 11:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262988.455499; Mon, 31 Jan 2022 11:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUmL-0000cx-Fm; Mon, 31 Jan 2022 11:23:25 +0000
Received: by outflank-mailman (input) for mailman id 262988;
 Mon, 31 Jan 2022 11:23:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytUN=SP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEUmK-0000cr-Dq
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:23:24 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3261cb4b-8288-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 12:23:23 +0100 (CET)
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
X-Inumbo-ID: 3261cb4b-8288-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643628203;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0UWkGpdWAayO5iw2jQqmrbk8dexFrjmSlIEeiTbtePQ=;
  b=eUnhckf27Ubsu9GkyYuJt9LMgBLHA2QYwiVRlg6wuaHVm+5OGblKTRCr
   ub8Hxpe6FOOf/BOe8YLALQfcprHARc2OPk9e1TnRnm0lpLyQBUx7kKMcW
   jGuJZTWXrO/nZxOv8w6B0KzAqnIaRc/TyglThjmsx+lu52ZqYDS/6QAII
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: j3yjwsDSDkCwACDtlVfKF0p+kxmGUg0Tm32KEh6E/zLkHtl7TQh8zpmtFcDKQj7YB3CJj8W/um
 DxianSsnGfcHediS82PmCmV879jskJJFUU4uXvy1N4O1BS9GQP/+0Ohon3y2NH1nntxRzrsNOm
 GDyBksQxtSU9Nnb9QKI63rR5Xf4znEAwlMYyZlohIBehWvxMb3uO7qfSJM5s08+p6lXaJWE3Zf
 /T0qe8HAiL7E7vCCF/X+TEinlQuv8bU0nBRhP1X1/ZLunZ+ukWu2XuWbUvddpY7JGNl205dTiR
 zUM31cNaxk2WziuD+zLlFJux
X-SBRS: 5.2
X-MesageID: 63521998
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sgowvqwGIAftx7NS/dd6t+fRwSrEfRIJ4+MujC+fZmUNrF6WrkVUz
 mdJWj2POveLMTSmfot1b4nipkoBvsDWzNNjSVNupSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrVg2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt4ss6
 foTsMfvcjpzP5KSke1aXQlRKxgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEDgW1p15EedRrYT
 5cnMDhdRjvyXydsJWs7OYAwst2qoGaqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19vGyVu
 2bH9GTRGQwBOZqUzj/t2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQ+yOlkUAZAIVrLrc711+Ew+3a8w+hPz1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpk+XFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tGuVh6b/PuREDGQ3C94adu51qXHa5
 BA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL4INAPuGEgdRs4WirhRdMPS
 BWJ0e+2zMQLVEZGkIctO97hYyjU5fWI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jOF3rghjmzK7bc2rnnyPjOvFDFbIGOhtDbd7Rr1jhE9yiF+Lo
 4832grj40g3bdASlQGOr9ZLcwhWfCdqbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3QApy6QL+wD5t5s1whOikgYQSh13Q5ON7956YDbZonO7Ig8bU7n/JzS
 vAEfeSGA+hOFWubq2hMM8GlodwwbgmviCKPIzGhPGo1cal/SlGb4dTjZAbuqnUDV3Llqcskr
 rS8/QrHWp5fFR96BcPbZav3nVO8tHQQgsxoWE7MLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94rwSrlwBEtXGWXf/I2aDyiC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYln3WLNtJn6KgZtGuqFXn+ILvAK3X
 gSE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6rOidTEFfHxiQkygMfrJ6PbQsz
 folpMNLuRe0jQAnM4regy1Zn4hWwqfsj0nzWkkmPbLW
IronPort-HdrOrdr: A9a23:daP1nKkotBfNXZTRXWb1S++IAwvpDfO0imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmHp6VMt1xNfdfOla9MS4kD1jiU2gPNJt3ck4l+KSHqInc2omRCek1Jd0J6d
 P8bG8=
X-IronPort-AV: E=Sophos;i="5.88,330,1635220800"; 
   d="scan'208";a="63521998"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/D88jwALga0ZlmyeOHQ1xW2Mfjei/1ZKGhqPzqv+aQHHh5SaWv26ADnO4E1QJw3tJHFh0JdrYDep+zbQ9wLszG92AYw29cps8Shp+RSuhl24N+Vs4s0wNXWk8o4M2GnteBvo9JAZgZXESzXIoB1ub7ZQXOQKnjUucua3N0+/QFyRMm56SnNMXnLhkPsthyOUXnY9/6uojicYGMonfntKEheduys2bIZKTxTuC1Dbq7QFm9AIf/c5mx+h+hVjiHTUgWAfRQe8a7KAa9JxxtQmCDAeGuLatGkt4v1ZvyLj3i3rCAqNFRW7cKMrmeMYoGPrBqJHfinT2u4Nqw0BnZu/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8REmUeV1V4SLLzlCrB/FCcG+nNp2jowdG9widrP/nNc=;
 b=G9pmpjGmDFaFiP9djkGbYoVTVagSSaq3hqIWNfY/UhgMKU8qPha79i92nhjBzOAvnAM920+7LhQryZ7xhxnY/vK+9MaY5cOG7C5NtPk3/0Ucnvv/zKodyZeCbCrJuok9oHnQ9D6X0rS7Vtqgx8NMjYw/HxdzQss5p7f/4HXQyhbkGt/QcBlzmvu3EL0262zsEPf6oH4oeq6WfUeBZOMiOYK+rQ4G0c4TP9PICM26BOBA18kPEsjsoYe2ca+rqHpxISs6+h1kVnbIOTMm+yZl9bpB70fNnY/QRUzwx1Ar5Gbq/8FbBQrTVTsM3aGi3Mtw9OXyy7jxuEagB1SCjT2XdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8REmUeV1V4SLLzlCrB/FCcG+nNp2jowdG9widrP/nNc=;
 b=hFV9flDdC0ED47MiW93hZwGjmYNdW0TCytfh7Nz1AesWqUqwO6UX3+kwCkghAisVtWczDFj4ZaiU2gn0kJCwp8M9flThIjbQvd+d8VscCfTdCKT9E0ZXz/6qzgWUcS60Nmoq6yJw4bdncNFIXFLVWNQDjv/E9pGZZYjGcCAz/bk=
Date: Mon, 31 Jan 2022 12:23:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/9] x86/cpuid: Advertise SSB_NO to guests by default
Message-ID: <YffGoZtna8ijJTw/@Air-de-Roger>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-2-andrew.cooper3@citrix.com>
 <YfeurBLIrtSpifuo@Air-de-Roger>
 <f0f04ff9-e54c-0442-692f-573b6c191e14@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0f04ff9-e54c-0442-692f-573b6c191e14@citrix.com>
X-ClientProxiedBy: LO4P123CA0443.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54f78d34-c44a-41a5-17c0-08d9e4ac14b3
X-MS-TrafficTypeDiagnostic: CH0PR03MB6049:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB6049084B86EE6AB10A4C55E68F259@CH0PR03MB6049.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G2vM+jZFY7wCPMA60vWHig1cYLpvfKukHEGNIOko9jTJlW93kLkie4e+S3Kq6YOCQ8eEqRF0yOCl9bXwv4InB7gQgKnqcl8fASue2s9Th0pLtbvjLIv2zPOUy06Hi9dinZhez0Jvoj35kQlqWhiE4Op3g0iiBIMQ/cSixsoZGNIC49boIlrQJYkTgLwB19bTpQ8XDPyL6bjoKwqUpicCWNGUlqhh36VUUA6bVutsLh3u1nKGDEtjFGp3kCdn9/iLv2NJBZDa0R4XBCIklPqeTfmBJbKhnWe6FhDeNxdaFvtWfc+rj6hCMLXlawF9w3VrcioXn/oTV/hQDfCCfeELy4AZmlzF8NpH+Hf4GhMORaY8siXmIeTrhQIxGEUXylhS5Frk/v0Veb3ASSTts/+B2NZpTUOUy5MAqKN7kAiRaMypynrcvWE7x8oLiqNqzvK3gqgNrcvh81nqDTg0PmX9jE87Qf1jeFaDaNpyl7/a+J8heZwZ3T7g4yEpEN5RpWtUuxNP51NjD8fNDdXmJolFgK8aTWK/LAwaEq583cpbOkNV/Q3mtt9LdZd8eNgr135et8C3Rw3hxQa1Z9fxkSh/9eCrYDBx25GHvSSe7dzkxE1Ejje5JFaKQG50oW3WIQCnynOb6Zq8RU5d+rAsgeuHXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(316002)(85182001)(38100700002)(6636002)(186003)(54906003)(26005)(66476007)(66556008)(66946007)(82960400001)(6506007)(6512007)(6666004)(508600001)(86362001)(8676002)(53546011)(8936002)(2906002)(6862004)(9686003)(4326008)(33716001)(6486002)(5660300002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?by9LM0RPUHFEMzMxeTE5UEc0SUwzdzd0eXMxZmpjbVhyWEZRNUU0b1VNWnds?=
 =?utf-8?B?alNTUEZHMWpiekZ6T1J3dUZ0RnhldEZLYnY2bmE1N1dIZnhPM0VCWTNkeW1o?=
 =?utf-8?B?UTlldkZVaG9TMGdvaGJ4aE9UY3AzK0JUNXVON29tTjVjK2VUVUJLNERwb1pD?=
 =?utf-8?B?YVlqSXNneno1cHZPdmNYaTIxRE0yVHVVWlJnNFl1RlRHZUZxMW1HUC8yazhU?=
 =?utf-8?B?aVlEVFBZNjBMNVQ3K1BBWE9EdWw5OGJoWFZHZitjdGQvL1ZVNWErclpuQ0ov?=
 =?utf-8?B?ZnIvekNMMlMyK3VFR2Y4TXpkM2JuMGxKeWt3QnJVMmI3WjJoams2QmFxNURX?=
 =?utf-8?B?SkZaQjNOaUwvVWlMaU1ZQVhRUnovWWMxeDlNU1BuTU1aK1JEVUd0T3o0bDJh?=
 =?utf-8?B?aGNXMVUxK2d2a2NEUVJ2U01FazB6SjBNZHZseXJzVkJ5MzVEd296dUR0N1g0?=
 =?utf-8?B?Y2FuVWNIZmRRUnlWNDF4cGdkaGo2OWE3OSt0QlZNNzhGVDNmMElEcGw5TE1M?=
 =?utf-8?B?WFRDS0hBQWY0RUI1T0RXS3U4ZWt6VzlsM0ZXeDNmTitNdzZNZ2cvdGVnU2lK?=
 =?utf-8?B?L2haOURqOTBOeXZtZnpQd2pUZUozSHhiL2NHRmVSMkUvOG0wdGFIZElhVE1W?=
 =?utf-8?B?V05zaThmajFwWVBjYnZYSG02RkQvd081Z2x1OXdTUXNjS05LQ3QzVklBclFF?=
 =?utf-8?B?SUk2VnNDTjYyYUtDbmxwM0h0d1FucGVtTDVFcUptbVRTdU04QSthdjB6Q0tF?=
 =?utf-8?B?a01JZnNhZXhORWlmVFQ2ODFabnVuQy9wV3JpNGNKd3VVcnhpYkNZQnhrOTk4?=
 =?utf-8?B?RHFlazVMNzVNZmhPMFV6blNMSmlEYis4eVIwYjBQOWUxNWE3K3VuTzJmdnlw?=
 =?utf-8?B?UjZsUmJuYmhHaWJUdk1nZ3MrMmtrbDl1cHFvOGFTK3hSU1VXL2tqcUYwekdy?=
 =?utf-8?B?OVM3Zmg1L3BSdVVUdi8wbGQzYWJCcWprTS8wWERvM1FCOUl5K2tZZkIvRC9D?=
 =?utf-8?B?QmQ1eU9lV2dhTWJoeEFsWHRVNFliM2dVUVhBK3hwTTRyVE5ZYkRybmY2Vzg2?=
 =?utf-8?B?RkUwaExzczRNL2hta25IVGRYUi9HcWFQVG9MQUQ1QW11K3FjTTI2dmJGcjVU?=
 =?utf-8?B?MFc4VkhVRENPbjhQV1l5V1M0aDhmclB0MWJIb1NlTmFucUdOSmhPNmxac3hU?=
 =?utf-8?B?VmZTMEtUTUhMditmUityMjh6T1hxdmt6ZGttaVUwVXhrbENVYklXMlg3RTNa?=
 =?utf-8?B?RVRBY1hxK3FKOXd2VmN2NkgyN3FMWWRjVEhObWVQNk0zRUp3Y0VBYUU5cWdn?=
 =?utf-8?B?OElsYWdWbkw4a0NsbWlEUFZKQkhDdllKQUtpNUtqR1hNeEo2R2UvMjJSdGtu?=
 =?utf-8?B?Z0pxejJvb0VTa2wwQUkyREp6dHJFVUY0SmRDR0N4L2t4UnNzalRsWWpNTUZj?=
 =?utf-8?B?bjZKYmFWZnl0VGxRcEFqcmFkL0lXUmRUTmRMcnhsLzhTa3dMaUlvVThXSGM4?=
 =?utf-8?B?a0F0TTlYay9OKzIyY0RRQktJSHU2N1IyMVNxalJpc284NmtmUHJaVGNZRU5H?=
 =?utf-8?B?aDBaKzkyZmk2TFRRTmVkQ2l2d3hnanZLdm00RUxaemMwS2JkZXZlODFRNEFW?=
 =?utf-8?B?UytZaHUwQzR6SkVwbGtCYlcxUGhsaEpSZ3g5NnBzV0FBSHMwV3RPcWlpN2sw?=
 =?utf-8?B?Z21QaFJ0UVk2cTNjbGJpT0dSakxJSWRrQ0pxdklzZFZ5T3J2RnEzOFgyNGht?=
 =?utf-8?B?ZGhQUWpuNUxiSTkyd3NOaG9TbHdvc1h6c1ozWGV4YlNVR0dMMi9ULy90WGNP?=
 =?utf-8?B?Ujk2QnFPd3QyaTZFM2VrN3Y4RE1rMUh5YVozVVppK1VlY3VaZXJ5b1FiVThv?=
 =?utf-8?B?ZXlQU0pUamV1cXpxNmx1bUpYMUN3QVMrQ3lOandrQzkybTIyY05NejR1NlJQ?=
 =?utf-8?B?eGhEV2s1OHZOZU56RERxZEMyQzFvZXRkbVNEKzJVVFBZNGpzc243NDJ2ZFVv?=
 =?utf-8?B?L3dUdWdyWFJpaG15dXFGV2xpVFBTLyszQ2J4bkg0bHZEc01Xc0pGZFdUZVQy?=
 =?utf-8?B?NFRVOU02RnpBK0JqblNqMnVBVlBtMzZEd3M4SzBFN3NPSGdJekhJK1ViTnkx?=
 =?utf-8?B?dGJWK3JVOEJYdXJFWnBIRDhmNmpKQ21iRHpTSGNPbHpoUnRGOFZ6YXZyM1RP?=
 =?utf-8?Q?qxX3m1pfL7dPG0yrsGnwyQc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f78d34-c44a-41a5-17c0-08d9e4ac14b3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 11:23:18.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mt3SHaFAMtWTHsHLkeR6D0fZU53iGXXg7uQ7B7mFOOIs+DCkYw4F9I+V0+3zvBQxPLVLWlf6jQB6YNJArUytTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6049
X-OriginatorOrg: citrix.com

On Mon, Jan 31, 2022 at 11:15:09AM +0000, Andrew Cooper wrote:
> On 31/01/2022 09:41, Roger Pau Monné wrote:
> > On Fri, Jan 28, 2022 at 01:29:19PM +0000, Andrew Cooper wrote:
> >> This is a statement of hardware behaviour, and not related to controls for the
> >> guest kernel to use.  Pass it straight through from hardware.
> >>
> > Not really related to this patch per se, but I think we should expose
> > AMD_SSBD unconditionally for SPEC_CTRL (and VIRT_SSBD for
> > VIRT_SPEC_CTRL when supported) in the max policies and implement them
> > as noop for compatibility reasons?
> >
> > I would expect CPUs exposing SSB_NO to drop AMD_SSBD and VIRT_SSBD at
> > some point.
> 
> Why?  SSBD is an architectural feature.  It's far more likely to turn
> into a no-op on SSB_NO hardware, than to disappear, especially as the
> MSR is exposed to guests.
> 
> VIRT_SSBD is only offered by hypervisors, and should only be offered
> when there are members in the migration pool without MSR_SPEC_CTRL.

But we should also offer VIRT_SSBD in the max policy if the hardware
reports SSB_NO, because then it's a no-op and would allow for
migration from boxes where we do offer VIRT_SSBD.

Thanks, Roger.

