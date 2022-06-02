Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7CB53B626
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 11:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340990.566147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwhEi-0005AV-J4; Thu, 02 Jun 2022 09:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340990.566147; Thu, 02 Jun 2022 09:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwhEi-00057d-Fo; Thu, 02 Jun 2022 09:35:24 +0000
Received: by outflank-mailman (input) for mailman id 340990;
 Thu, 02 Jun 2022 09:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nn9h=WJ=citrix.com=prvs=1458da55d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nwhEg-00057W-PA
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 09:35:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50cbf915-e257-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 11:35:20 +0200 (CEST)
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jun 2022 05:35:17 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5712.namprd03.prod.outlook.com (2603:10b6:a03:2dd::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 09:35:15 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.015; Thu, 2 Jun 2022
 09:35:15 +0000
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
X-Inumbo-ID: 50cbf915-e257-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654162520;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Ot3xRBf4vJwPkna0YYEXw716xFNFqFIIxEaQR5vbs6M=;
  b=cJep1QPzMONDzHLRUyadP3wjhWWsH6QOwYA+lq0AG5+MudAn6GUwAd3D
   iEHnozfAstGHdzqqxsW/xgN+XB+gqdjMy7VBsyBaVlNT5jklg2kuYXdMf
   eDE20kF8/NBv3yRNvCyXVZPM2BTtLLwvhfthpTecjHS3L85Bo9O6DXpXY
   k=;
X-IronPort-RemoteIP: 104.47.58.175
X-IronPort-MID: 72695322
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ae3tCqooywHnTimQwDwRVioce1peBmJuZBIvgKrLsJaIsI4StFCzt
 garIBnQb/2JZ2ChfYt/a4nl9hsH6MCHnIJkQAU6rS01EXgXpJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvT4
 Yqq/6UzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBFaLiuaMCCwNjPiRELPZs16DKGGShiJnGp6HGWyOEL/RGKmgTZNRd0MAnRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFjHFp2Z0m8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrK//RmvjOJlmSd1pDLMev8SPisRf5M3UK3o
 GWc5V3aABEjYYn3JT2ttyjEavX0tSHxVZ8WFba43uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiGaNoxo0S9dWVeog52mwJrH85g+YAi0OSG5HYdl/7csuH2V1i
 xmOgs/jAiFpvPuNU3WB+7yIrDS0fy8IMWsFYixCRgwAizX+nLwOYtv0Zo4LOMaIYhfdQFkcH
 xjiQPACuogu
IronPort-HdrOrdr: A9a23:Ylrhkaxj5V2snVtm/9VqKrPxvuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvoRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIF/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF8nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvWOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1rop5PzuN5d3B+3Z
 W0Dk1ZrsAxciYoV9MMOA4ge7rBNoWfe2O7DIqtSW6XZ50vCjbql6PdxokTyaWDRKEopaFC6q
 gpFmko/1IPRw==
X-IronPort-AV: E=Sophos;i="5.91,270,1647316800"; 
   d="scan'208";a="72695322"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xengb/0ZL+Dz+xsO+KKuSv1066h/AW8ae0c1bl1cw86AiAmeuM618fA5GxNVbmXVjpvMnB2R74GNgIcfngTphBqD1hRIQhx8zGV2BT8ElNEeIO5v4lNibdO5ZuSCf/drl1qU5gNPBM1qyMjHKrQ5nzFW60YeUSRbCAbhxIro0O2PU+PJzj1KcHiKkht+IBcirmsl+ZsTn59HfgDa9cMg2Wm0/3skjTfdaZ67k1S+aQvJiXftjV+cs+sMNRD+39SdSVe1UHrhlfCUdOUmDmNO6YTmOsPBusATliLOjULW7kACCLRkDfHTuJ5LzY8fJgQJKW6B0yS68sNvaQ4KbFqLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nG2N9ig/MGr7QL3pa8iPLcL2fzuWvxlFjObLcXccWpA=;
 b=K8W8rk2gLQUpxPG63Ai6g62KvnMHTKTQ21hnfiKg+b3ePNPxa+ON0q2rUgNkDoMOnqjG2ELYtvMcOFY2+0R9TwSY4UkiXbuowzGe8/ZtMsEZ9Iev/fLEpl4rRkWH2qsM0d3saWg9k5lrgzWoU5B3Z1KTuppPhlBffn77MUiji1tE8uR4ahQJwA/aDChVwUOwENjH63zEWpmjGDqReXihoefdLd7GfeGehgrflR6hhwwGeUJI2VNfEtSK5mjzZNlzQ5sc1b/1NsQzTm0yiYffh4lcrnuxg9DkfXBFRJFNOvtvVOJwMWjzNSHoo5blcVq+gQMAb2RmFknnMfzeK0dG0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nG2N9ig/MGr7QL3pa8iPLcL2fzuWvxlFjObLcXccWpA=;
 b=FTbxgPehWXUirP5DVoDFtmPxQUiBUTYFwA7QrwTHqySlJeanPEfPELczp0OEi9lxkUrDrIfQ9ksCnvn11EopA8HcmkXzIBDgXdUuLNDyXd2dBUoeRtRj7YrFtp+iPpLY1BUApCqDfxFs1weCP+SGRdRn4H8mQvEXAj1xxGQUBfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 2 Jun 2022 11:35:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 12/15] VT-d: replace all-contiguous page tables by
 superpage mappings
Message-ID: <YpiETolItQ7FvcsG@Air-de-Roger>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <b3126189-2fec-ec14-7129-7897cde980a8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3126189-2fec-ec14-7129-7897cde980a8@suse.com>
X-ClientProxiedBy: LO4P123CA0323.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f8a8ae6-c5a7-4bc7-e50b-08da447b32a9
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5712:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB571221830638840622AD80CE8FDE9@SJ0PR03MB5712.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rk7hk8ON4of/RvVXv/0gGgoUqUdh85T+TZW2N0IELTEo2GPfuKCVYWBwDgUbpPc36wSKxZpts5tnfD5/npg+z6br9gybxMrdLgA64PMEjAKb8tu2/TOqNoOzD5f/HLfFLPysnAty4xhCpl2i3uK8gqFNgE0AbyBUVy1Hfk86oiNK3sHZ4fJsek7rD5LH3SMFT5DFF3jACw6vIjB8bDbtpTh9XY4KLAw+/5W3xPRtTw0EsyhR4zzaifxtXNO3eDhJehrYgv6XUtotVtnFITgdeGIZvtlm5KZL8FIWteakMJGfKrsuhCVQq/6uhZoekUZT14TP1s836rPeajYzp1bTOv1dFsGOLvU3REsDnrlT+rWXUzk3PJVXjH5Oc3izoOdkf2k9V5uW3MTNOjSc+iExSJO8UE+mVKkXN1Uq4YV5Tadzwlu5YVhVA5K7LCUQjJ0dIdQ4eWFwt3qkD06RFtXhgVaMJGPxcm1Vq4bCa+dv4PwYXYrgr4HtDyPUeeWafguCHgHyiIpcBgSRmTl/LJdldfKhUx3g6rZIAAp8tLoiy6VO/H0IZpTXCDUz6MrpfQubHttx7HHfi3k2R7Qqg21MRV0l6I+FAuPBxmKjrrrIMZiDf8V6hoJPhGMbXydpulQR4huTA8Uu6qMbRlZY0sIEPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66946007)(66556008)(4326008)(8676002)(82960400001)(6666004)(86362001)(508600001)(66476007)(6916009)(6486002)(54906003)(316002)(186003)(6512007)(9686003)(26005)(6506007)(38100700002)(2906002)(85182001)(8936002)(33716001)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzJqQzlFQWhqV1d1VXpqMnV6cExqdEhQNFdOVkcwZWxHR3RwdW1Ra3VPNFNu?=
 =?utf-8?B?dTVyOHVYVG1lS2pydUxlSm1naDhQTmxCR1VaMkgyMVRGTzd0MnlGenpQTnkv?=
 =?utf-8?B?bzcxYjRtYlJaZjhrZERRNHo3WXk0enlrNXh3c0t4dk90MTZGZTQ1TENCeVhM?=
 =?utf-8?B?ZjZJcXJTVlJ6Um41NXIxalQrRkJmNGEzQTd3bFp3cmhEWm1objFZSmxoWm1l?=
 =?utf-8?B?UUFDSXhhSXdCN1l4b0VqSzdtSlJaalVBb20zMEdsVWhWVG1pRVk3NUpIcGs5?=
 =?utf-8?B?dmdjMHRSNjZxc0FrbVFWTDNuYy8vNDJPdXRHdDMreTVoZXAzNWd2MWVVcEpz?=
 =?utf-8?B?MTlUR2Y3eWRvYlROclh5M0xxSm1wQmJ1ZTFYTkl6SldPWFF0MUZ2eGtOdFpz?=
 =?utf-8?B?K0FYQ1U5eFV6UU16clVQbTc3Z0FXN0dnbUhWVHVOTnltR2R0U2dsYlpzVnBQ?=
 =?utf-8?B?M21XSXNHTHFpS3pvUXFBUlYzSXJYUE5hNHlObDM3L0FKVGZRa2FrZjVlRWtQ?=
 =?utf-8?B?TWlyY3hoZm9lZGZPaW5wRHFVbmVJdG82U0JPZTg0WkFMN1NQT2ZqUENleGl3?=
 =?utf-8?B?SEhyT28xSDdHS0dzNXBYOTEvaW9PT3U0anZyWjd2SUdjK1NNYnA3T0dZSGVS?=
 =?utf-8?B?NldOWTNSWklhT2VVNFQweHcweXYxeERqTWw0UDlRbUNSSW8ySTBJUWQzYkcv?=
 =?utf-8?B?UTVJOFlUb0RSblhSclp1WjM4MXhDam9BbGlHdEVEUTVrbk9nKzFEcy9YbzJk?=
 =?utf-8?B?a0YyTWh1YlhXRzgrT3VWZ0tDbTdNTlQ5OTFrZkF1bmVKMEJxbm1WM1JzZTdt?=
 =?utf-8?B?N01FTDR3c3JwdzZMbVo5MjZyOGtjSXA5MWZmS3J5ZHhmZFVQVFJ4N3AyZW9y?=
 =?utf-8?B?N0JCVzlXTmRvVzJRQ0hGZGZFK21uZW5DVlRwSytyYUphZ0VzYkxaTnEwem41?=
 =?utf-8?B?T1g5by84TGJJQXM3dXo3US9sYjlXcnF5eFBhcTFVRWp3eldmd0FnMnpnVHd4?=
 =?utf-8?B?cGVXVU81VVhnaktiTE9BQSt2VERwbVN0ZnBkaGh4MFJXUjZDWkdPdTZ4QkhX?=
 =?utf-8?B?OUhmc0VpMzRORXBJcUFBMndickRwMjlZbHpicS84c29FVUJoNzdZVXZCcmVh?=
 =?utf-8?B?UzcwNWptemRhcUNVZTlJaWdwdUFWdzI0WENHMmExUWN4a2FTSUl0TitoaHZF?=
 =?utf-8?B?K0NkWUI5K09VL2tscHNTb0hMM0pacVhXQ3JXZUFDV2xUOWtHczdna1RZL0pG?=
 =?utf-8?B?OTBDaGxEbHBQYmxXNW0vOVpsbUp3SFRZb2Y1KytSRy9ORGliZ055WUZNMkJv?=
 =?utf-8?B?ZHVmcFlYRE1GWW9qamYyVi9TaUtPMGxtWGNhQnltWkxDYmpVRnRRamZiUS9J?=
 =?utf-8?B?WnZBMXJ1TVpCMWF3bksxQWd5dVBWdUI1QmtEQVp3MjMzUHJzVjVicVhrZG1J?=
 =?utf-8?B?VjdYR3lhOHhPbnozNDNaM2FBZlRkQlhKR1p1a2ZxNmQ2Y3p4OGJjcXN2SGV6?=
 =?utf-8?B?WVlqd0VmcW1uUGNXK1BKeFRKbjdtR1BwL1phQlV5WVd2SEFWRFEzRWg0Rnp5?=
 =?utf-8?B?eUJsSkdkU0ErOFBZdjdwd3dnN1BqYUlubEFiTEpzLzZ5WTBwVUdVS2g1S2Nh?=
 =?utf-8?B?MlNMa1lXWUZXTnExY2xZTldGekttdDJmMnlpRnFKdUNwSFZ3eEVqcHZ5UFlm?=
 =?utf-8?B?UlhhcWVyVVRSaUU1MzRsbWw0WGNueFM0Y0NlTDRPVStYRktSU29WcjJvVkw5?=
 =?utf-8?B?dVRVa3g5UkZ4OEhvT0lCUnNiaFJTNU5vMVFEUmNZcDhtTm9qWjVUWW00RXh2?=
 =?utf-8?B?Rk5HMWk1eEdpTitudGMrZytjQjZwaE5Nd3RnSlQ0YVFxSUtBdjFqbXRLZkh1?=
 =?utf-8?B?SFcxS2U1UWYvNUR3MGpObTc1ZldKQlRVMDVmaHVvdCtOYU5RL3Bzc1Z6TjFu?=
 =?utf-8?B?TENWVGZER0ZMUHB2RTRlQkQxYW9pWitybFRPZUFWRS84WWt2VWlPN1FwOXM2?=
 =?utf-8?B?dkRpWEg0aTU2QXZPWEJoYjBwOVFTRXVUdGNTTEphNmFyM1hIZktVL2JUUjFi?=
 =?utf-8?B?akJJM2xKNUFFN2lUQkNFQXM0WnB0YWNKUUJPR3lETFl2bW5CYlZjMDlVYXRS?=
 =?utf-8?B?SHlKeTFzYXpKUUtPZ3QvZXU0b2NFeTBQTWRLQXNNNWZvbVg0VWVMVzdDa0dV?=
 =?utf-8?B?WjlhMlJ0dWQyL1JPbk5mdkdoaWY4Rnhzam93TVpWVDNtaDR6Rm1TM2NTTWU4?=
 =?utf-8?B?Qko0bG1Ba1V0SnpMZjAxTDNDYjZFNkw3dFFWOE1lWkszbG45a2hjdER1aDMz?=
 =?utf-8?B?blNDb0dsYkE5MU9rYnNTY2FvS2ZFYTE5UGJ4ZE1KNUJpMERQNzl3M3E3dGN3?=
 =?utf-8?Q?Dj4HSZ7TlQAlidMM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8a8ae6-c5a7-4bc7-e50b-08da447b32a9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:35:15.0194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faU6Nny7mk9cNE+TeGZxVX9x/Nw1E8NrIv/BfQlKerC1Lw71d9+dTeLt+HmSvkDmM4M6zSy4dUBBDXMnNfQu5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5712

On Fri, May 27, 2022 at 01:19:55PM +0200, Jan Beulich wrote:
> When a page table ends up with all contiguous entries (including all
> identical attributes), it can be replaced by a superpage entry at the
> next higher level. The page table itself can then be scheduled for
> freeing.
> 
> The adjustment to LEVEL_MASK is merely to avoid leaving a latent trap
> for whenever we (and obviously hardware) start supporting 512G mappings.
> 
> Note that cache sync-ing is likely more strict than necessary. This is
> both to be on the safe side as well as to maintain the pattern of all
> updates of (potentially) live tables being accompanied by a flush (if so
> needed).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Unlike the freeing of all-empty page tables, this causes quite a bit of
> back and forth for PV domains, due to their mapping/unmapping of pages
> when they get converted to/from being page tables. It may therefore be
> worth considering to delay re-coalescing a little, to avoid doing so
> when the superpage would otherwise get split again pretty soon. But I
> think this would better be the subject of a separate change anyway.
> 
> Of course this could also be helped by more "aware" kernel side
> behavior: They could avoid immediately mapping freed page tables
> writable again, in anticipation of re-using that same page for another
> page table elsewhere.

Could we provide an option to select whether to use super-pages for
IOMMU, so that PV domains could keep the previous behavior?

Thanks, Roger.

