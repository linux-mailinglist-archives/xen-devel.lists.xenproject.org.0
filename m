Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6264B4E06
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 12:26:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271447.465886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZUQ-0000d8-9I; Mon, 14 Feb 2022 11:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271447.465886; Mon, 14 Feb 2022 11:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZUQ-0000Zf-62; Mon, 14 Feb 2022 11:25:54 +0000
Received: by outflank-mailman (input) for mailman id 271447;
 Mon, 14 Feb 2022 11:25:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jzps=S5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nJZUO-0000ZZ-61
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 11:25:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dba4670c-8d88-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 12:25:49 +0100 (CET)
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
X-Inumbo-ID: dba4670c-8d88-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644837949;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=x2ACjNyR/Yyor8CYIBA+dwgi1Pv4XrWPNo6hi4My4jQ=;
  b=XBNXOt1X0U3bOdUaZi2XYdAV3tOAVXDK7SViZ0MWfjCxQV463epmx4jA
   uXwpR+OWAVgBFXPI3lKWzqAu/zNFqVWVpvWkVvTX00j6jLTZcnKV58Ffa
   NkyY5NWHZeY0P4QCMaMG6EdTgiQ/m5Qd9HRWJOo/ui4DDRJYvcNOXd3Jo
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ojCVVkJR/IOdNp5aqHlLdkK2v3oVTT7gfpHFNW4z++Rh0oYJsIKyCnAUNKNxVwDRjLGm7nIl3e
 meptWAyG7lT7C/m7qLy1Lr+dQICU60i/4RaJZ5YP0PGu/cKAzUdUFzrfxlHh8ayWgjFLOXNkhr
 uyo7mvUOkdBm3a40ebcZPX+5YzJwN6HRaJdDViHeU12HF+tOAPbNDeLr/SRfrDSce+ChE01dJJ
 W3XyAx2e7eWjF9YS2Uxf+mCCOi0dN5w/6A+SxUNGrKWpz/nItACS7uzZHbLrawLzxcX+RGFhRM
 wvt4gtjTzRp+0kgxF9hf6YC9
X-SBRS: 5.1
X-MesageID: 64044387
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:u3wS2K1nBFbJiF+LTfbD5d13kn2cJEfYwER7XKvMYLTBsI5bpz0By
 WEXXzyDa6qJa2ujLtB1ad6y9ENTvpCByoRjHgdlpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhxt5O8
 c0VjJeKYjgxGo7v39Q0bil6OnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4MAgGtr1p8m8fD2X
 Ps4VAhLc1f7UhxxZgpIBZgiu8imiSyqG9FfgA3M/vdmi4TJ9yRP17zqPMvQa8a9b8xflUaFp
 UrL5238RBodMbS37j6I8WmlgOPVqh/qQ4IZFLC+9flCjUWawyoYDxh+fXKhvfS8vWuvVNteJ
 lI89zInqO4580nDZsP0XwC85mWFuBEcc9NKFqsx7wTl4qDZ+RqDD24ICDtIcsU7tdQeTCYvk
 FSOmrvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyKkUih/MVd9lHLSCp9v5Ayzrw
 zuKoS49gJ0elccOka68+DjvgTihu5zIRQ4d/RjMUySu6QYRTJW+e4Wi5Fzf7PBBBIWUVF+Mu
 D4Dgcf2xOITCZCAkgSdTeNLG6umj8tpKxWF3wQpRcN4sW3wpTjzJui8/Q2SOm8wPPk9YWfQa
 3X4hht1x7wUDFKXXY1eNtfZ59sR8YDsEtHsV/bxZ9VIY4RseALvwByCdXJ8zEi2zhFyzPhX1
 YOzNJ/1UC1EUfgPIC+eGr9FuYLH0BzS0o86qXrT6x28mYSTa3eOIVvuGAvfN7tphE9oTei8z
 jq+Cydo40gFOAEdSnOOmWL2EbztBSJlba0aU+QNKoa+zvNOQQnN8cP5z7I7YJBClK9IjOrO9
 XzVchYGlAag1S2adF3TMSoLhFbTsXFX9yxTAMDRFQzwhyhLjXiHsM/ziKfbjZF4rbc+nJaYv
 tEOetmaA+Qnd9g00291UHUJl6Q7LE7DrVvXZ0KNOWFjF7Y9F12h0oK1JWPHqXhRZhdbQONj+
 tVMICuAGsFdL+mjZe6LAM+SI6SZ4yRDxrIoAhegzxs6UByEzbWG4hfZ15cfC8oNNQ/C1n2d0
 QOXCg0fvu7Dv8k+99yhuExOh9jB/zJWEhUIEm/Fw6yxMCWGrGOvzZUZCLSDfCzHVXOy86KnP
 L0Hw/b5OfwBvVBLr4sjTOo7kfNgv4Pi9+1A0wBpPHTXdFD3WLluFWaLgJtUvapXy74H5QbvA
 hCT+sNXMKmiMd/+FAJDPxIsa+mOjKlGmjTb4fkvDl/94St7oOiOXUlIZkHegy1BNrpldogix
 L556sIR7gW+jDssM8qH0X8IpzjdcCRYXvx+5J8AAYLthg468X14YMTRWn3s/ZWCS9RQKU12c
 DWas7XP2uZHzU3YfnttSXWUhbhBhY4DsQxhxUMZIwjbgcLMg/I60UED8TkzSQgJnBxL3/gqZ
 zpuPkxxY66P4y1plI5IWGX1Q1NNAxiQ+0rQzVoVlTKGExn0BzKVdGBta/yQ+E058n5HemkJ9
 b6V/2/pTDL2cZyjxSA1Q0Nk96TuQNEZGtcuQyx78xBpx6UHXAc=
IronPort-HdrOrdr: A9a23:ScNwTavuzrDShlXaTKITW6O47skC7oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzI4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P7wrhJRGdZM8qPuMexzwqC33QRCvyHTcZeg60iH22tbKCItc3pDeRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64044387"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQCGWPP0gQSIuWDQd/gdQ6//HORooSHho+NGArm0bP1gzl51dw14Dpv3I6rMAzhE6C0HsNhSrSvJCU5Alts5a2pXZgIp9W8gNlGlLPWSNgRyt6ZqJTCThG48HtOdjy3TQpaerbCI38DDKulLmkvStlvTrgLqhsInUkj8pVwlpUTHsFfDh2fLIJDeDzqLlARQcf0p9P1U1ug7JsvxUWnt1hZ7rb0QQU8n2Sp8w9hGpSo04PkICcDLW0FxYgjPCLhf5UI0ESg8MQpCUCLIxaRr5sSICbkXxueaCqrgN9WcgNZtMH6ybUo4x/68BI6u2CK8zH1g8P5YQf7lis//+bVLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGS02Bj8gu4kyj6h4LbulHz3XtLOXZDVhRTZrzGK7yU=;
 b=KLzlGP6HpUPJ1KIm68W7+Rq4sUyOXZgmEweOVtqy17kIY0VB60yhVVg0b1rQcq2NfYv75Q13yqeGG992UEOnhzcTV/9qL0ZNfZig5fbuCAl7InWA7eXt0MwT+fhezhXzNWUDrQFBrNo186vXnggRdvrtKQoaewvGxh0FsXdctG/nBuob04Vh+cYr6icjnYY1CWBbI6t2j7cWqt7kY+nSAabDhuuQnViv+xDhlem7jHLMpk2rZcqbLsjtFKRQ7pVeiCJd051csO6PwKykHq/3ft/iquAvvH5usgC8P38ZsVF0fDGF01Gm9mgTCb4D+jNq9yHmTjgzakJpHv/5w5G0ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGS02Bj8gu4kyj6h4LbulHz3XtLOXZDVhRTZrzGK7yU=;
 b=OY6GTYedDsBme7aLhrVoxJU5oApFVXvr7khBolAgvEWZrwKR2vg6pGEdKlZg1KDGPVapUr6Rffx4smKI4YBc3yvVuGtm0rfRTBsae3ZllEPLhEx4/TSwoDsfBlJrCvFTmtwRXpMAHDKxmlp0Q7CcEScSITC/Ov3O0r/1HWyGQpc=
Date: Mon, 14 Feb 2022 12:25:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Message-ID: <Ygo8M3Y6BLzljn15@Air-de-Roger>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <33fb1095-64ed-29ef-ba6b-cbde21d941f8@epam.com>
 <YgowIg5MvTaf2zsR@Air-de-Roger>
 <d8389a90-00c8-b34a-8488-b0f3fc5bde1b@epam.com>
 <Ygo40L4dMPJjZKRF@Air-de-Roger>
 <746860aa-c403-1eca-0a75-587c5d10c8c2@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <746860aa-c403-1eca-0a75-587c5d10c8c2@epam.com>
X-ClientProxiedBy: LO4P123CA0068.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ced6a369-6258-4d9f-8ebb-08d9efacbd5e
X-MS-TrafficTypeDiagnostic: CO1PR03MB5905:EE_
X-Microsoft-Antispam-PRVS: <CO1PR03MB590544E5EB849496B273F2FF8F339@CO1PR03MB5905.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fZQopwKNfHzn25LvhU3rMcCKTtWHrQome1xVtR2Y7Uf5mcj/61ZrWCYvGTso0W0Wf5sEIFpvJwJHyCKB9WFrXHyOgaTvHn17kiGqMwJQqPb78gjkccu17Iw/ZQjnGQr6NVwoXnLoP6tK2TcdGLiSjeLGa9skzTUQH6dYnQ3lPg3tLRM5DSZ94ayHP/MKnfdrXMCEYQeNXEaH7St8pkxBmL2vGjE6tEXnDveXKCuocJUvV5I/QNWOT48rem9Wrm+EosJ4XtflBRhYXrC5DZ7HiB6bYniPsmTqls4c40t5dgCMUi/2teEFxBxoFuVAzlkjxg9jfRJIRswrKsYT41hghSdnYEtcyiEh3Jf5COYynSSx3Z4E+W+LRAe5xWijT0tPE6q1hQ/6uQ42jihsQU/8TbEfNtjX/1MGWePtuVQ/X6+YqVuA+H44JjxjdUFccseqCYpJlTAHDccM1+43aWC1W+TpeFLU+K+P9y+dgdiWEzgFnA171axW7Y/A4GhS+3HnbLQOL8Mz01B6Um67k/WE5LBChEbwZx78lNpdu/rWiUkpPDc9evDABRzlArUlG6HPKOVP/uPv3Iamzp5PG8Ddg7pTNw3O1GPS1ZgQNzf9JkSRoaTqYgJpYgo7Er8uT6OHR5thcGFpoI5TfkZS5YXHRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(86362001)(82960400001)(38100700002)(54906003)(6916009)(316002)(4326008)(8676002)(8936002)(6486002)(66946007)(66556008)(66476007)(7416002)(2906002)(5660300002)(83380400001)(33716001)(9686003)(85182001)(6512007)(6666004)(26005)(186003)(6506007)(53546011)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlFDWDJHZHRRZ2w2dmtmVTUvQzhadG5LRzdvVGszZmxNNWZmUGNFTjRrd1pa?=
 =?utf-8?B?eHVZcCtzV1dxL2ZIMEtnYmRZVU5Sb0IzdWlXNWdpQktkNDZWSE4vVGhEU1ZB?=
 =?utf-8?B?QkVtcHpqcUI4akVkWmN6UHZwQVI3VzNKSHkzQy9jamZWVUZmVmdFRS9xSGhM?=
 =?utf-8?B?OHErWms2V012ZE9NYk0wbUI4ZkJEWC9pTHNsR1V2Q1l0S2JXR0tDZXZxcmQx?=
 =?utf-8?B?RHhXYjdBeThINjh4eHA3UWZjNVZUTnFVcXRja2hFR2hDd21Pa3R3NS9PTk5i?=
 =?utf-8?B?WitiaWN1RG91RmdJQjFneHFuVUZ0QXl2amlvYXRUZ1BOUDZqYk1KWTdRcXZt?=
 =?utf-8?B?b2lENzBQRmw1ZTBIZ0FJbXV6dkdINEVqT2ZnK0pLNFJCeHN2d2N4amxabi8y?=
 =?utf-8?B?N1JsSEJqWFdpM0U0N1U5WXlvMWFEbkZxVkU4SFFTeUVZV0t2MEJHZkJNZ053?=
 =?utf-8?B?b1pZYzZ3ZkxrdzhxQUNMa2xUT3NsMGU5LzVMbG1UU3k5SzNmU2JZNklKWEEr?=
 =?utf-8?B?dit1ZzZWYVBFczVtZEtQSFZvTEtxYXlML05HZXhVNzMvcVFFZnR0c3Irc3Jq?=
 =?utf-8?B?WXNwYm5YTkx3KzJiNEZNN0F0Znh1cjBacllTVGRDcUVObVdPMm5WbTNucXlT?=
 =?utf-8?B?N0dVZVl1elpUQVJZc20zYVVBLzIyMC9kaEIyYnNLNjRDY05BZjJ5TDc1VG9D?=
 =?utf-8?B?bzRCV3d0Nytidm93RENvUk16bUxYK0pXQlgxSWdhanFRWmtZRTdOcFl4Z1Ns?=
 =?utf-8?B?RlIraUduaFc1ckw2OTN6bVh6UnB3UzlzTEVwWGdITFpOTFlEdHFXcE10SDIw?=
 =?utf-8?B?ak1TZkhhOUoyNHVXZko2cGRFREpmVmUyZlN2cysxclJDRytFRnlGMlFEQ0hR?=
 =?utf-8?B?Tll3WHo1Y0RINEdCcUNNNHByR3dOYTkza0hqdXdUcHpZRWtxZjA5cVAzakl1?=
 =?utf-8?B?RVRBSngvSnloT0hGR0VUT2xRZ0g1MTNmWGNwOG5OMTJESDIvQ0YrRzdZbDls?=
 =?utf-8?B?VlNTMVhLTjJ0SHhOdmFJYzV3UmU3NnhKSGdIYnhZSCtvZzdCTnpib3REWlJM?=
 =?utf-8?B?cjAxUGxOMHl1MEhnZmNZU2VlUmJlT05nUmI3SmVmSjNSdThIR0hWU2o0MDZx?=
 =?utf-8?B?UjVCS2tTNDZLK1JJc3UyclZMNjRZOFc4OUp3a3NTNHI5UmU1RlRVMlhZNTkw?=
 =?utf-8?B?RVN2ckp4bC83bTV4NHJONW5QS09ubXQyTlBqMEZFSFNtWVpEMFdlVTZaN1g2?=
 =?utf-8?B?MzJZY254SEFsWGpkdUI1NWR3NDVaLzhicXlHV25tY3p1cTRteVdURmxpSFho?=
 =?utf-8?B?cm9DQkVFbjRaLzI1NFRkRDh2bVpCMGZjdDNjNHFQS2pQdTh6Nlp2NTRZTWhh?=
 =?utf-8?B?OThnTkR1WS8yOURWWDArSmQwdUpFdHVMWWE2cHJPeG1Hbk5KbWxGNUpaQktY?=
 =?utf-8?B?dmhFZ0ZpclJQRk9HZlVNbGhMQVYvc2Z6N1hLbU1wc1libGRRU1UxZFNPTUVN?=
 =?utf-8?B?QTNENGxsaE9NRlJHTjRBdWhwYW9tMjcvRzZBSVZhNUs0RFFLbjNqc29maDI2?=
 =?utf-8?B?cUtpMUF1aTdqQUNpM3JqdVFqS0pNbjl5UWUwazZmQXdOaEFPMmRzQVAwQjZP?=
 =?utf-8?B?ZS83U05seUw0cjVGR2lWVFU2SDhOTVIzRTFZcjNOSnZYd0c2MkFKVTVQU3dF?=
 =?utf-8?B?U3k0eTBnQUwzNXJycGM3VEZhdTF2RWp4MndSeW8wUzNyQTUvM3NHcVFTSTZJ?=
 =?utf-8?B?dnNkYVFwMlUxTUV0b0dSbDJkdm8wQXg4QTZCMjBEd2lXY2lmMkdhckNiL284?=
 =?utf-8?B?SmQ5eDdYdU1PcGpUK0NwbmdkSVAwVWRocjZUVG5BSis0eXh2SmRvWHJiMTJE?=
 =?utf-8?B?T0tMeUZRcDU1TjB3MGlMT2Fic1llUVR2aFdqcTU1NW9BekY5L2x2RGZ2MWlI?=
 =?utf-8?B?d1QxNlFiaWdxYzZiZkNBRnE3bkFjY0dJQXEzTjNUOENTbE1NaE5LRWlieEFD?=
 =?utf-8?B?OG4zeVRqekVRV290YzZlMkVLOTMxNEpnMngwVm9wWFJ1b2MyNG0xNTNKQ3BS?=
 =?utf-8?B?NTEzTElwMHljZDZucC8wVVNpcTYzdytqWm9pdEhCbUlGM1ltNXMyL3FocmFU?=
 =?utf-8?B?aUNBdTRrbXNJTVB3ekVjOFdJdU9MOHUzeWV0Y3IrdGFhWG8yUGxpSHFrYTU0?=
 =?utf-8?Q?HutJ+5UnjDa1W44beUyI4U8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ced6a369-6258-4d9f-8ebb-08d9efacbd5e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 11:25:44.1545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIdDXb+V4rPD8xuMLBfAkPRiRfV3jcb8Yvem55yZ1amxpAqx/MOVxFghV4l2oHeRkt8djoBIPkAsnc3qDycOEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5905
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 11:15:27AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 14.02.22 13:11, Roger Pau Monné wrote:
> > On Mon, Feb 14, 2022 at 10:53:43AM +0000, Oleksandr Andrushchenko wrote:
> >>
> >> On 14.02.22 12:34, Roger Pau Monné wrote:
> >>> On Mon, Feb 14, 2022 at 09:36:39AM +0000, Oleksandr Andrushchenko wrote:
> >>>> On 11.02.22 13:40, Roger Pau Monné wrote:
> >>>>> +
> >>>>>>>>          for ( i = 0; i < msix->max_entries; i++ )
> >>>>>>>>          {
> >>>>>>>>              const struct vpci_msix_entry *entry = &msix->entries[i];
> >>>>>>> Since this function is now called with the per-domain rwlock read
> >>>>>>> locked it's likely not appropriate to call process_pending_softirqs
> >>>>>>> while holding such lock (check below).
> >>>>>> You are right, as it is possible that:
> >>>>>>
> >>>>>> process_pending_softirqs -> vpci_process_pending -> read_lock
> >>>>>>
> >>>>>> Even more, vpci_process_pending may also
> >>>>>>
> >>>>>> read_unlock -> vpci_remove_device -> write_lock
> >>>>>>
> >>>>>> in its error path. So, any invocation of process_pending_softirqs
> >>>>>> must not hold d->vpci_rwlock at least.
> >>>>>>
> >>>>>> And also we need to check that pdev->vpci was not removed
> >>>>>> in between or *re-created*
> >>>>>>> We will likely need to re-iterate over the list of pdevs assigned to
> >>>>>>> the domain and assert that the pdev is still assigned to the same
> >>>>>>> domain.
> >>>>>> So, do you mean a pattern like the below should be used at all
> >>>>>> places where we need to call process_pending_softirqs?
> >>>>>>
> >>>>>> read_unlock
> >>>>>> process_pending_softirqs
> >>>>>> read_lock
> >>>>>> pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
> >>>>>> if ( pdev && pdev->vpci && is_the_same_vpci(pdev->vpci) )
> >>>>>> <continue processing>
> >>>>> Something along those lines. You likely need to continue iterate using
> >>>>> for_each_pdev.
> >>>> How do we tell if pdev->vpci is the same? Jan has already brought
> >>>> this question before [1] and I was about to use some ID for that purpose:
> >>>> pdev->vpci->id = d->vpci_id++ and then we use pdev->vpci->id  for checks
> >>> Given this is a debug message I would be OK with just doing the
> >>> minimal checks to prevent Xen from crashing (ie: pdev->vpci exists)
> >>> and that the resume MSI entry is not past the current limit. Otherwise
> >>> just print a message and move on to the next device.
> >> Agree, I see no big issue (probably) if we are not able to print
> >>
> >> How about this one:
> >>
> >> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> >> index 809a6b4773e1..50373f04da82 100644
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -171,10 +171,31 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> >>                                struct rangeset *mem, uint16_t cmd)
> >>    {
> >>        struct map_data data = { .d = d, .map = true };
> >> +    pci_sbdf_t sbdf = pdev->sbdf;
> >>        int rc;
> >>
> >> + ASSERT(rw_is_write_locked(&pdev->domain->vpci_rwlock));
> >> +
> >>        while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
> >> +    {
> >> +
> >> +        /*
> >> +         * process_pending_softirqs may trigger vpci_process_pending which
> >> +         * may need to acquire pdev->domain->vpci_rwlock in read mode.
> >> +         */
> >> +        write_unlock(&pdev->domain->vpci_rwlock);
> >>            process_pending_softirqs();
> >> +        write_lock(&pdev->domain->vpci_rwlock);
> >> +
> >> +        /* Check if pdev still exists and vPCI was not removed or re-created. */
> >> +        if (pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn) != pdev)
> >> +            if ( vpci is NOT the same )
> >> +            {
> >> +                rc = 0;
> >> +                break;
> >> +            }
> >> +    }
> >> +
> >>        rangeset_destroy(mem);
> >>        if ( !rc )
> >>            modify_decoding(pdev, cmd, false);
> >>
> >> This one also wants process_pending_softirqs to run so it *might*
> >> want pdev and vpci checks. But at the same time apply_map runs
> >> at ( system_state < SYS_STATE_active ), so defer_map won't be
> >> running yet, thus no vpci_process_pending is possible yet (in terms
> >> it has something to do yet). So, I think we just need:
> >>
> >>           write_unlock(&pdev->domain->vpci_rwlock);
> >>           process_pending_softirqs();
> >>           write_lock(&pdev->domain->vpci_rwlock);
> >>
> >> and this should be enough
> > Given the context apply_map is called from (dom0 specific init code),
> > there's no need to check for the pdev to still exits, or whether vpci
> > has been recreated, as it's not possible. Just add a comment to
> > explicitly note that the context of the function is special, and thus
> > there's no possibility of either the device or vpci going away.
> Does it really need write_unlock/write_lock given the context?...

I think it's bad practice to call process_pending_softirqs while
holding any locks. This is a very specific context so it's likely fine
to not drop the lock, but would still seem incorrect to me.

> I think it doesn't as there is no chance defer_map is called, thus
> process_pending_softirqs -> vpci_process_pending -> read_lock

Indeed, there's no chance of that because process_pending_softirqs
will never try to do a scheduling operation that would result in our
context being scheduled out.

Thanks, Roger.

