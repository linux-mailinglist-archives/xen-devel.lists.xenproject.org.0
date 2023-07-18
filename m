Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E9757D67
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 15:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565243.883227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkhs-0006Rl-Rh; Tue, 18 Jul 2023 13:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565243.883227; Tue, 18 Jul 2023 13:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkhs-0006PM-OM; Tue, 18 Jul 2023 13:25:36 +0000
Received: by outflank-mailman (input) for mailman id 565243;
 Tue, 18 Jul 2023 13:25:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lOh=DE=citrix.com=prvs=556a0cea9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qLkhr-0006PE-7u
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 13:25:35 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 913fc1e9-256e-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 15:25:32 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2023 09:25:29 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB6941.namprd03.prod.outlook.com (2603:10b6:510:156::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Tue, 18 Jul
 2023 13:25:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 13:25:18 +0000
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
X-Inumbo-ID: 913fc1e9-256e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689686732;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mFNs0Q7Ip0zkS6aRrx1P0yIll+0+bJYH3YlsnpVIEVc=;
  b=FbUopz6EecfkeEVBWyRO8whPQoJvZ9OKEw52w4/RvPyBYUJvFpTd0V6d
   Bze0bwYcN4ZDEDE9C4OFFNz7IKo0u32PWVPj6jZP7wHp7yJ6taEvfcCqG
   pT9b02N0NN0voaTotjzpN11q2FRsPypxefSZKVMMOTJf7PuXhzUkPbec/
   w=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 117024692
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:B/P5z64aNuNVtJWdDmttWgxRtNrGchMFZxGqfqrLsTDasY5as4F+v
 jQcWDzUO/mJNmvyeNwia4yy8EwP6JCAmoJkSgo4rnhhHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8S7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 /sfGm8hbw+62s2R7ZOKU7NC3d4bBZy+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOSF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLS+XiqqA72jV/wEQuETIRCV6j/MKAyUfud+pWD
 mYf3xYX+P1aGEuDC4OVsweDiGWFuxkac9tWDewh6QuJx7bU4gCWHWwNRHhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqZyUJUA8E6NnLu5wog1TESdMLOLGxps34H3f32
 T/ihC03nbAal8MI/6S941Hcgjioq4TJTwg6/QHeVCSu6QYRWWK+T4mh6Fye5/AfKo+cFwGFp
 CJdw5TY6/0SB5aQkiDLWP8KALyi+/eCNnvbnEJrGJ4isT+q/hZPYLxt3d23H28xWu5sRNMjS
 BK7Vd95jHOLAEaXUA==
IronPort-HdrOrdr: A9a23:7ULnv6D0R2MPCWXlHemL55DYdb4zR+YMi2TDtnoBMSC9F/byqy
 nAppomPHPP5Qr4dhkb+Oxoe5PwJE80lqQFgrX5X43SJTUO0VHAROtfBO3Zsl/d8kbFmdK1u5
 0NT0EwMqyVMbHWt7ec3CCoV/wb6J2s9qSwgOfXyH1gCTttd7pr425CajpzVncGIjV7OQ==
X-Talos-CUID: 9a23:etx4gGBXcmNBAWj6Ewtg83xLNsE6SyDy61rxElbiJz1zcJTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3Axh114Q//0HuO0oIW0OfDo/uQf/pxzKPyDVhQqqx?=
 =?us-ascii?q?FspmoDSVVETy4sA3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,214,1684814400"; 
   d="scan'208";a="117024692"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+qakMDy0NvauBO/5Ixx7B+ta7+Ppud8ZXKA1tfOVLW1qFG60AmL6ksby0APmjwgm2NJmAElHncE0orGmM19hNs0OnKSR6jFkc6lzgoEjPTvuvi9Y2JREkCCbRQxf9a1Us/ukoJwMZ7a2roZboiHxzTcUSdBkf6BdosNpX1/r/oQPWuHYRSBSWWEf8sSYCxRj5xfl9aSdYlAjaMKSzrc148Xm7sVQIpOIFCqBfRGFXT67riQrqobnq7FHdpMM+VamA5sAppKmj1dPJulfbOdrqKHkpktIxPhbPRmA3k1qAzRwscYTMMgsV2oFef733ktF+e50hpgrbr0y8AqivfGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFNs0Q7Ip0zkS6aRrx1P0yIll+0+bJYH3YlsnpVIEVc=;
 b=Dow7A9GOsOCF3rPlXzqyvdCH80/k9vpxp4v5banc/IsKP/UBpvCs4FzX3obHggB3+ZTBsFgEA8mHohdSeCF4v6OWfj2sLROKQLChKMZ8AGtdkccy5wSonaQyYmPMyAPc9nK6LGVu8q986esxJ6fscpk+ViaLzj2QYWXUUyMg1eJ1bQPj6rwslOp28JEM2BBjR21gqgkb1OmwaG1TycP04KJLVgcs0Pr5w/+r+jmfqxdwiV6xV/uSdoUSTS4JcK/+EpJo4aXCGe1O97WQdGN10iq6YFSFRLn7fWJt91IMFjtztqSwXPCE+AvqOHcyILXSScOWF5hK9zhHQ7vSywA95Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFNs0Q7Ip0zkS6aRrx1P0yIll+0+bJYH3YlsnpVIEVc=;
 b=kKhmigrlCmoDtvqr24B1eTLtKiTYDkRwT6iRjeiMN7SVACiI9nv2F/sOfwntg3Ie+eLlBSzBle2B5ySpfPk4l0z/4bkwZlq/OMx86J4z6UgZdISeNDF9qGZmunNPvgDnJR1MXI1UcaWI1L2P+NkvgnPp7v/0m5DsAXuZVSjLA0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bfbffbaf-01e9-3b6d-a57b-d1702ee6cf7b@citrix.com>
Date: Tue, 18 Jul 2023 14:25:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] x86/msr: Allow hardware domain to read package
 C-state residency counters
Content-Language: en-GB
To: Simon Gaiser <simon@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <946e5494801866c93332cc5d9ec0fa03a4df00d7.1689686046.git.simon@invisiblethingslab.com>
In-Reply-To: <946e5494801866c93332cc5d9ec0fa03a4df00d7.1689686046.git.simon@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0687.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 2822fc7a-01fa-4224-8d83-08db87926d83
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fr+bGNzKlIgcfVQjZfiutzojMETOeHJtMt2aVrUq0aTQ6IiH9i4iImdEvCkHiVgIyhFLhZhR4AECNHt26q94zJJLY1AktPSrPAaja5sdME7hG1KWgw28SvQRVYyCB+21R0W+nlBKCUu+N9vP54AbPIEzvZEr2mw7GftBICPr3SV631qWgeBCc9aqhV5TNr+fCr2Tn9Xw1cLiwBb9K+vGRsiTcb3Yzu2owgGx9nsyH5EQQp5NfRxdEw3DHXW/Bhk6icRlKKdyYjaGEFp55YjNt/+bGTxXqsldGo0j+JeHsU2ywOL+64IHA1CMU0TDEfoDsljc/A1K5eoCzraLWfmz9rGTTmZL6AcJSwBXL7VZ0ka5UUtQXNkqiEvffu+Q2ICDcwpitQ8UYBveH6C3EVUzXu1Nsnj6wHJsTIhD1nMbpEZ9B8qzYNSEruayoHlpBNY9GbquT1Fl1gvkO9j6IAFJOFv3r9DHFrAj2trh+gh5a3thYS4RpEOurA1TlSJGdixjrOl+1a6UwtiYEvHyQLZZQYlGaZ/yLAbYw8zMtxiWEBHdPCpR+XfWg9BxHZm2xLZrkudrNw6jBzgBKCnZDZ44QsoehDInSKqWkoqyPD3iePTclON82amJyh6vuTenL4yP++NIzRM45MMmPm67eJwSjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199021)(31686004)(53546011)(26005)(82960400001)(38100700002)(6506007)(54906003)(31696002)(478600001)(8936002)(66476007)(4326008)(66556008)(6512007)(66946007)(86362001)(41300700001)(6486002)(6666004)(316002)(8676002)(5660300002)(2616005)(186003)(2906002)(4744005)(36756003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkovQm5OYWtleEFFNW1DOWcxT0Q4WmoyeWVieDR0WkhXaTZTQ05Nc1hjN1Jk?=
 =?utf-8?B?bXF2eFN4MFZhMWVjOTFmWm1rNC9qdUg5bm5SSTB3bjJnaFB0UmRXa0pLeGRU?=
 =?utf-8?B?NXkyS0djMHNtTUZ6Y1lGSWd1TS8yRW5EdE4xVERYQlBmZC93eVZ0RDQ5NmQx?=
 =?utf-8?B?SVlybWdOaUZmckNnVmJLTEZ2N2o3R2FXcXRGN1JXNkJOT1ZmNHlQTVdGc0g1?=
 =?utf-8?B?cnVKd1FVSlZ3b0NuNW9xSGI4eFVBSk9yY2xVdnZsUjEyU0MxTkR4UDN2SFZ6?=
 =?utf-8?B?Rlo2YlpFVmdvWUFTZmllY1RqZWcxVG1aU2luMjQ3QzRkbStlQnM5MG5iZ0lG?=
 =?utf-8?B?a2RLTFNzNEdaTWJDZDZvTXZsVWNIVjA3Ti9FNkdMTTRPYXBIMngyalVOSU95?=
 =?utf-8?B?Vm9wTHpiQ292TW1rMVN2QTk4ZmQ1L2pYQW5jekhGb3Y1YXdzYmRsVytOSGs0?=
 =?utf-8?B?aUZqcTVGUzR4SDZ1RWJBRDBlYXNUWWxodkpMU1N3RjFuM2ViSjVKelhaSEpH?=
 =?utf-8?B?NHpyS29uVTB4NXRsY3QrK3hPM29zWkkrZzdNNlUwbjd4aGk4MzFTUS9VSUdO?=
 =?utf-8?B?L1JFd2dGa1VJSmMrRjVjWjNqcDJBU1dXTTVxRU5leCsyKzZEN3dpeXo5dURk?=
 =?utf-8?B?cWFpdFBSVE96dmZBaXRZcEtJSlJnODZ0WlZBbGRGcHZMMGErcVFVclQ3OHNP?=
 =?utf-8?B?OUpWTjlxSHRka3MrZkxLY1VCMi94NEkrK056aUJlQmpVTVhDbXJuSEliT3JR?=
 =?utf-8?B?REpTekhaMWFZM0VmMUdYSXFsTHgxOXZ2b203OGJjTFQreEIvUkRoYXExM1Vx?=
 =?utf-8?B?MVNOcnJDQWdCZmR3eXlmM3FEcmRFTEdiVG9ocEhScU5YckFlRFQ5OXBRN2k0?=
 =?utf-8?B?N3BuQnFXS0hvWUZhcXlaZ0g5aGdGUGo0dnlYOWJtKzk2SG5nbGZkNXQzN0tz?=
 =?utf-8?B?OFFDckRkTk9kQmJaUXpsTUltNExMUWZROHMvRURpZCtFWUM1ZFFhbUN3Vmxa?=
 =?utf-8?B?dk5sUytlYXREWHN1SVl5aWZKYmdVc01KWFlqK2c5K1JNZWovbGNZZ1VqY20y?=
 =?utf-8?B?KzgzWi92MjZuZ3ZFeVJwaitJQmlQY1EzQ2pMM3VRL0RscFE2M3E0OGduSEpS?=
 =?utf-8?B?bWl2NWpGTDIyZG9xcmJsaW8yaTFOdGFGL0tJeWV3UkZyUkYvMzBBdVA5MjE3?=
 =?utf-8?B?aEhZSmFaZ2lLd2pML2FrSlljK2VkQ2h1WHdmRlkrUTZsUXF6Q2FyY090TEFQ?=
 =?utf-8?B?TjlJV3RSeXJwdXJSSkdzNjAyckZJaTBxeVRuN2xJMFpxS3M1TGM3aUFoMnFw?=
 =?utf-8?B?TXVRb2E3UU5QVjRiODhYZ2VtWkZYdm1nMkxpYmlYdGd1c2sxQWsraDNwVWxq?=
 =?utf-8?B?M25TMnlRb1A2cGVMaG9zaVBGcFpjZU9zUXRTU0ZMcXVna2hkblZsa0syMUxZ?=
 =?utf-8?B?YlhjdlVMcVF0cTF3K0swVFBua0ZORHBJc0tzSEllUG9PS094bHMzZzBKNVp1?=
 =?utf-8?B?eG9HVmg2bXFiU0ttUGhPcVMySlREZVY1bjN2RnMzb2xESU1GTkgzK1dYM2gy?=
 =?utf-8?B?cGlHWWVHUDQ4eXNmbURsTU16UTZvbGdDNVY1QmJJcGFZc0c4ZzFMTHNpNC80?=
 =?utf-8?B?OXVhekdRRm94TDh2TGlJd0EyOFA4Qkg4WFhaQVQxRFFZNnk2Qkc4UzZOY3JE?=
 =?utf-8?B?cDdCcUFNR2l5bTNQbmQybVNhUkprVkEzRlZiSVNPeXlGVjB3TCtCYktYV2M5?=
 =?utf-8?B?M1F1UlhwWE9ldlQ2UE9LaDkrdk5HcjNBbW9OeDVUeUJrdkdGSkZWbFlia3dR?=
 =?utf-8?B?QXFsbzAvUTFaRkc5R056Q2JnY05vSnVETGhUZlAwV1A3a1FYNW1uTEg1YWR1?=
 =?utf-8?B?RlBpTmZmVG1XcTVFQjlZeEV2RzlPQnNITFMybmJvZHBNVVkwUFNuZmZWaCtN?=
 =?utf-8?B?VHlJMzd3Z0FwYWFiRmhDOU1va1A0OXA3bWV2TWNaTWVOYUMrNjZiSGdLN1BZ?=
 =?utf-8?B?blFGMnhmT2ZXMWIxNEZMU0w5dHhJZ2NRZmhUWXd3UXRGeU4wK0lBdlpoSTZB?=
 =?utf-8?B?QW1PWUJyV0Z5cUZNRXJyN216YUp5QzZ0Yyt2WU5INHZ4bGp3L3B2RXlyQ1kz?=
 =?utf-8?B?L2E2SUY1a092US90cG9mWWl6K1N2cmFlc1hNcXM5Mmxham1LRSt3b3BNcTMv?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qWUAlc0YeHlDnm11FsR3oE16bwVd3SkT8khpTc+zMuNWoAYK5yNzWzWh4H/Wo/sB79Koecfgx/0gEnDE9w4hK78WCihyOBsa8ShQdFneON90n66WEykC9tPvEupojk03NajHUZHYp24B/6AwTMI5K1j9oodSYToPrh5PWpQKhj6cqmiNsxa8AooDbVY6yX/db/jdsyb2/eiFwas1DcuEEBdtpmBSvW3+WTu5+jjKqUt6Fj7PBhrB4YZgNkPHfBYcbI3qoYft3USNIKXarbcv67mJUW5h7SuePODHqD5rvoG7PDI9AwO8VVUcIs0P8tjUydk41B4n/mPuoSrp9xZSHdhN90sTqwdaG9l7jgqONpAeM2js7Ew0I7KxYm9Q8lvivspBmGQnNV/nfvafYo6FXPbGkpc6SchNC0Bd8ZR0ySPfXCdKHmWRO9oJ9/qTW/b2TYVjE6hNwBN62CvhXtzuxYr2x82AiJ0TQXiBiGr0r/ACAD7o3B9iqN3yEa+nlXA5p+YNjNokr8HmwyrZBZ5LQGdIt4zhw1dgU/rfnTLpjelHnHQBdLfYi8z39sjeXV8eK97ydGaOFUytF7avoLOa2tyvTNiz9xdIulC6uSp11baFNlFu8iw+y58ccoPcRfOLJYHpbHUNcbfrylTQ1iDrtnnpZVqhni9LrkNQiB7AEp5q6jUn1jxQPG03g4mvLeShXCwAQ5fzcHrwbA4XxoDTyGhvv6njE0MDMMJ/FoUgaXOJVrAGsvIRvZ+PsqLdgCQPqZpQ7/9GPC7fEH//MwVchxYx8z+G0YAXpOv2hO+ZqWuCydfQqT1YMa6Xcx8AF9HJ/TagsJsBH5vUV6F/3goV1npqL1J6XV/B70dQBZA8MZ5qIjzdbPakY0mCrJNO1J5q
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2822fc7a-01fa-4224-8d83-08db87926d83
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 13:25:17.9351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CgkLDK/m9+X20Z0z3nD5cVCkcIy+uGDxU0J3YunNhqPDFAIzLNaS72d6xsi221KXkgjjHbRAIWzzIM6KOkdDFlQoxxY3jKX1mI7kxUyVwmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6941

On 18/07/2023 2:17 pm, Simon Gaiser wrote:
> Since it's limited to the hardware domain it should be safe and it's
> very useful to have access to this directly in dom0 when debugging power
> related things for example S0ix.

You need a SoB.

But, this is an area there things are subtly broken.  For package-scope
MSRs on single socket systems (which does include client systems), then
this happens to function.

It does not function for core-scoped MSRs, or at all in a multi-socket
system.  In such scenarios, dom0 can be rescheduled to a CPU in a
different scope while it thinks it is sampling a single scope.

This is one of the areas where dom0 and Xen end up fighting over the system.

I agree that we want some way for dom0 to get this information, but I'm
afraid it's not as simple as just permitting access to the MSRs like this.

~Andrew

