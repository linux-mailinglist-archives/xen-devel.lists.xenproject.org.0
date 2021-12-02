Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B02F46663B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 16:12:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236709.410587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msnkx-0006GU-CV; Thu, 02 Dec 2021 15:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236709.410587; Thu, 02 Dec 2021 15:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msnkx-0006DV-8D; Thu, 02 Dec 2021 15:12:19 +0000
Received: by outflank-mailman (input) for mailman id 236709;
 Thu, 02 Dec 2021 15:12:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tajg=QT=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1msnkv-0006D9-Ek
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 15:12:17 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3adcd354-5382-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 16:12:15 +0100 (CET)
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
X-Inumbo-ID: 3adcd354-5382-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638457935;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FfPhDdg0qiK+r9jFOYXWn9Bvt/kqYwiqoUoUOQJaym4=;
  b=RcLkf4ZxZsFzChofkx5TSsf1ovoRCQJ3u++rrO2gtKcyGEqOk4gKHvO9
   TU1WEOW+0DBM8Xy86zGGKXgK4qCps6PlLd8SRAKJoUy2qPC3nu7HeqQqM
   2eml5mqjoUtue7SLTPs5YT30dgMADGasNkae0tljFbybQjZfhgXaotrWT
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TERmFwh/AZttJMMXTVf971msz11ogxUq14znQztCE/GeG70a3Opg/MMAqFI/bHKoszlCu4vPpJ
 gP5jtDJpdedcHlWtgZbiY4zA2zb/B9rSd7LaRxseDfTHV4VqKjJfsT/qmgCYATsg51e6jmt94F
 KXEb07L0uSDBkS3dmbyGLF0Su8B26uabL3bd/TUUgVl6OMLqApVgEfB1YX6bPVQqR5D2sOpAVv
 JWUAB5SUwbG7PNJk2s0qmQh9qmdUtuIb0RSz6kESXWDPlrYNXX6l8C/TtH+pGy9QGZXfrqhxC9
 QvfHlGvnAdR7jq/Lc82lt1Wk
X-SBRS: 5.1
X-MesageID: 61156758
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:D5FAIaMItiAJ3KnvrR18kMFynXyQoLVcMsEvi/4bfWQNrUoghWAGn
 DAfWG3XOvuNYGqkft0jbovioRwH6sfXn4dnSwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En5400o5w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2iUn4hr1
 4lXjpGLYykYMbfyhf5DeBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uTvIIGg2pg7ixINfqHY
 5YjRghEVg7JSUdWKhAcC9UswOj90xETdBUH8QnI9MLb+VP71AVs1JD9PdyTfcaFLe1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PL+y++NugVaT7ncOExBQXly+ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTXlvX7cpAFAQeFdKMcU2Q6X9LfOvS2WUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P82rsZHF9wXsqIHZdEFBbu4WLTJQb10qXFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr5vmuVh6b/PuREDGQ3C94bd+51qXHb4
 hA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSXzJtALvG4kfRw0WirhRdMPS
 BSI0e+2zMUNVEZGkIctO97hYyjU5feI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO96rghjlDi7bc2qkHyaPU+2OSf9pUEtawDVMIjULcqs/W3oz
 jqoH5fQlkgEDrShOnK/HEx6BQliEEXXzKve8qR/XuWCPhBnCCcmDfrQyqkmYItrg+JekeKgw
 513chYwJIPXiSKVJAOURGpkbb+zD59zoWhiZX4nPEqy2mhlaoGqtf9Ne5wydLgh1epi0f8rE
 KVVJ5TeWqxCGmbd5jAQTZjht4g+Jh6lsh2DYni+az8lcp8+GwGQoo34fhHi/TUlBzassZdsu
 KWp0w7WGMJRRwlrAMvMRuioyle94SoUlO5oBhOaKdhPYkT8toNtLnWp3PMwJsgNLzTFxyebi
 FnKUUtJ+7GVrtZsotfThK2Co4O4KMdEHxJXTzvB8LK7FSjG5W7/k4VOZ/mFIGLGX2Tu9aT8O
 egMl6PgMOcKlUphupZnF+o51ro34tbiquMIzglgG3mXPV2nBqk5fyuD1MhL8KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+OvVWEpfCBCAlShBIeYnK4gi2
 +og5JYb5gHXZsDG6TpaYvS4L1ixE0E=
IronPort-HdrOrdr: A9a23:vXw2u6zzt259xY7OQy7dKrPxsOskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjnfZr5z+8J3WB3B8bfYOCGghrTEGgG1+rfKlLbakjDH4JmpM
 Ndmu1FeaLN5DtB/LbHCWuDYq4dKbC8mcjC74qurAYOPHJXguNbnnxE426gYzxLrWJ9dOME/f
 Snl616T23KQwVoUi33PAhJY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX232oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iBnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWArqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocWTbqjVQGagoBT+q3oYpxqdS32BnTq+/blnQS+pUoJjHfxn6ck7zA9HJFUcegM2w
 2LCNUvqFh0dL5iUUtKPpZ2fSKGMB2+ffvyChPnHb3GLtBNB5ufke+83F0KjNvaD6DgiqFCwa
 j8bA==
X-IronPort-AV: E=Sophos;i="5.87,282,1631592000"; 
   d="scan'208";a="61156758"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KF1HlQfFYrmBJWtdhzgDhJ4J61JI8EU3KB1lQbuJF2sjNDIcqU5v6xJZblSuLaBxBlWT1t4RAUVC/80PB93Pg0hBVxnPrDAc/CakgZ31syuO96fxM/m/61qw0DBkO7nWSqYuvy2EOV+CsKjTmknr/+r0olR4WQJmvlcoQ9ALRIq7RrI6oIVO4l1YF1CUf79m++yhNBehK2LFJMy6BmEy8uwuK9WCWi+yQuiJdMmLUj0JhzW00ykEMDn0AHhlfum6D0/clp5rpCsC5UZXNdNOf6wXULTj2Ydw1mTaFaHKJoe7E+c7WeQeP6Szeu/McbKnAoJT8jcmahIolCvjUy3Xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTQFAG6wpkOKgjfyVnQ76+u2NHrJ9pA1hz7kcG7xu6Q=;
 b=EPza+GnOD+os3ZSIV9HGopIMnxr9Q9KMBW2wH54MxAbZIywJ4Z70w6s5r6rs4T99Q1TsTMexifOpDgF4nYmVxlQcQwb29hIOz3b6uoolGTpEWVtQmJhPumx/bpw9fn4Zf+UKS00MbZCp8L8bAzmiP6P2NdFWWGY36mZotei8btMtIh3mc5D6u6gkVr1xx5fXQ+HpD+7gWJoKWgy2g+le2sU6R+46JjuBafiZP8RCtYb9yCp1ZbcG3yiUY/UscOX+67znOiB/iqStld5lLxIFD03+KvSZsP6CIpbp1zyQgSI0CG9/ynz+YPApi/x1U4hcUhUADgbnYbAF+iL9byPHpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTQFAG6wpkOKgjfyVnQ76+u2NHrJ9pA1hz7kcG7xu6Q=;
 b=EYn8oJEb6l0bO9NtoULqJL70fiE8Je1MMiM6u6uwPkEhih99JxexJyRdIWEVp4bDHpfmAsoh6NxgEzux3/1ft8qhg0SVl1bf3Xv0CsTcK7BvxMTrP34wX7bfKldQXZ9GX5x9Ng7UTmy3dsIY04872qdXthzPGQCWGgS8TEJOgDM=
Date: Thu, 2 Dec 2021 16:12:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 06/18] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Message-ID: <YajiQeaPx7KcL0Tw@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <f66b6403-13dd-cb05-7411-20efd7364b08@suse.com>
 <Yac7uLaQ1+YdCqtW@Air-de-Roger>
 <fd5ff1e0-88f0-3fba-4573-b007afdbb3a5@suse.com>
 <YadPLZqfN2pu5SeG@Air-de-Roger>
 <8b2c09f5-1f64-9754-17a4-936f1e496a82@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b2c09f5-1f64-9754-17a4-936f1e496a82@suse.com>
X-ClientProxiedBy: MR2P264CA0160.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb563910-dcd2-4d36-5a71-08d9b5a619f6
X-MS-TrafficTypeDiagnostic: DM6PR03MB4683:
X-Microsoft-Antispam-PRVS: <DM6PR03MB46835A8BAD98D6722F3015AA8F699@DM6PR03MB4683.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pyqpHUbsdbzsMeHRSCxQQKNkF5Rqe35/3ME+hrXAM/byeAiBmyt5T7F/xK/vBK/dv4NvaGeCwbrgv+84Gphf2J9J8DKGk4zr6KVAkLNzwj7ddnK6mrfJaejZil15GakyfT1atxZtNVqUAca3f082gKLRtQwcchw1COAF64BI6ekVVMlaPKckbtwhjwCVvh9NRKbnMucpXAQbHlYX4X8/ytqEeXuDvrdPEyoeVb0kOuPdokstDLfdh5ByF8D8gnWdkJLQba7FDPFztGyxfuEy2RtiLLq1Sf6qYzSq3Ak4BU/vAvUBuPS9rwAmZaI0A7bSvZOQe+MffIg0TgouSKe2wqPJv/MwtJRQg6iKYwDcrH5IrLYJo9TE6SWdwzdWlyj5DuywmgxM23Rs9ZG7SIk3366gTWdE0TW3CQFQkZTdXNxRGI/lIUiz6De2FzSm3jli1yA1NfnyW2/ei1xCt2d5uO4VfLC7Lu25S+mBY4R9YEftOBDLsOx5u++JA3178V5nXsRaftnSJCg3ioDOmIHe9OWst0+BbwDb5Dhz1W0EmByXOKVlCD1spjOZ8m1xBppeaIjpNUJMrrX07lH/KKWW+VMfU710cDWNhP+NZCLstdQpl7mRew5PgaEbATOElbkE1WwjfZU377x+bnIgANY50A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(5660300002)(33716001)(53546011)(2906002)(186003)(38100700002)(83380400001)(82960400001)(6496006)(6916009)(54906003)(66476007)(316002)(26005)(8936002)(9686003)(86362001)(508600001)(66946007)(8676002)(6666004)(85182001)(6486002)(956004)(4326008)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3lsODVhRURRRmxCdU4xL2dtYjBHSUhXWUNjZkZBbitjY1hTM0RCWUxycGxF?=
 =?utf-8?B?SDR2bFUwd2dqY2FQdTFmckUrRjFHaFQ1OTJEclpkOVJZMUpvS1FVNGJPeVJT?=
 =?utf-8?B?endoaC9jak56OWVmRXRrbWVWZ0p4c2ZsVTFZaWovZjUvT3hCMEVnRHlVK29V?=
 =?utf-8?B?TVBmaEhLUVdjSllLZEYyYjNIdm05ZmY5ZVdNd0gyd1RCbjh6VEVoUHpsaVA1?=
 =?utf-8?B?c25JRDQwT3IycDBKUG1PWnNPR0hnUUJHcDhjZUdSS2lmNWZhVWg1MzUreVhI?=
 =?utf-8?B?VnhXUXpJRDJLUTFGSXhRZFozVlhUQmN0OWZDanNkelp4MkIydmpLL0lwN3Zm?=
 =?utf-8?B?S1Q3bVdQNDBlRVM4UExXOFByaHRkU0lFVWR1Y04wZlZEeEhSa1BjTVdib1Zh?=
 =?utf-8?B?MzlJcm1RRThBbnRRWGhGMHppUVVPT3hXeTdqRkNjMWcrK1pJaHBPMEFsMHo0?=
 =?utf-8?B?WDg2SDRiSHNMUDFGUGloRVBJREJheGlDZy8zZWlieFZiaXJkeWpscTRsUTdI?=
 =?utf-8?B?Yk9ydVFsZkY2eWtYVk1zQnRoZ1BrU2xnUmtEa012NXlhMk1yZ1BubGNXdDE1?=
 =?utf-8?B?M2svY0JYN0YyOERMMk9NWTNwbDlhZm85ZXBQYUFsRVdrZjdybnpLek8yeGFK?=
 =?utf-8?B?djNPejFFQi9LM2JvYkt5REJ5Vi9mWDRRNzVrakNkd09MRVFJZHdlKzlGNUxW?=
 =?utf-8?B?MXVyeHJIb1c5Ym83RWoveHBDd29FRjNEN3JNYlJoYmlKYnkrQ0JzSzlnSFJo?=
 =?utf-8?B?K0xMMkp6MUVuWC9lWTJWODVVbEFvL2F0YW95RU93aTY5dlNqc0o4MGdQU0xI?=
 =?utf-8?B?WTlQSkZZa0hRUFd1ZjN3b0pPM1dtbG91c0gxUXdHUUhCS1BQRldLU3lRa05k?=
 =?utf-8?B?djJTV0s1aTVjTWpVRkxGcjVvbDZsSmFTNGMwbldFaGozWjloR3RxNUZUUlNu?=
 =?utf-8?B?WGtmVjEyVk4vMkZoYWlleEswakcyWWc5YUhjcUJmUUZiVVgvaEo3TXFXcFZm?=
 =?utf-8?B?YjJnbWhjL0JPM0RqSE1XbWl3WEhRU2k4WG5XVGkvU2EyOEJwNGhieUEwTHdh?=
 =?utf-8?B?aGxyNEptZ0IyMW1Nb3NqN3pycDhpZzQrdHNkUElrQmwzcjNzaDUyeHRQUGVi?=
 =?utf-8?B?OTRscVJZSHZkYW1mbmJhalZnZUNuZVpHVWVLRXp5OEdhTURkZFBrbFJ2N3lr?=
 =?utf-8?B?aWVodlVVL1R2T1lncVhONWU4QllRWDVocjh1bFhZbjlaYUxCV05VQUFHRFJu?=
 =?utf-8?B?TG53dXBhM0FyNCtvLzkrc045NnV1RktXTC8va2N5WTV6WmVSYTRXNW1QYkJq?=
 =?utf-8?B?VzBwZEtoU0U1UTBXODFwaGQzZHZWMHl4MXcxdHNadmU0bndLWTFnTEY3TzdU?=
 =?utf-8?B?UU1wRjh1TWRjMDNwVjIrVUV2cWJRU2FvajdsV3VoZk0vbTg2YllzQ3hxUDZx?=
 =?utf-8?B?aWpiOUcvZEVhQ0dLUDZlSkRDa0lKeW5WWkdzajFrN3F2SWxjOHJCeGNMUndG?=
 =?utf-8?B?aVBBTVRPUTA0bndKd05EdlZJcmY2enNNdHlJWXFLdjFVanAvdVdKSlRaSEpQ?=
 =?utf-8?B?dmpxd25Lc3pZZ0I2SlBCcytpRlhVZG5BVmFpem9GMzNZTFM2TXFxa0lNclg2?=
 =?utf-8?B?WDF5U1ZUTkJSUDlzSWp2QkVuQzdVMmJtTXQvNTQxcGRIYnBIemRDN0JJNWJl?=
 =?utf-8?B?bDlLOE41SkdqakowdEFBN1VQdGp2MENqR1I3Rkc1RXh6WEphMWdNcUlYYkZG?=
 =?utf-8?B?c1ZRSDdIVkdVcklGQzh3eVduQ1NOdUFkcTRWcXY3dGFBNWJabGFKRm8vd3VR?=
 =?utf-8?B?a1hIMEJPdEpZYllwRHVjSTRQeGZVT3dpKzN3WXhXWHVFb2FERHlSc2hIMXEw?=
 =?utf-8?B?RXhWaldIREVLSnduN1dUSEU4UWlzVGVqenBGajdIL2tIR1dZTHZ1WVlrQ0lJ?=
 =?utf-8?B?dlJFNWpuc0V6Y09scDRqdURWcHV5djF1cWxsVkxWMndMMFVvakNjMnVYUXQx?=
 =?utf-8?B?SWdVS29lVjdhY3kvR1UwcXg2RzZKSjhQajFpMGlLWU5VSDEvMjdXeVJZZnU5?=
 =?utf-8?B?QS9TYWo0aWJwbHpzUmcvTllncUdpd3FNb3gybWhQcWFvQUFyRjhicFN0RnpM?=
 =?utf-8?B?UmNVUzlzcmowSUk4a1FzNkU0RzNLR3lvMFFWd2lFUC9IWHZtNDVucjdnUlQ4?=
 =?utf-8?Q?w070DPUNQWjMvLH9VCLW4XM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb563910-dcd2-4d36-5a71-08d9b5a619f6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 15:12:05.5773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sH8ybKpXkt/FHxrOTTxZhcp6aTYfECa/ASkKutT2Pd9sR7LT4qljjPHZwD/YNHDGVoPUc0ZI6ZD5L/wmnmfZnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4683
X-OriginatorOrg: citrix.com

On Wed, Dec 01, 2021 at 12:45:12PM +0100, Jan Beulich wrote:
> On 01.12.2021 11:32, Roger Pau Monné wrote:
> > On Wed, Dec 01, 2021 at 10:27:21AM +0100, Jan Beulich wrote:
> >> On 01.12.2021 10:09, Roger Pau Monné wrote:
> >>> On Fri, Sep 24, 2021 at 11:46:57AM +0200, Jan Beulich wrote:
> >>>> @@ -267,44 +267,60 @@ static bool __hwdom_init hwdom_iommu_map
> >>>>       * that fall in unusable ranges for PV Dom0.
> >>>>       */
> >>>>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
> >>>> -        return false;
> >>>> +        return 0;
> >>>>  
> >>>>      switch ( type = page_get_ram_type(mfn) )
> >>>>      {
> >>>>      case RAM_TYPE_UNUSABLE:
> >>>> -        return false;
> >>>> +        return 0;
> >>>>  
> >>>>      case RAM_TYPE_CONVENTIONAL:
> >>>>          if ( iommu_hwdom_strict )
> >>>> -            return false;
> >>>> +            return 0;
> >>>>          break;
> >>>>  
> >>>>      default:
> >>>>          if ( type & RAM_TYPE_RESERVED )
> >>>>          {
> >>>>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
> >>>> -                return false;
> >>>> +                perms = 0;
> >>>>          }
> >>>> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > max_pfn )
> >>>> -            return false;
> >>>> +        else if ( is_hvm_domain(d) )
> >>>> +            return 0;
> >>>> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
> >>>> +            perms = 0;
> >>>
> >>> I'm confused about the reason to set perms = 0 instead of just
> >>> returning here. AFAICT perms won't be set to any other value below,
> >>> so you might as well just return 0.
> >>
> >> This is so that ...
> >>
> >>>>      }
> >>>>  
> >>>>      /* Check that it doesn't overlap with the Interrupt Address Range. */
> >>>>      if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
> >>>> -        return false;
> >>>> +        return 0;
> >>>>      /* ... or the IO-APIC */
> >>>> -    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
> >>>> -        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> >>>> -            return false;
> >>>> +    if ( has_vioapic(d) )
> >>>> +    {
> >>>> +        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
> >>>> +            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> >>>> +                return 0;
> >>>> +    }
> >>>> +    else if ( is_pv_domain(d) )
> >>>> +    {
> >>>> +        /*
> >>>> +         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
> >>>> +         * ones there, so it should also have such established for IOMMUs.
> >>>> +         */
> >>>> +        for ( i = 0; i < nr_ioapics; i++ )
> >>>> +            if ( pfn == PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
> >>>> +                return rangeset_contains_singleton(mmio_ro_ranges, pfn)
> >>>> +                       ? IOMMUF_readable : 0;
> >>>> +    }
> >>
> >> ... this return, as per the comment, takes precedence over returning
> >> zero.
> > 
> > I see. This is because you want to map those in the IOMMU page tables
> > even if the IO-APIC ranges are outside of a reserved region.
> > 
> > I have to admit this is kind of weird, because the purpose of this
> > function is to add mappings for all memory below 4G, and/or for all
> > reserved regions.
> 
> Well, that was what it started out as. The purpose here is to be consistent
> about IO-APICs: Either have them all mapped, or none of them. Since we map
> them in the CPU page tables and since Andrew asked for the two mappings to
> be consistent, this is the only way to satisfy the requests. Personally I'd
> be okay with not mapping IO-APICs here (but then regardless of whether they
> are covered by a reserved region).

I'm unsure of the best way to deal with this, it seems like both
the CPU and the IOMMU page tables would never be equal for PV dom0,
because we have no intention to map the MSI-X tables in RO mode in the
IOMMU page tables.

I'm not really opposed to having the IO-APIC mapped RO in the IOMMU
page tables, but I also don't see much benefit of doing it unless we
have a user-case for it. The IO-APIC handling in PV is already
different from native, so I would be fine if we add a comment noting
that while the IO-APIC is mappable to the CPU page tables as RO it's
not present in the IOMMU page tables (and then adjust hwdom_iommu_map
to prevent it's mapping).

I think we should also prevent mapping of the LAPIC, the HPET and the
HyperTransport range in case they fall into a reserved region?

TBH looks like we should be using iomem_access_permitted in
arch_iommu_hwdom_init? (not just for the IO-APIC, but for other device
ranges)

> >>>> @@ -346,15 +362,19 @@ void __hwdom_init arch_iommu_hwdom_init(
> >>>>      for ( ; i < top; i++ )
> >>>>      {
> >>>>          unsigned long pfn = pdx_to_pfn(i);
> >>>> +        unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
> >>>>          int rc;
> >>>>  
> >>>> -        if ( !hwdom_iommu_map(d, pfn, max_pfn) )
> >>>> +        if ( !perms )
> >>>>              rc = 0;
> >>>>          else if ( paging_mode_translate(d) )
> >>>> -            rc = set_identity_p2m_entry(d, pfn, p2m_access_rw, 0);
> >>>> +            rc = set_identity_p2m_entry(d, pfn,
> >>>> +                                        perms & IOMMUF_writable ? p2m_access_rw
> >>>> +                                                                : p2m_access_r,
> >>>> +                                        0);
> >>>>          else
> >>>>              rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
> >>>> -                           IOMMUF_readable | IOMMUF_writable, &flush_flags);
> >>>> +                           perms, &flush_flags);
> >>>
> >>> You could just call set_identity_p2m_entry uniformly here. It will
> >>> DTRT for non-translated guests also, and then hwdom_iommu_map could
> >>> perhaps return a p2m_access_t?
> >>
> >> That's an orthogonal change imo, i.e. could be done as a prereq change,
> >> but I'd prefer to leave it as is for now. Furthermore see "x86/mm: split
> >> set_identity_p2m_entry() into PV and HVM parts": In v2 I'm now also
> >> adjusting the code here 
> > 
> > I would rather adjust the code here to just call
> > set_identity_p2m_entry instead of differentiating between PV and
> > HVM.
> 
> I'm a little hesitant, in particular considering your suggestion to
> then have hwdom_iommu_map() return p2m_access_t. Andrew has made quite
> clear that the use of p2m_access_* here and in a number of other places
> is actually an abuse.
> 
> Plus - forgot about this in my earlier reply - there would also be a
> conflict with the next patch in this series, where larger orders will
> get passed to iommu_map(), while set_identity_p2m_entry() has no
> respective parameter yet (and imo it isn't urgent for it to gain one).

I've seen now as the iommu_map path is modified to handle ranges
instead of single pages. Long term we also want to expand this range
handling to the HVM branch.

Thanks, Roger.

