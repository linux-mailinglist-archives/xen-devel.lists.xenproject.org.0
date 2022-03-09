Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9275D4D350C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 18:03:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288006.488400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRzhr-00070b-S3; Wed, 09 Mar 2022 17:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288006.488400; Wed, 09 Mar 2022 17:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRzhr-0006yV-Oq; Wed, 09 Mar 2022 17:02:35 +0000
Received: by outflank-mailman (input) for mailman id 288006;
 Wed, 09 Mar 2022 17:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvXa=TU=citrix.com=prvs=060bf0544=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nRzhq-0006yL-MF
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 17:02:34 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4a90f5d-9fca-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 18:02:32 +0100 (CET)
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
X-Inumbo-ID: b4a90f5d-9fca-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646845352;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=k6ztCehjza+bcXw/T2UboJZpoS3IioKINFvKfcxm1RE=;
  b=AXq4m7mXye7SiZGWFeWwi5OQeA3D/kP97ZmCSp3M6DSLCkM4FFWgK1Rq
   /kl9eWqdvcGPpiFVuuGU9xpZW9tFKHxAiMspXOxIjJ1dmoroJyiXarc1T
   pfC2CavtEFexEAfvAdd8pOmbML70TqoMYeNYZ+EFFUJJFO06yJ/sLXiyt
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68194560
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bsseNKnJeIAJO2wKAEZhw/To5gx5JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXCjqFM/mPYzahe9wkOoW+900CusOGydc3TQU9qSlnRiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1LV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYEFwLboOTxbgnVgBDHhwuMoh8+7TqPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3mHhmwHf8BPIvRZnFTo3B5MNC3Sd2jcdLdRrbT
 5RJMGszMUqYC/FJEnELObY6huPvv1alamFF+E+EiOkbs1GGmWSd15CyaYGIK7RmX/59hV2Er
 2jL+2D4BBAyN9GFzzeBtHW2iYfnnz7/WY8UPK218LhtmlL77lIUDBoaRF6qu86Tg0S1W89cA
 0EM8y9opq83nGSnR8fwdwe1q3mFulgbQdU4O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBBzZirbmUQnK17aqPoHW5Pi19BW0NfygfViMe/sLu5oo0i3rnUdJLAKOzyNrvFlnNL
 yui9XZkwe9J1IhSivv9rQuvby+QSobhF1UXtiuIAz6f6xpiabP1aKmS6lP28qMVRGqGdWWps
 H8BksmYyekBC5CRiSCAKNkw8KGVC+Wta2OF3wM2d3U133H0oiP4I9gMiN1rDBoxaq45lSnVj
 Fg/UO+7zLtaJzOUYKB+eOpd4Ox6nPG7RbwJuh05B+eig6SdlifapEmChmbKhggBdXTAd4llZ
 /93lu72UR4n5VxPlmbeegvk+eZDKtoC7W3SX4vn6B+szKCTYnWYIZ9cbgfQMb5ltvPY/FmLm
 zq6Cyds408POAEZSnOLmbP/0HhQdSRrbXwIg5c/mhG/zvpORzh6Vq65LUIJcI15haVF/tokD
 VnmMnK0PGHX3CWdQS3TMygLQOq2Af5X8CJqVQRxbA3A8yVyPu6SAFI3KsJfkU8Pr7c4k5aZj
 pAtJq29Pxi4Ym+eqmpHMsWl8tAKmdbCrVvmAhdJqQMXJvZIbwfI5sXlbk3o8iwPBTCwrswwv
 /ur0QazfHbJb18K4Br+AB53826MgA==
IronPort-HdrOrdr: A9a23:HtE8DKpbNclVwub82YbpDwwaV5uCL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6Ky90KnpewK5yXbsibNhcotKLzOWx1dAS7sSo7cKogeQVxEWk9Q96U
 4OSdkHNDSdNykZsS++2njELz9C+qjHzEnLv5ak854Fd2gDAMsMj3YbNu/YKDwNeOAvP+tjKH
 P23Lshm9PUQwVvUi3NPAhiYwGsnayvqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+WemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aKSARcR4Z
 vxSiUbToBOAkDqDyaISNzWqk/dOQMVmjrfIJmj8CLeSILCNWoH4oF69Pxkm1PimjsdVZdHof
 h2NiuixupqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MciFW5uYd499RjBmcga+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zo93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkf8IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehTKYd0s8LAo23FUgMyPeFOwC1zxdLkHqbrUn8ki
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="68194560"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbyAfnltEMh0Qg/HZyZaGgmvbgEChxFZFhPwAs6aUKT3a+05gMvrTTyNsfT1pPdW4BWXxgdd41dFkIjc/tN1qdyK/GRFx2eftrgu/sAfFVuZ3XpyNFadJD1W1mGdI3P5UuOVjmDHfmuN9kVN/sAiNTxhaQq0+AXwsXc1zyNax7c9GrgA9Y6ZJvK3YxoeORfIrQnGVJW/6iKztbpT2S2Ay0Cz0oPG50ZMX1eJR11g3YzTrRLtsOYpoivNW4G4lR33QIkT10YT3usFJvpk91QVXWL+ws1MPTaKX2mZyTDTp+9098Vn5otcdWITedhamGD+YO4l+OEEotas04CZmE9DNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6ztCehjza+bcXw/T2UboJZpoS3IioKINFvKfcxm1RE=;
 b=PeS7ZlN7XGI74Rzjh4diF/q1iyxpJZCViGRjeR3p44tu9kIGX1XCHD4h78g+ayvuJQbnWmPKLRIjxDWhN3/mMkkwfSpOBDCOHB7I5hIWpFwgMLP97CK4XTJnElHNLC0n8DFrVPn3dTCVAFUpq5mOQmCIj8PA1oIs5nZ+pRRQhiklGOvCtmodKzIVXZ/bJTgCfxUXLRO4gqDuBoPm+m1QKpCellEnknTFVYqbhVFf6lpBLGQOi7Mt0j5HNHsVmPnQ6Sn27Q5p1WlT+0SfWpMN3aeRluvGnlXpCXPuRelqkuaoexiSAE6QdhBJ6MkWcLmiv6IXUSwFvgzN+dn/PIjfUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6ztCehjza+bcXw/T2UboJZpoS3IioKINFvKfcxm1RE=;
 b=VleQsyjgruMtoUZ3bDaYz9mrV+nupaxlDe8A9Pyfxfe/glawtv+9ZUnBQ49WQEhBBtZG/nZIBHMv8a2zzVK4SXUtanBzfD1vrNvCkBRJwHDf5W6uMrlSYyFuDAnMC8T7R4mIV4hhIvIm+Mnbz3PgWG+X7s4x3gETBBznQIlea1I=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYMjUEaMoAwzVpzE69n4F8Ciyydqy1XcmAgAAMr4CAAAJqgIAAIRgAgAAC1QCAAadGgIAAD0GAgAADBgA=
Date: Wed, 9 Mar 2022 17:02:07 +0000
Message-ID: <946e8a6d-2383-89ba-1f87-a48833aaf3df@citrix.com>
References: <20220307150609.10662-1-jane.malalane@citrix.com>
 <20220307150609.10662-3-jane.malalane@citrix.com>
 <YidAU63TsVO/X1Q+@Air-de-Roger>
 <b633f92a-151f-c7ca-0d91-cfad8d2edcbe@suse.com>
 <YidM/Wu5lqF48zg2@Air-de-Roger>
 <81dc2758-accc-25a3-7b3c-d9988757dd0c@citrix.com>
 <6a0f4d8f-581d-20cc-07bc-ffbf9a04cfe0@suse.com>
 <8ac6ad1f-de2d-be1b-3639-34effe85bd88@citrix.com>
 <e771892c-f02e-375b-fff3-a6cff89559a4@suse.com>
In-Reply-To: <e771892c-f02e-375b-fff3-a6cff89559a4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db18a5a2-2cd1-46a9-bba0-08da01ee8afb
x-ms-traffictypediagnostic: CY4PR03MB3237:EE_
x-microsoft-antispam-prvs: <CY4PR03MB323718A38AC5204C81EA11ED810A9@CY4PR03MB3237.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TRQyC0SKEgccP7IG6DcMRLjXlnOxYVprf7s0LDnhpLOtq0e6bjbMlcTnP5TkfL3tIuUXOibsIvVF67YrH9dtlJpahRmpRR26F4Ia3/HSTUk04XvXWd2TmfMqyoIzgSxLTpl6qrMfeUGp+8CAX9d/SrmZ+aStGKe3DLcZCZSesGF0fZNQtzBQqHXs2spqeJGrAnbbgkgOCgvCxJuCjKvy/pR5Xe8zHtm0tGTzngM3Me64bWmzK9VGLtCt2bzzcld3LoFjn8C345Rh21NP9rucBsE6FgVUsoKZ8n6uvjx86OYph+4zM/ye/pIUm7EQkiN/sfg16WQ/fUxvb2iYqiWO6Cxtl2UE2SfXJuumkCAidAsCK+6+k9iLttxKRsKxCmvDjTc6UegLrNiiOZGnOY8wHDAvS/lhNRADeDcJ1+wVuhxJmXbSi/OZ+gGywyzAwa8i20wiGeDNb2VEml6qO1o3KOP8vvi7v88Zr8y8+Wa7Bj0+wTV5Irt5PqlqiRnhSL6bnUlnLohdSQY9FAzSPFKm71xomMPtUWaS8+RpJNQZbSVRyPciZm3nUBX9FVV9hg5kplYlgenj/tYpvdQnbYp/Aiem/wxsib1x8iZLgZRKA4QnRE9M/YgBVwWm1LfsB1NvKUOmRfTOeVj6EvOpUif527+2ZcIWB+qutUtIsb4qfmV6gmU0g8FdwP6vmWbt+x3HBwNN5wrRWfp8qnXHV/ed9qaczs3WJXv2N6zu3la5l3OjH80WicuHXAjfichp7SRT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(53546011)(64756008)(8676002)(76116006)(2906002)(86362001)(107886003)(91956017)(66556008)(82960400001)(38100700002)(66946007)(66476007)(4326008)(54906003)(122000001)(71200400001)(6916009)(8936002)(38070700005)(5660300002)(6486002)(508600001)(316002)(31696002)(6506007)(186003)(26005)(36756003)(31686004)(83380400001)(6512007)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qjc2S3FZYkw2VUVJVGtnWmtLR1cvQm51MFFZOGFHbkxSOFhpQnhYZmVBeW5a?=
 =?utf-8?B?VEtla1ZsSzFjS2E4a0RjZENSZzlEUW1iczB1UmMrNjFyQ0Z3c2VpRnZyN2xi?=
 =?utf-8?B?d3pIUTZaTTc1eVRtVTh6UnBMNk1TdWtmUFpldlpMU0NhZTlmL1JQN005U0R6?=
 =?utf-8?B?Nm9RVlZOSUc0ckdrelRGQ2JBRDgzRGd3MHB2VlZFZE1PVzhGYmJRK1NEcUIy?=
 =?utf-8?B?bVpkQVZ2YlVXMTQ3aDI3UlF0VHRBRkprWnFrbnFqajFrM0JrbERWYTdMdURa?=
 =?utf-8?B?SENCYURBdG1wRC9CQjB5N2J2L2swZ2c5d3BnczNtL1NHWTI3U2trdFdqOUNL?=
 =?utf-8?B?NEJFUTdYWXlJU1RKM0lLS05ZWkdlUExmN3NFczhtQmN6V2MyNlVlSk5YSzQx?=
 =?utf-8?B?Nk1kdHRUSlluV0ZYSmMvK0xJemEwUkJqZkNwUVRSZnZMK2lNRXlSUTFWTzd6?=
 =?utf-8?B?M01PYmxFeXMwSHFCakNINXpOT0xPbW9zbzQ1VVlmd3pQS1BMV09sUGQrR3VW?=
 =?utf-8?B?N1hTZWpCdERPRGxCMmxTWmFLMDVjMlErenRaT2t3d05oSWpURmxWd0NpUUMv?=
 =?utf-8?B?SEVJNXVHd1JwNVFmSkNsY09FaHBHVHh2MVRZSnlTSjJPN2ZMWlJ0T213dW1H?=
 =?utf-8?B?M0c0elR1SUJITElBSFNhOS9xb2tsTy9vSnZiS09sZmhOcmxSZG1hcTZVblBS?=
 =?utf-8?B?VWZYTUdYa2FPanlueHFmWXRZb2UzcEFUeDVUNkZrT1FrMXNmSGJlQTEvOFZB?=
 =?utf-8?B?T0JKUzAyaitSUWo1MkVHa3RaTE9uMXFuYlgxVTRpekFaTFNtRzY2ZThaR0V5?=
 =?utf-8?B?WkVtb3F2L3hqSUF3YkZFRXo4a3hoL1UrQzEwTGoyS2xObndNZEFpNmh0ZVdD?=
 =?utf-8?B?YkNjYTM0b212c00zWFRCYkhWVTAvSzhpb2xQajVQd2NjNkhEcEZjNHZNV25w?=
 =?utf-8?B?NVo5Snd2Sm9WTnk5MnFuRmtjYjVqMkF5UldMdnA5ZHNseVJGNUpRcS9ITjlk?=
 =?utf-8?B?WXlGTnpKZU1kVis5aEkwdlpIM0xFUUF4b3A2dWQwQzdCclVpdEFDL2JaTDI5?=
 =?utf-8?B?L2FHR3B2L3BaN3F6L2xpbnl2cVlVN0FyS2hITVpTajlxUGp2K3FjQThHQWVs?=
 =?utf-8?B?enZBeHpJTHB0Q1JLSlFidnNFL3I2alFYa2tQdy93R2Z5K2diQkIybVFxZ0FX?=
 =?utf-8?B?WVI4cEZRUVJTSEFreWFOVU1TT2RqSlJIYWVYMVNwWmRGOXVsTktxK3VSdUJ6?=
 =?utf-8?B?Z1dWdW5jS3V2UW9tUW1CSVUvbitmRkN6ZVBiOVhiTzFMcW9menp5ZGg0Q0M2?=
 =?utf-8?B?S0FubFNPMGVSS1VJWVZVRzAvMWxuTmlLUTBhNGpOUERVNys2NktnOHNIWlJk?=
 =?utf-8?B?WW5RZlpXbUR2eTVPLzhzZ2JqRmtDVUVKM2VlQVVJdm41ZDkrdldOWjc2a21M?=
 =?utf-8?B?V2ZNVFhIVDZ4a0ZySUE5UHN4bXh0dXBzME5RVC9JODVGRElBNkU0akNFa3Rs?=
 =?utf-8?B?OGY2YzlyWGEzQnlDUnhEZnF2NXRMZEVUMzNFYk1GY0JDQkRqTUN2MTlyZFU4?=
 =?utf-8?B?czNNWVRsZG1BRlJ1WXRtNUR4L0JkbDBQdXlzQW1qRkFlUEhwejJCTWxoSnZ0?=
 =?utf-8?B?RkpPb3N1Z3V6bmNKazFMRnJKL1BRWlNhY0hqSU9WSWdab3o3YS9iMDg5TTRi?=
 =?utf-8?B?Z2NXUjM0RWNMSDludHRmemc5VlNFeU91cmdDWTdRUEY2N1pZNmJqd0hnTzgz?=
 =?utf-8?B?VEZ3UDA3QUova0JYeE5BT1RxY0kzdGM1WXJTUWVTMWNVaitqb1l1T3BYandP?=
 =?utf-8?B?bmVlOEd5OExmeGFmR2JtUXRQQjhubE42WUtydU5DaGUwTmNtbEwvbmVKa3ZT?=
 =?utf-8?B?WDlQVkN2dmhaamxuSjhmbFhYNlRQb3ZmandORExkVXB6WE40VGQwTktaWnNS?=
 =?utf-8?B?SXJ5OFA2a2pjY0VOeGVCdG8vdmFsV1JYL1RPNy83cmkzek1aTi9RS3pTNllw?=
 =?utf-8?B?Y1pZSXpyMzN0WHpUUmtPT210VUJkWGhzSE81eVRYZmJuYVl1bGI1TzZEaStT?=
 =?utf-8?B?MU1CZXhyOFNQbVpvVnlSNjFSWlhvVDdpTUxETE9SWlRDek1CUlVBb0tQc1V3?=
 =?utf-8?B?T2xpQWE4UHIxalpjSlBPZXowOHVSLzg1b0I3VWVOZldWWnovMzBFT0I0Yk9O?=
 =?utf-8?B?VWV4elgxc002anYyQmszdDNBUk5nY3g1SEI4QUV6bnJseFEyeU1YMFhDcDNw?=
 =?utf-8?Q?bGe7PdauUK5Ny993yu78Xix+aJb+DJ6sMxhj3R9qso=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B313B663E290574C8EA318CC8E16C8C9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db18a5a2-2cd1-46a9-bba0-08da01ee8afb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 17:02:07.0537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UxOazPpHWosaYc/GxAsk2bL9dUfHZJynGDLS6QtSDuikK/T161nMQwsZl0+MweqKaTtMcBy6ykPdSAUhHGfusbiKcUp4SW5jOMqn4wCJRI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3237
X-OriginatorOrg: citrix.com

T24gMDkvMDMvMjAyMiAxNjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDA5LjAzLjIwMjIgMTY6NTYsIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiBPbiAwOC8wMy8yMDIyIDE0OjQxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBbQ0FV
VElPTiAtIEVYVEVSTkFMIEVNQUlMXSBETyBOT1QgcmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIGFuZCBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+Pj4NCj4+PiBPbiAwOC4wMy4yMDIyIDE1OjMxLCBKYW5l
IE1hbGFsYW5lIHdyb3RlOg0KPj4+PiBPbiAwOC8wMy8yMDIyIDEyOjMzLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOg0KPj4+Pj4gT24gVHVlLCBNYXIgMDgsIDIwMjIgYXQgMDE6MjQ6MjNQTSArMDEw
MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gT24gMDguMDMuMjAyMiAxMjozOCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+Pj4gT24gTW9uLCBNYXIgMDcsIDIwMjIgYXQgMDM6MDY6
MDlQTSArMDAwMCwgSmFuZSBNYWxhbGFuZSB3cm90ZToNCj4+Pj4+Pj4+IEBAIC02ODUsMTMgKzY4
NywzMSBAQCBpbnQgYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4ZW5fZG9tY3Rs
X2NyZWF0ZWRvbWFpbiAqY29uZmlnKQ0KPj4+Pj4+Pj4gICAgICAgICAgICAgfQ0KPj4+Pj4+Pj4g
ICAgICAgICB9DQo+Pj4+Pj4+PiAgICAgDQo+Pj4+Pj4+PiAtICAgIGlmICggY29uZmlnLT5hcmNo
Lm1pc2NfZmxhZ3MgJiB+WEVOX1g4Nl9NU1JfUkVMQVhFRCApDQo+Pj4+Pj4+PiArICAgIGlmICgg
Y29uZmlnLT5hcmNoLm1pc2NfZmxhZ3MgJiB+KFhFTl9YODZfTVNSX1JFTEFYRUQgfA0KPj4+Pj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYRU5fWDg2X0FTU0lTVEVE
X1hBUElDIHwNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
WEVOX1g4Nl9BU1NJU1RFRF9YMkFQSUMpICkNCj4+Pj4+Pj4+ICAgICAgICAgew0KPj4+Pj4+Pj4g
ICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgIkludmFsaWQgYXJjaCBtaXNjIGZsYWdz
ICUjeFxuIiwNCj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgY29uZmlnLT5hcmNoLm1pc2Nf
ZmxhZ3MpOw0KPj4+Pj4+Pj4gICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+Pj4+PiAg
ICAgICAgIH0NCj4+Pj4+Pj4+ICAgICANCj4+Pj4+Pj4+ICsgICAgaWYgKCAoYXNzaXN0ZWRfeGFw
aWMgfHwgYXNzaXN0ZWRfeDJhcGljKSAmJiAhaHZtICkNCj4+Pj4+Pj4+ICsgICAgew0KPj4+Pj4+
Pj4gKyAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAg
ICAgIkludGVycnVwdCBDb250cm9sbGVyIFZpcnR1YWxpemF0aW9uIG5vdCBzdXBwb3J0ZWQgZm9y
IFBWXG4iKTsNCj4+Pj4+Pj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4+Pj4+Pj4gKyAg
ICB9DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArICAgIGlmICggKGFzc2lzdGVkX3hhcGljICYmICFh
c3Npc3RlZF94YXBpY19hdmFpbGFibGUpIHx8DQo+Pj4+Pj4+PiArICAgICAgICAgKGFzc2lzdGVk
X3gyYXBpYyAmJiAhYXNzaXN0ZWRfeDJhcGljX2F2YWlsYWJsZSkgKQ0KPj4+Pj4+Pj4gKyAgICB7
DQo+Pj4+Pj4+PiArICAgICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLA0KPj4+Pj4+Pj4gKyAgICAg
ICAgICAgICAgICAiSGFyZHdhcmUgYXNzaXN0ZWQgeCVzQVBJQyByZXF1ZXN0ZWQgYnV0IG5vdCBh
dmFpbGFibGVcbiIsDQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgIGFzc2lzdGVkX3hhcGljICYm
ICFhc3Npc3RlZF94YXBpY19hdmFpbGFibGUgPyAiIiA6ICIyIik7DQo+Pj4+Pj4+PiArICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCj4+Pj4+Pj4NCj4+Pj4+Pj4gSSB0aGluayBmb3IgdGhvc2UgdHdv
IHlvdSBjb3VsZCByZXR1cm4gLUVOT0RFViBpZiBvdGhlcnMgYWdyZWUuDQo+Pj4+Pj4NCj4+Pj4+
PiBJZiBieSAidHdvIiB5b3UgbWVhbiB0aGUgeEFQSUMgYW5kIHgyQVBJQyBhc3BlY3RzIGhlcmUg
KGFuZCBub3QgZS5nLiB0aGlzDQo+Pj4+Pj4gYW5kIHRoZSBlYXJsaWVyIGlmKCkpLCB0aGVuIEkg
YWdyZWUuIEknbSBhbHdheXMgaW4gZmF2b3Igb2YgdXNpbmcgZGlzdGluY3QNCj4+Pj4+PiBlcnJv
ciBjb2RlcyB3aGVuIHBvc3NpYmxlIGFuZCBhdCBsZWFzdCBoYWxmd2F5IHNlbnNpYmxlLg0KPj4+
Pj4NCj4+Pj4+IEkgd291bGQgYmUgZmluZSBieSB1c2luZyBpdCBmb3IgdGhlICFodm0gaWYgYWxz
by4gSU1PIGl0IG1ha2VzIHNlbnNlDQo+Pj4+PiBhcyBQViBkb2Vzbid0IGhhdmUgYW4gQVBJQyAn
ZGV2aWNlJyBhdCBhbGwsIHNvIEVOT0RFViB3b3VsZCBzZWVtDQo+Pj4+PiBmaXR0aW5nLiBFSU5W
QUwgaXMgYWxzbyBmaW5lIGFzIHRoZSBjYWxsZXIgc2hvdWxkbid0IGV2ZW4gYXR0ZW1wdCB0aGF0
DQo+Pj4+PiBpbiB0aGUgZmlyc3QgcGxhY2UuDQo+Pj4+Pg0KPj4+Pj4gU28gbGV0J3MgdXNlIGl0
IGZvciB0aGUgbGFzdCBpZiBvbmx5Lg0KPj4+PiBXb3VsZG4ndCBpdCBtYWtlIG1vcmUgc2Vuc2Ug
dG8gdXNlIC1FTk9ERVYgcGFydGljdWxhcmx5IGZvciB0aGUgZmlyc3Q/IEkNCj4+Pj4gYWdyZWUg
dGhhdCAtRU5PREVWIHNob3VsZCBiZSByZXBvcnRlZCBpbiB0aGUgZmlyc3QgY2FzZSBiZWNhdXNl
IGl0DQo+Pj4+IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byByZXF1ZXN0IGFjY2VsZXJhdGlvbiBvZiBz
b21ldGhpbmcgdGhhdCBkb2Vzbid0DQo+Pj4+IGV4aXN0IGFuZCBJIHNob3VsZCBoYXZlIHB1dCB0
aGF0LiBCdXQgaGF2aW5nIGEgbG9vayBhdCB0aGUgaGFwIGNvZGUNCj4+Pj4gKHNpbmNlIGl0IHJl
c2VtYmxlcyB0aGUgc2Vjb25kIGNhc2UpLCBpdCByZXR1cm5zIC1FSU5WQUwgd2hlbiBpdCBpcyBu
b3QNCj4+Pj4gYXZhaWxhYmxlLCB1bmxlc3MgeW91IGRlZW0gdGhpcyB0byBiZSBkaWZmZXJlbnQg
b3IsIGluIHJldHJvc3BlY3RpdmUsDQo+Pj4+IHRoYXQgdGhlIGhhcCBjb2RlIHNob3VsZCB0b28g
aGF2ZSBiZWVuIGNvZGVkIHRvIHJldHVybiAtRU5PREVWLg0KPj4+Pg0KPj4+PiBpZiAoIGhhcCAm
JiAhaHZtX2hhcF9zdXBwb3J0ZWQoKSApDQo+Pj4+ICAgICAgICB7DQo+Pj4+ICAgICAgICAgICAg
ZHByaW50ayhYRU5MT0dfSU5GTywgIkhBUCByZXF1ZXN0ZWQgYnV0IG5vdCBhdmFpbGFibGVcbiIp
Ow0KPj4+PiAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4+PiAgICAgICAgfQ0KPj4+DQo+
Pj4gVGhpcyBpcyBqdXN0IG9uZSBvZiB0aGUgZXhhbXBsZXMgd2hlcmUgdXNpbmcgLUVOT0RFViBh
cyB5b3Ugc3VnZ2VzdA0KPj4+IHdvdWxkIGludHJvZHVjZSBhbiBpbmNvbnNpc3RlbmN5LiBXZSB1
c2UgLUVJTlZBTCBhbHNvIGZvciBvdGhlcg0KPj4+IHB1cmVseSBndWVzdC10eXBlIGRlcGVuZGVu
dCBjaGVja3MuDQo+Pj4NCj4+PiBKYW4NCj4+IEhpIEphbiwgc28gaGVyZSBJIHdhcyBjb21wYXJp
bmcgdGhlIGhhcCBpbXBsZW1lbnRhdGlvbiB3aXRoIHRoZSBzZWNvbmQNCj4+IGNhc2UsIGkuZS4N
Cj4+DQo+PiBpZiAoIChhc3Npc3RlZF94YXBpYyAmJiAhYXNzaXN0ZWRfeGFwaWNfYXZhaWxhYmxl
KSB8fA0KPj4gICAgICAgIChhc3Npc3RlZF94MmFwaWMgJiYgIWFzc2lzdGVkX3gyYXBpY19hdmFp
bGFibGUpICkNCj4+DQo+PiBhbmQgeW91IHNlZW0gdG8gYWdyZWUgdGhhdCB1c2luZyAtRU5PREVW
IHdvdWxkIGJlIGluY29uc2lzdGVudD8gSGF2ZSBJDQo+PiBtaXNpbnRlcnByZXRlZCB0aGlzPw0K
PiANCj4gTm90IGV4YWN0bHkuIEknbSBjb21wYXJpbmcgZXhpc3RpbmcgaGFwIC8gaHZtIC8gIWhh
cCAvICFodm0gdXNlcyB3aXRoDQo+IHdoYXQgeW91IGFkZC4NCj4gDQo+IEphbg0KPiANCk9rYXks
IEkgd2lsIHN3YXAgdGhlIGVycm9yIGNvZGVzIHRoZW4sIHRoYW5rIHlvdS4NCg0KSmFuZS4=

