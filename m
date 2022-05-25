Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (unknown [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A80533C87
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 14:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337209.561740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntq0y-0002Tq-4N; Wed, 25 May 2022 12:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337209.561740; Wed, 25 May 2022 12:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntq0y-0002Rg-1E; Wed, 25 May 2022 12:21:24 +0000
Received: by outflank-mailman (input) for mailman id 337209;
 Wed, 25 May 2022 12:21:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PIRJ=WB=citrix.com=prvs=137d214fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ntq0v-0002Ra-QH
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 12:21:22 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 275ab625-dc25-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 14:21:08 +0200 (CEST)
Received: from mail-dm3nam07lp2043.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 08:21:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB4569.namprd03.prod.outlook.com (2603:10b6:5:10c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Wed, 25 May
 2022 12:21:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 12:21:14 +0000
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
X-Inumbo-ID: 275ab625-dc25-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653481279;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LRKICtsLLPt+yG34fs/Zlwu61EhRNr9vBmK9Wjs05gE=;
  b=VUNlft9H3c+8Niyh4kR3EVDCybpFdOOkboyKlZMYiGo6y9WHiNarfLro
   q46lZWp7GHndS4FfsrcjBW6gd/Iq4EYXTDZ8ytYmW47BvUP2euD3raEHy
   fC6TjcRDJjEdIuz5Dqfj2iyc9tNcuZeCNh9XTnApvwLdD9Diu6J9dUXTw
   w=;
X-IronPort-RemoteIP: 104.47.56.43
X-IronPort-MID: 72541190
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:02Yiyqhn5qKuiu22cVdZD11/X161rxEKZh0ujC45NGQN5FlHY01je
 htvWmmPOK6LZGD1L95wbIux8BxUsJTVzt5lSABrqiFnQygb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlnQ4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVciIafpx/Y6bzAbShxDO/dh/Ib3L3fq5KR/z2WeG5ft69NHKRlseKE9oaNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIEegGxYasNmRJ4yY
 +IwbzZ1YQuGSBpIIloNU7o1nfuyh2m5eDpdwL6QjfVtvjSKlV0puFTrGMuPa4GgGspop2yRv
 2fJ9VzyLDMwbuXKnFJp9Vrp3IcjhxjTQ5kOHbe18vprhly7xWEJDhASE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1ZpasEitcIwbSwn0
 BmOhdyBLRZiqqGPQHSRsJKdtyqvODM9JHUHIyQDSGMt+MXurog1iVTUUt9pHaqxj9v0MSHxx
 zGMvG41gLB7sCIQ/6Cy/FSCjzf3oJHMFlEx/l+PAjnj6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQUH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:nEEHZ6+yn3PiHEV6Yzpuk+G5dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQMdcBW7Sd+9qADnhOtICOgqTPaftWzd1FdAQ7sSk7fK7wfJIjb5/OJGz6
 tsGpIOUeEYYWIK9voSpTPIYOrIo+P3sJxA592uvkuFJDsCA84PnmQJaHfjYzVLqRF9ZabRVq
 DslvavzwDQO0j/Bf7Le0XtKtKz2OEj46iWHSLuaSRXkjVmuQnYrYLSIly1zx0aWzNKzawC93
 LZnwHC5qulu+ym0RPHk0ve9Y5fltfZ0d1ICNaXhsV9EESIti+YIKhxUbiLvDQ4u8Gq8U0rl8
 TlqQohOcMb0QK2QkiF5Tf90Qzp0DIj8F/n0ESZhmbHqdH0QzgrYvAx4r5xQ1/0+kAktNF53L
 lzxGSJp79eEB/GljSV3amta/gmrDvvnZLs+dRjwUB3YM87Uvt8vIYf9ERaHNMpGz/70pkuFK
 1UAMTV9J9tAB6nhySyhAhS6e3pek52MgaNQ0AEtMDQ+SNRhmpFw0wRw9Fatmsc9bomIqM0tN
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnLqcaIHjAwqSHsInd3NvaKqDg8aFCxq
 gpEWko6lLaQnieVfFmCac7oywkQw2GLH7QI49lltsJ74EVgtLQQGm+oRsV4r+dSs4kc4Tmsy
 zaAuMRPxbSFxqoJW8A5XyIZ3BzEwhHbCRHgKdhZ7p5yvi7ZbEDiITgAb3uzE2EK0dpZoq4OA
 pfYNHaHrQJ0nyW
X-IronPort-AV: E=Sophos;i="5.91,250,1647316800"; 
   d="scan'208";a="72541190"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mptxkxz1c58ML8TZymVqYOhd1URt7X8AkqaWPOZuh0SfcMIkvKJEHFqXkuo5rh6p3E5B3EBWRDD81aYUeIC5ujtcgRv5WzZgwRSl5kMYDJXpvW7sKc/ThF0suG4NheL95InuDyEJI2slwwo6CLVJzgxjQpujNaY+nzEBfBaQt75GWsr5QR6wIK+esj3Ecub4EvDxmuRHF+f3HujC8cIPQYjRIDS8Ykkdgx1TKuKi3GzUwLpcUARyOtqWEKHusr03rztURDBBbK80KgbX5n9Nk+Sy5vox+5WmYlglZUDhjOQAeiE1bhc3/LTao+ny4Fbr0pISt5w6lwsmYkCGkOckWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRKICtsLLPt+yG34fs/Zlwu61EhRNr9vBmK9Wjs05gE=;
 b=RTNr54eurAwegZawLv3gvy56U/00+Wdm/79QL7Y3FHQGO7cQTFOrwf+imCmSUQtu+tPSwXm9r+NOTxg/M+E6GZdtwyz1EG59nBu2EACfuxGyd/WP+pqKYMD+5RrXa9/rZK62JfqhYKsk+hYvyQ6tx7hePKUZ3tYO+EXUpGKAWXLVaFiMY6QnxDHUZMjnR9vig0iHVqEoxEkrWv2Qv7QDBhq74XAPIX7pJKsq0CKubTB0ZBZn7RP5h4cx0VNh3fzO4zNHas/XksQ0edxfrXcWNQdcUahcGNvVx0y20jqdmttDejfxNs4gZVPqpNyaKWX3UFg1kx/kw48SoTeBWZcQhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRKICtsLLPt+yG34fs/Zlwu61EhRNr9vBmK9Wjs05gE=;
 b=n4I5klgBJDb3FJoKhKFZY9HBARxYNU1d+PdM1TpivSzL+eQZYBK7h6huF7FHBJZWyOtIWp3ycDZxr+MkTl6Z6wdGf+ta1N8sElt4MCf6KHorWYQsbwr8AUveka6fDIo1Hd/fOVs7aHDVAot8p4uawvuQwvztPWLzCqR6PsFUgOQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, "julien@xen.org" <julien@xen.org>,
	"Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>, George Dunlap
	<George.Dunlap@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
Thread-Topic: [PATCH 1/2] docs/misra: introduce rules.rst
Thread-Index: AQHYb89OVlMbfNQEIke7o99YDeB9D60vhDsA
Date: Wed, 25 May 2022 12:21:14 +0000
Message-ID: <eec293b7-f6a9-181a-5674-9081f83667ea@citrix.com>
References:
 <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-1-sstabellini@kernel.org>
In-Reply-To: <20220525003505.304617-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88058cfc-7afc-479a-f8f2-08da3e490fdb
x-ms-traffictypediagnostic: DM6PR03MB4569:EE_
x-microsoft-antispam-prvs:
 <DM6PR03MB45696DC2F20769C1FF349A96BAD69@DM6PR03MB4569.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mgwAbrCFS0qKYX1cCI32ZJq+OEEKRuEVQcrTMn8XOVpCmvLw7IkIGQMtpYhxlykj2jopk+KT3KPkE5YEKb3vMj8QpgA6MspwHUz/hCbsBsCGDtzKGJ0GDMmod9cNCdYNhYWoqA5SCG60AoKRN4UVXOZeZsUi4hSNlzu0cyCM2YaT+dX8Kl4OWYbVxTRmA+FyA5tYyH2L1TTpOryAyTEmYjUkkSqkaaEki2D1jIB2wzr91SQZw5rkb4LuCUZV7ZpqxvIhkSP2HR0jPiE3tja13cdjlSN2/eZ2dZaDR9nkdHj3p9P/b1rGyUKklkU7jPu5OSkzG7ZPUe6cVpTa7N8xqwjrp9jQn/lzXsCcaltm2QLFfPAxP4NnwJmt5bSPHarg2+w9Lt9IfO3ySTlV3keeDZWU43tJvTp422er4/sm2s4tK9bYNBf33jnF2OCvSIYIdc542bC1vqBO0u6417B6d+rfofUxWRdMv1luaQYAxKU7iM1Y16t+t0NE/sITuFNFsY0msuCE4nrCH7QxoDI53V9rG6891Aov/MlQiMhc0daIZeBW71c79skahF5wtkPuGKBdaGrnTm0pZBOPE+vJ33EjfJd7y3aDwCvMotkvhurBlsShRAdKWp1Qfk8d/U92vCA4lU3APVJKncULJhYc5h3Ja7aDsV7+LF16eeVdfSno2Vae9Tphg3HdfSzNzTEf4M14kC+HCvz1oSfCp2h4Tngjw/l0hILISkwpjkWOWNKDwAQuz9BzuV+mdnl8ssWYZcYiKt4XID0LlIaTcuIXZMov4fWlFwXlzJb/9mlCBIKKBfvutSUfkiyrKFfEYAjWb4Q5fQqiF1Jv1gTCj89zNW48KgpRDy+eHC5JPXERFfZTjftABtK2LXyy+A2nnvT9hIVroK71uWba/xsIpo7G4w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(83380400001)(8936002)(508600001)(82960400001)(2906002)(66946007)(966005)(6486002)(5660300002)(54906003)(38100700002)(38070700005)(110136005)(2616005)(53546011)(316002)(26005)(91956017)(4326008)(66556008)(31696002)(64756008)(66476007)(66446008)(76116006)(8676002)(6512007)(31686004)(36756003)(86362001)(6506007)(71200400001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGo0UW1uM3hHZHV2bk82OU5nYmNsb0tBKzZmUTNrV0dXQzNHS3VyNUtobFZ0?=
 =?utf-8?B?aXYycDIweVB2QURNMVBWdVZVREpyazFmL3lOSHoxbEtPZmp2QXU3K01ZTlo0?=
 =?utf-8?B?T1dJMUNwSEd2RnFRYUFnSDA4dTIrci9HTXVSNktmN2VFV3NKNTVib1VkVXAz?=
 =?utf-8?B?Rm1kS3dzNXBJK1UvdHMxT0U3ckRSR1hBajRwTWhkNG5rd2pKa1o2YzNWVzRn?=
 =?utf-8?B?Zm1wcUxrTjBrOWsrdWhKdEE1OGpWcGlFdHdKR2N0Z0JiLzlGTjJkbDRpS1ZK?=
 =?utf-8?B?R3NyeE80Y1daaHVzOThEN3BkVDZXcTdCNnU4d2RTRnNMQ1Y5RkVjNGt6bmhX?=
 =?utf-8?B?Q2dkZVAwbDRKdzA0VDZHazhUNjd3SDdPWW52K2o0MHdDWW5zN1BoeUN6aUU0?=
 =?utf-8?B?QnNxci9oMi81ZUxqYytjbkxsZm9UV3V3aGcyL1h0Ulovak5nOWt4bW13OU05?=
 =?utf-8?B?VUJJRitJZG9ZUkNJNVErTGdjUmFySkNtOUJHTlVsMkV2RW1yelpYQ1NLaWZj?=
 =?utf-8?B?N1ZUcmcraVNyVEgyZ2xIaVRXRzlacFhLcmRrazJOYzlwenA5emVqNmY0Tisr?=
 =?utf-8?B?eW1vUGNKL0dpcUFKWHZvY2VpcDRMdGR4RE9mQ3FhSFIyeCt5bitaV0w4cjVt?=
 =?utf-8?B?RFRHeDFtWHd2blkwd3RjcjRUdVVTUFQvaGNMT0lQNmRLZGZWbkZwMXdwZFVX?=
 =?utf-8?B?N29tQ3BQbE56QWI5Qk9pczB1aXVGdDlQMitpWUc3bk9GSTVURVRwOTN6dVIw?=
 =?utf-8?B?THMwZjlHbVRBbkIzODBiM25Gdm9zdE9ybG5CMWx0YWRCK2JJSkFSSEtoMUVj?=
 =?utf-8?B?ZlVGM0tJNERZcXorMkc2Ui80Tk54SlpTWEg4aGs5dFM1NmFSaHJJaXlzS3Rs?=
 =?utf-8?B?a1lORjY5N0VndCtZSVkwbExDYTdtVUk4djdkekJRQyttNkx5dlRHRTRxNnpq?=
 =?utf-8?B?NWRxZERldUR6WUJIMjZ0MHIyWDVTVjRsK2tLRm1uR08xb0psaW9Nb0lOTHEw?=
 =?utf-8?B?eENIQ2F2dUdPZy8yVndIR3J3emV2RVFNNDAzOEZyVkM4V2V3WDhxZU90ai95?=
 =?utf-8?B?WmIrcU9YV0cySFc0ZEF0Ti9QbkZ0SCt5M1JiUjk0ek93NW1sRFB0cUljZmdO?=
 =?utf-8?B?Mk91R000TUxNMXVqY0xzc3U3bjc2dHMyK05FeTlEcEs3N1BpZHJTVzAvOEZn?=
 =?utf-8?B?L2k1ZEw0WC8wN1hVZDRlbFZmZ1JrQnRPT1BWdWl3VzFnVGFpTUl2bC9WWFF2?=
 =?utf-8?B?WW05OVdlNndNQklMM2xTczJPV0M5QzZVZWp1Z3orMStPdTEwNXFnRzdoV2dH?=
 =?utf-8?B?OEdiOTU0Zmtzc0pDMit3eUlSTFBtd3FYTTNsdldvMWdFbStjSytzb2U0VzJU?=
 =?utf-8?B?QjlQVHNwcUJZRnZ2S2x6Mnp5bjdlUHpidEZGMEZ1ZUpTNEY5WUI1RWJGSkpq?=
 =?utf-8?B?NWI4bFlsNXZtQ2JiL3lLSlUvdEs5aTgyT0NJU2VCeDZvdlZYT2xMNGZIanRC?=
 =?utf-8?B?SGF0am0rTFhDcFY0cFN3R3oxWHV0eEQrUGswVmhmWC9JV1JkL2NHMGl1QU5r?=
 =?utf-8?B?ZWlja2FrbjNkU05xaXllL3I1bU5MNG5SVUFmZ09WTkRGK1Bhb3hjZWpQdmtl?=
 =?utf-8?B?SWdhcXlvS2JlL3AxdFdac0ZyZUcvY3g5RjI4SnppL21ydUMxZElYM1AwbU1v?=
 =?utf-8?B?SGJNYmhNekFQL0ZjSzJXdTl4Q0dUNnAzWHVpNUtLa3RENm9JZlEraEZBTzA3?=
 =?utf-8?B?NHkvQ3hHbW5RYWVQZ2JheEp5dE82dSs0RjBVdENIMUUyaVJlUnB6eDhCUTAv?=
 =?utf-8?B?VW1XeVhkNURTVW91TGJvS3owWnUwWFNFeDlzV1loWU1RN0lXT2lzYndCanJE?=
 =?utf-8?B?aG1pUGlDNCsrQ2g4MHIxTnkrWVNDbDE3ZktLYjBEYzQrY0t6QmxPanFRMHJS?=
 =?utf-8?B?RFg5bHpyR291QVkydWNHc2FiTUNBQ2tLdkpPcmRMTTJ5amN6OU4yTWlqc0U5?=
 =?utf-8?B?U0pQcjhZcENEM1E0dC9weWhqTURURFViUWhnVUswYjJtY001MTNHT0dncDRP?=
 =?utf-8?B?dFdBaWtxdHhCVVN6d1c2dTFKSjRQMmdrMmQ1cytSS0NSM0c1cDFzRWc1R3ly?=
 =?utf-8?B?ZDdlM1JZVThma0x4bnFFa2Z2YkpvYU1OTnBhbUIzL2t1TU00QjExRkwxZzJI?=
 =?utf-8?B?NXVQc1p3eXdpOWdYRDFiOTB0czQ5cXNjUkxXRDFRUkM3RlkrbS9KczNYVzdr?=
 =?utf-8?B?YmJBc2NKN2xDQk5qQXdBTnY3c213SU9Pbm1KWkFwTWdpYkV6TExBY2t0Wlkw?=
 =?utf-8?B?TWFRckdyTHA5ajlodjU3YUJWYkJsWmFZOUUwVlRLMFpPSkdLb000a2FpWHM2?=
 =?utf-8?Q?9SSh2m+jcugJ5hMU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51ECA361125213469120BF7DE05691ED@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88058cfc-7afc-479a-f8f2-08da3e490fdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 12:21:14.5330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xR/f9Zcov1YEnauEuZukpdBzywyaMo1d1WA4RDGlObl/dKyqtRwKnzQgPmysCqWc7aCYbOEW1tZJgln7iY7i2mujvui7WcE3lQK+CaQsMgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4569

T24gMjUvMDUvMjAyMiAwMTozNSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBGcm9tOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPg0KPg0KPiBJ
bnRyb2R1Y2UgYSBsaXN0IG9mIE1JU1JBIEMgcnVsZXMgdGhhdCBhcHBseSB0byB0aGUgWGVuIGh5
cGVydmlzb3IuIFRoZQ0KPiBsaXN0IGlzIGluIFJTVCBmb3JtYXQuDQo+DQo+IEFkZCBhIG1lbnRp
b24gb2YgdGhlIG5ldyBsaXN0IHRvIENPRElOR19TVFlMRS4NCj4NCj4gU2lnbmVkLW9mZi1ieTog
QmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPg0K
DQpTb21lIGNvbW1lbnRzIG9uIHN5bnRheC9sYXlvdXQsIHVucmVsYXRlZCB0byB0aGUgc3BlY2lm
aWMgY29udGVudC4NCg0KWW91IGNhbiBjaGVjayB0aGUgcmVuZGVyZWQgY29udGVudCB3aXRoIGVp
dGhlciBgbWFrZSAtQyBkb2NzDQpzcGhpbngtaHRtbGAgbG9jYWxseSwgb3IgYnkgcG9pbnRpbmcg
cmVhZHRoZWRvY3MgYXQgeW91ciByZXBvLsKgIChlLmcuDQpodHRwczovL2FuZHJld2Nvb3AteGVu
LnJlYWR0aGVkb2NzLmlvL2VuL2RvY3MtZGV2ZWwvIGlzIGEgdmVyeSBvdXQgb2YNCmRhdGUgV0lQ
IGJyYW5jaCBvZiBzb21lIGluLWRldmVsb3BtZW50IGNvbnRlbnQuKQ0KDQpXaGF0ZXZlciBnZXRz
IGNvbW1pdHRlZCB3aWxsIGJlIHJlbmRlcmVkIGF0DQpodHRwczovL3hlbmJpdHMueGVuLm9yZy9k
b2NzL2xhdGVzdC8gb25jZSB0aGUgY3JvbmpvYiBjYXRjaGVzIHVwLg0KDQo+IC0tLQ0KPiAgQ09E
SU5HX1NUWUxFICAgICAgICAgfCAgNiArKysrDQo+ICBkb2NzL21pc3JhL3J1bGVzLnJzdCB8IDY1
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQoNCkF0IG1pbmlt
dW0gdGhlcmUgbmVlZHMgdG8gYmUgYW4gYWRkaXRpb24gdG8gYSB0b2N0cmVlIGRpcmVjdGl2ZSBp
biBvbiBvZg0KdGhlIGV4aXN0aW5nIGluZGV4LnJzdCdzDQoNCkJ1dMKgIHRoaXMgbG9va3MgbGlr
ZSBpdCBvdWdodCB0byBiZSBwYXJ0IG9mIHRoZSBoeXBlcnZpc29yIGd1aWRlID8NCg0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZG9j
cy9taXNyYS9ydWxlcy5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0NPRElOR19TVFlMRSBiL0NPRElO
R19TVFlMRQ0KPiBpbmRleCA5ZjUwZDljZWM0Li4xZWYzNWVlOGQwIDEwMDY0NA0KPiAtLS0gYS9D
T0RJTkdfU1RZTEUNCj4gKysrIGIvQ09ESU5HX1NUWUxFDQo+IEBAIC0yMzUsMyArMjM1LDkgQEAg
Y2FsbHN0YWNrIGJldHdlZW4gdGhlIGluaXRpYWwgZnVuY3Rpb24gY2FsbCBhbmQgdGhlIGZhaWx1
cmUsIG5vIGVycm9yDQo+ICBpcyByZXR1cm5lZC4gIFVzaW5nIGRvbWFpbl9jcmFzaCgpIHJlcXVp
cmVzIGNhcmVmdWwgaW5zcGVjdGlvbiBhbmQNCj4gIGRvY3VtZW50YXRpb24gb2YgdGhlIGNvZGUg
dG8gbWFrZSBzdXJlIGFsbCBjYWxsZXJzIGF0IHRoZSBzdGFjayBoYW5kbGUNCj4gIGEgbmV3bHkt
ZGVhZCBkb21haW4gZ3JhY2VmdWxseS4NCj4gKw0KPiArTUlTUkEgQw0KPiArLS0tLS0tLQ0KPiAr
DQo+ICtUaGUgWGVuIFByb2plY3QgaHlwZXJ2aXNvciBmb2xsb3dzIHRoZSBNSVNSQSBDIGNvZGlu
ZyBydWxlcyBhbmQNCj4gK2RpcmVjdGl2ZXMgbGlzdGVkIHVuZGVyIGRvY3MvbWlzcmEvcnVsZXMu
cnN0Lg0KDQpJIHRoaW5rIHRoaXMgd291bGQgYmUgY2xlYXJlciB0byBmb2xsb3cgYXM6DQoNCiJU
aGUgWGVuIEh5cGVydmlzb3IgZm9sbG93cyBzb21lIE1JU1JBIEMgY29kaW5nIHJ1bGVzLsKgIFNl
ZSAuLi4gZm9yDQpkZXRhaWxzLiINCg0KYmVjYXVzZSBvdGhlcndpc2UgdGhlcmUgaXMgYW4gaW1w
bGljYXRpb24gdGhhdCB3ZSBmb2xsb3cgYWxsIHJ1bGVzLsKgDQpBbHNvLCAiWGVuIFByb2plY3Qi
IG1pZ2h0IGJlIHRoZSBuYW1lIG9mIG91ciBsZWdhbCBlbnRpdHkgbmFtZSwgYnV0IHRoZQ0KaHlw
ZXJ2aXNvcidzIG5hbWUgaXMgWGVuLCBub3QgIlhlbiBQcm9qZWN0Ii4NCg0KPiBkaWZmIC0tZ2l0
IGEvZG9jcy9taXNyYS9ydWxlcy5yc3QgYi9kb2NzL21pc3JhL3J1bGVzLnJzdA0KPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi5jMGVlNThhYjI1DQo+IC0tLSAvZGV2
L251bGwNCj4gKysrIGIvZG9jcy9taXNyYS9ydWxlcy5yc3QNCj4gQEAgLTAsMCArMSw2NSBAQA0K
DQpBbGwgU3BoaW54IGNvbnRlbnQgbmVlZHMgdG8gYmUNCg0KLi4gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IENDLUJZLTQuMA0KDQpzbyBpdCBzcGVjaWZpY2FsbHkgY2FuIGJlIHZlbmRvcmVkL3Rh
aWxvcmVkIGJ5IGRvd25zdHJlYW0gZW50aXRpZXMuDQoNCj4gKz09PT09PT09PT09PT09PT09PT09
PQ0KPiArTUlTUkEgQyBydWxlcyBmb3IgWGVuDQo+ICs9PT09PT09PT09PT09PT09PT09PT0NCg0K
QW5kIHRoZSBwcmV2YWlsaW5nIHN0eWxlIGlzIHdpdGhvdXQgdGhlID09PSBvdmVybGluZS4NCg0K
PiArDQo+ICsqKklNUE9SVEFOVCoqIEFsbCBNSVNSQSBDIHJ1bGVzLCB0ZXh0LCBhbmQgZXhhbXBs
ZXMgYXJlIGNvcHlyaWdodGVkIGJ5IHRoZQ0KPiArTUlTUkEgQ29uc29ydGl1bSBMaW1pdGVkIGFu
ZCB1c2VkIHdpdGggcGVybWlzc2lvbi4NCj4gKw0KPiArUGxlYXNlIHJlZmVyIHRvIGh0dHBzOi8v
d3d3Lm1pc3JhLm9yZy51ay8gdG8gb2J0YWluIGEgY29weSBvZiBNSVNSQSBDLCBvciBmb3INCj4g
K2xpY2Vuc2luZyBvcHRpb25zIGZvciBvdGhlciB1c2Ugb2YgdGhlIHJ1bGVzLg0KDQouLiBub3Rl
OjoNCg0KYW5kIHRoZW4gd2l0aCB0aGUgdHdvIHBhcmFncmFwaHMgaW5kZW50ZWQgdG8gYmUgYSBw
YXJ0IG9mIHRoZSBub3RlIGJsb2NrLg0KDQo+ICsNCj4gK1RoZSBmb2xsb3dpbmcgaXMgdGhlIGxp
c3Qgb2YgTUlTUkEgQyBydWxlcyB0aGF0IGFwcGx5IHRvIHRoZSBYZW4gUHJvamVjdA0KPiAraHlw
ZXJ2aXNvci4NCj4gKw0KPiArLSBSdWxlOiBEaXIgMi4xDQo+ICsgIC0gU2V2ZXJpdHk6ICBSZXF1
aXJlZA0KPiArICAtIFN1bW1hcnk6ICBBbGwgc291cmNlIGZpbGVzIHNoYWxsIGNvbXBpbGUgd2l0
aG91dCBhbnkgY29tcGlsYXRpb24gZXJyb3JzDQo+ICsgIC0gTGluazogIGh0dHBzOi8vZ2l0bGFi
LmNvbS9NSVNSQS9NSVNSQS1DL01JU1JBLUMtMjAxMi9FeGFtcGxlLVN1aXRlLy0vYmxvYi9tYXN0
ZXIvRF8wMl8wMS5jDQoNClRoaXMgd2FudHMgdG8gYmUgLi4gbGlzdC10YWJsZTo6wqAgU2VlDQpk
b2NzL2d1ZXN0LWd1aWRlL3g4Ni9oeXBlcmNhbGwtYWJpLnJzdCBmb3IgYW4gZXhhbXBsZS4NCg0K
QWxzbywgdGhlIFVSTCB3YW50cyB0byB1c2UgdGhlIGV4dC1saW5rcyBwbHVnaW4uwqAgU2VlDQpo
dHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAxOTEwMDMyMDU2MjMuMjA4MzktNC1h
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tLw0KDQp+QW5kcmV3DQo=

