Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FE04A3F6C
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 10:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262859.455265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETBR-0004sQ-CD; Mon, 31 Jan 2022 09:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262859.455265; Mon, 31 Jan 2022 09:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETBR-0004qY-96; Mon, 31 Jan 2022 09:41:13 +0000
Received: by outflank-mailman (input) for mailman id 262859;
 Mon, 31 Jan 2022 09:41:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytUN=SP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nETBQ-0004qS-7R
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 09:41:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb243eb1-8279-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 10:41:10 +0100 (CET)
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
X-Inumbo-ID: eb243eb1-8279-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643622070;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jg7/AFK02UErJvMPcY1tsAdHymkvbmbrYP0tNIjVZmQ=;
  b=TIzz7hp3UND5rCoD7DsISt33f/exGSK4KruuFLc8PpiU8XoXAwtRKTDo
   1rYoZBFjPtvfgoU+3Xy2BOOMZNqV/RZjMfTiHLHk5PFcQbSlmf0Oe0ExR
   j4qWE0qg06/03+J10DwLQpSQoosuZFiQVZ13BW66h5GAY9ivTCM0jJ93K
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KX824/Qo1pImywTqlN2FXxlYv930yhNFV9qrr48YHylJ3MMl6jUsQsPyH5HG2PeE4k33ermMhO
 cf/w8TUMLVgtEPsSgOJzu3I+HXy4GzvEQaZGGl+MW7Du/yrc6tZJvCK0oTyzi1CncxxfCfQB+F
 JP/8ONUYLipGpCAAeHiGTef2EE7EDPJR4epIpgqOQ4kyqxD8uqA3N/Ko/HBpR+L6lKTIkci3vm
 /8Fj162A77ru+pwoceUZzmHEM0Ft8MKaDLsITtC2tboM2gQ4Gaig4HA70v0TFZ1yvIOopUcrLx
 PyimQg82mHB8N/o8qwyfNHia
X-SBRS: 5.2
X-MesageID: 63104167
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HPIA0qO7CGtbxe7vrR1DkMFynXyQoLVcMsEvi/4bfWQNrUoggTxRy
 2pND2CEOqneNDOnL4t0PN/l9klUu56ByNFrSAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Ek6w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoyjOpN1Y1
 f9PjoPzWEQGburCo98MQSANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uRvIcEhWlv7ixINf2DY
 pA0eBMxVxDrQTxVMVsUKrExk+j90xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiZ+9Yg0KZr
 WLu5HniD1cRM9n34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOGTeKR0xDkHYgFc
 gpNp3Ro/fNaGFGXosfVQlqDrVeZlBwnRJlBUMJqrw+28bvG2lPMboQbdQJpZNsjvc4wYDUl0
 F6Vgt/kbQBSXK2ppWG1renN827rUcQBBSpbPHJfE1NZizX2iNxr1nryosBf/LlZZzEfMRX52
 Hi0oSc3nN3/ZuZbhvzgrTgrb99Bz6UlrzLZBC2KBApJDSsjPeZJgrBED3CBt56sy67CFjG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWj2pi78JdAOsW0vTKuMDiriUWWzC
 KM0kVgJjKK/wVPwNfMnC25PI5lCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrlBuZd2mHFW7T6DFPjTkkX8uZLDNSH9dFvwGAbUBgzPxPna8Fy9H
 hc2H5bi9iizp8WnPHGPr9ZPfA9bRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WeQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:fgWs0q2msqlhwXSs7Dkg7wqjBLokLtp133Aq2lEZdPU1SK2lfq
 +V9sjzuSWYtN9zYhEdcLK7V5VoKEm0nfVICOIqU4tKMjOLhEKYaKxj94Hmyz3lFyCWzJ8+6U
 8YGJIOa+HNMQ==
X-IronPort-AV: E=Sophos;i="5.88,330,1635220800"; 
   d="scan'208";a="63104167"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KW57M7lBStlqw6ZdFgD3w1InipABIsCbClTaGN630mOVuMeenEnbY4rHtWyEzjtHQMAcMz50KDql4LVlYKF1/cgtw3MV7hYxLrzMy0gbUXHMF7R57O2ayNdX+ouayqr8kAZ6MipvLg0SxvDhQ2iVKxJQSsltjQwcNtoKsb1Cq920Bk628ZsTkJvmERGO9baEZnLryEtOSSuZJgfmCzNEhax44xWgpFwuydwWwG8171yvbjeZ9fe8qponxKXm08cbxP57VL6HRalL86KS5nXxq0dpyZfUN7jfMp+Re/k4PUaLXQSAPzeDk7mB7+1vC2BChvufEl3W8yOXxoR3x508MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7Du2E7wi75A31DeeLGa8shaeraeo9TRnNjdP34ENnE=;
 b=UOVxetsTDahxys/3oDWvvm/gyU9DU1MJx3IE/5syjGwlysEVjgcG5xDBW4VGGxoX8YPss6iT6OSghmuBcZzb5Yukr7Br8KxuuJ4gSwCzSJ2nQbo3TeoMryhOwQljWchIhdhmndoUDQ3qRPi0vR3RI8UEQyrZIBqFOcX8BuF7hxhudXJMdVpO6WFhoFLSDNzjMqkYbEamIVxXPM+k3wcRmYM2eScBQYBEQ3ae8veqwuQpMhHJoOCqLqwAxwSKNZOHYBUXqnGLcoYvTNxwDfRXWlIwC1Pn8cLUKf8KAjZJdnC2KsIWmns+21q8kIVEfdNXj5IndG+Z3FgpQqQqtP36qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7Du2E7wi75A31DeeLGa8shaeraeo9TRnNjdP34ENnE=;
 b=g2k7iJj3tP7kK3PdspcucTlEOSyMVqErBKQUowAB3ZC/pJnHPpwlonbAcIJMksu0DCRsViL/0SFuO2wNr/pbvszpqfv8Q0gvNeNqVH2u8tzO9oxJLAf0jcTCwe49D7YXp/RosffFASDuHmnI+rtQ9HCxjQvMWKhFUfbFVN3yYq4=
Date: Mon, 31 Jan 2022 10:41:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/9] x86/cpuid: Advertise SSB_NO to guests by default
Message-ID: <YfeurBLIrtSpifuo@Air-de-Roger>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220128132927.14997-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P123CA0351.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 175d1dbc-dd68-4f56-c6a9-08d9e49dcd49
X-MS-TrafficTypeDiagnostic: CY4PR03MB3350:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB3350815E272124B5C192407A8F259@CY4PR03MB3350.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDy0yhVZv9JTkcohTOYwbnnFweBDhZpvqEbFRsRQFGMReZNU6q4+hc6r+SOF7O885jyNPYVg6yYz1rU1UnY/LPYjB4mIH7iZyfKrshguMyVx/KOl3zGAFxl+PD/Hh3dMQLVa4sKE9mlfS5o6OsbocAWK9icUvHQU67UxoasoZrrcPvdQdC38EyhtFQ02Rk73kOqbVKkuW7vp56ry+j50Tky7Fp0T7HozvGFO2dKJ3Cab0mTi2zyGGLR6yS4BCf9WQXWzhtRaQ8/89gDnhrla0KHox0grdmPTjQh9T9+ByhpL2o9yREtEHCXUuxB7JDwXyaRrtV3irqL91APduYxEjhsFVpGg5GIqjwU8EVyw/q1zOOWmCEiwcemHbk6X1zY4juuxmwQIP2Zx/wvg7NbvcQ5x26H5PIt7bmoLTKFXFLceykn1T0gUj1bDDNtrDRIMrUkHRxmk2nGIXRPgO+VPFpUSTDD4HIpUPwqHeywtCs/IjwtjjfuzUSTwPeqUYt3zAO/62XowTM74+E1EBM8xdo25Y3w6IDYL/KqMnN+jT6h4diJXEEMEGtGYrxTF7/F8GBudclM8a/UW4e+Lm/5npOvqJytPvRsKfbMuNqqBMJ9gbkXpx5mEjCppZwpK0KXvrWWMGGDmE71vRcLJPreYMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(33716001)(82960400001)(508600001)(54906003)(6636002)(86362001)(2906002)(5660300002)(6486002)(4744005)(6506007)(9686003)(6512007)(85182001)(8936002)(8676002)(4326008)(6862004)(186003)(66476007)(26005)(66946007)(66556008)(6666004)(316002)(38100700002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmRRL3ZVRVgvQ281YjZFRFVCcUxDbGRvbnBHSU5HcDlVRElsaTczSnFTTkFw?=
 =?utf-8?B?TEdZRlYxZEZ6U3hmNTNHeGVCZkpSYlBMejdXZy9SM1B4SkR5LzhCY1M4MWk2?=
 =?utf-8?B?a3FIVkVVemdRQ0NuZ2ZqZlNLa3ROY0lNdGJ4SHhKSnh3S2RiQWhlMll4Vkhq?=
 =?utf-8?B?RTRZV1k0djZrdUFKOGxJSThKYWlSNEJCaGliMXdmd1ZkeUZIZ2NHenoxZjZr?=
 =?utf-8?B?cDd2bUdacDJSTEczNTVPUDFUZUZreHUzWG13SDNEd0x5WFJKdFNNVURTczBK?=
 =?utf-8?B?R2pidVYwQU52eUhXbFNvMGFPNUp2cFJoVlVZVkU1alBLRjl2WDRFNlpBMzhI?=
 =?utf-8?B?NFpPVjNUeEpOZExmeWJiRTI5cnhYYWJkQzU2UmpHRk14RWcxMkwxMGVrUEc4?=
 =?utf-8?B?L2k3SWlNd3ZROGFWRG0weTBDK3pwZUVSSlVLTlUwRG55MDdFN2RhQlJjeC9a?=
 =?utf-8?B?cENyajJydmp4OTZwSGpJWGpoR1F6ck9NMXpUWGtGUlJ5Qnpid1piTTVsRDQz?=
 =?utf-8?B?MkpvSDdIcTNrUlJEOTVNTTRLblJrengxK1dPMVRsOGxGWEl1eExZNThVQmNi?=
 =?utf-8?B?WjBnMFJpUTNQL0FKZ1oxbjRPSFdYMW82V0NWTXJGZmNXVkd6empVVmJrQUJG?=
 =?utf-8?B?bmxjMkFkZGFyNWYrSHVlMVRtMzFhdnVSWERwQjdmYlp0L3BRdnp2S3c5SVJD?=
 =?utf-8?B?ZmcxNCtQN1BiY083KytwVWQ2N2dZQzQ5RDhIa0NCUTZBY29NRHVwYkNtbU5w?=
 =?utf-8?B?RXlzc2wyL0loZ3ZzeTlUb3hWZkZNRGxLS0tCeEl2ekZSY251Qi9Mc2k1R2ds?=
 =?utf-8?B?aHFwU2MvUXAyVzZWREdvbXpja0liTDFtdUxwcEFxVFpKeW9YZTFWYklXQ2gy?=
 =?utf-8?B?cFpjc0pQWUQ1KytMVGFPVG1LNWdhT21hVlB0Q0ZMNXpBcm5QOUhGSTZnRUtO?=
 =?utf-8?B?M0tjbXA3TVJ1dmIxSEp1QXgvWUdaMURrZTg1b0VWNFVyN2FYazA5bVNYbGFR?=
 =?utf-8?B?UUlXVlF2S3hQU3JCbzFSTlk4dHFXSnYxUmRXWEFLaWRzZmNyV2NyVDFLRW5J?=
 =?utf-8?B?TWhpMDBMMFdEcUVNRFlBa1o2a0pCc3R5Y2pMY2lqOUtxNE50UnFFVC9TQjEy?=
 =?utf-8?B?UW1UeGxJcWxSRjRmS2JaUEc4V1RoTnRyTTBMV3ZoSkNxcjJhMERlT0ZKSzh0?=
 =?utf-8?B?ZXhOYW5OTUZDWTFRUS9nK085Y1ViVmNHTURSbkc5LytwcjlDMnVyZVY4cUZn?=
 =?utf-8?B?OS9ORTNZbWRaREZNWmF4V2R5bUp0V2xFYS9ndlVVd1NDejgyS3U1WXYzb3px?=
 =?utf-8?B?Ymp5SHdWd2xEOHYxMis1WU9ZdDh2S1JrTmNTVUpDcmxOWFBZM3ZPanozeVIz?=
 =?utf-8?B?TFBSZ3E5VmYxYjJQUHpsUWZSNFZKZEpjdFhvdldIWCtSVlB5Mmh2ZElwQ3A2?=
 =?utf-8?B?bFNLN0UvRTl6OTdmOUh3Q242OFIzdkhsTE94SUZMWG53Y2JLVnAvbk1LNldZ?=
 =?utf-8?B?b0dLK3ZJU3dLQTNUYU1uSnZOSTNIekJNaDdBM2ltRURQRk5RL3lXSERlSWxz?=
 =?utf-8?B?dUVYb25pQThIdFlMN29Zdm42dTZHVHZPaEtJR2ZhekJFZ253RE1iOHowcEhB?=
 =?utf-8?B?US8xT1RhZnFDeXV6N1dPQ3Q0ZnNpcXd5bUpkZzVOMElyLytHYUoxS1FuRk1h?=
 =?utf-8?B?SnMyYkpjTzNUUHo3QWlqdnJpUWVDQU1QZEVFM1NJYnpiSUhEYldDdGs5SlFJ?=
 =?utf-8?B?T0VpeTQ2dWkyY0tiRzcyQjg2MXptajZzSCtsWXB3Y3VpTHFKalNsdXA3azZF?=
 =?utf-8?B?em84MjJQY3FtRzFodE5OQjJNNXYrODczeTBkMWlSaWVZaXVjZks2em05MkFl?=
 =?utf-8?B?elc4dU1RVlh1R2hnbVZLZS94QUxvL0lmb2hodGdqYzJ4NjRPdkpKald6ckJt?=
 =?utf-8?B?YjdqUTdQNmoySldLalpFTTFWQktVRHZLN1hzQjFzSUlzdHFiV3dYUHU2VmJJ?=
 =?utf-8?B?aVd1TzgzcUVoWGcxSzlMRDMweWowSy9taW9SaGwyQWZGZHZnTWVSdnhtVlVy?=
 =?utf-8?B?UnJnQUR0UmRQRm9NVDhJbmpBL3dVa0RYLytNdzJva0wweEt2U0RmNTdRcHBO?=
 =?utf-8?B?N2dYSUdLYVY1N3daU0hhaXh6bjMwb0RKbXhzSmRKSG55N3FSZVdlSmNKd293?=
 =?utf-8?Q?wCRbXjp92zT6mNAdcvlezLU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 175d1dbc-dd68-4f56-c6a9-08d9e49dcd49
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 09:41:05.5892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HU+iUCZqekaKzgls+WPVcSnQPP0zVVMcwNBfsC1AViSq+bmuvuxqJYBWJOFkQRfx3236ejyAsQXyDNxLGB9tFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3350
X-OriginatorOrg: citrix.com

On Fri, Jan 28, 2022 at 01:29:19PM +0000, Andrew Cooper wrote:
> This is a statement of hardware behaviour, and not related to controls for the
> guest kernel to use.  Pass it straight through from hardware.
> 

Not really related to this patch per se, but I think we should expose
AMD_SSBD unconditionally for SPEC_CTRL (and VIRT_SSBD for
VIRT_SPEC_CTRL when supported) in the max policies and implement them
as noop for compatibility reasons?

I would expect CPUs exposing SSB_NO to drop AMD_SSBD and VIRT_SSBD at
some point.

Thanks, Roger.

