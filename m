Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30251756253
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 14:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564470.881909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLMyO-0001Gd-GM; Mon, 17 Jul 2023 12:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564470.881909; Mon, 17 Jul 2023 12:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLMyO-0001EW-Db; Mon, 17 Jul 2023 12:05:04 +0000
Received: by outflank-mailman (input) for mailman id 564470;
 Mon, 17 Jul 2023 12:05:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVQe=DD=citrix.com=prvs=555fa4c0e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLMyN-0001EQ-8l
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 12:05:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 265e2e79-249a-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 14:04:59 +0200 (CEST)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jul 2023 08:04:51 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO3PR03MB6805.namprd03.prod.outlook.com (2603:10b6:303:164::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 12:04:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 12:04:48 +0000
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
X-Inumbo-ID: 265e2e79-249a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689595499;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Yw2fT//jPo29Atg0bU+qyUqaCuA/pFQ8uIlHl1MHB4w=;
  b=RGi89E+ygk2/WNY4zz76f/80SMv7RCSRBpRJewPP19u5uc4D2aLi+ctv
   FauuBeZOyStBszR/tamGDmY/BvwFipa00+SlCsgmWkUY/uBHl4nV1otOq
   yKuEfySjVK5iQYD2YCM91K96Ha0k6Sctp317jd3GKNv7FbMjPV1SxMtaS
   M=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 119037680
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YMNQpqImzQFe3HZ5FE+R95QlxSXFcZb7ZxGr2PjKsXjdYENShjQGz
 mUcUGiDa63eNmamfNFwatu28x9V6JHRyddqTAplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QVhPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5OD2Bv+
 sQJEQkNdwyAuPK2xeu8RvFz05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGMl2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv117eUwn2rAOr+EpWg069m3kCUxVApIx9IdXG24vm320mXDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ul7Cmdx6yS5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pES0cLGtHaSpaSwIAuoDnuNtq0UmJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNXNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:vDZ29ayjNYMEy3tE8SSrKrPwKL1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSibfK8nnNHDD/6/4Y9Y
 oISdkYNDQoNykZsS8t2njcL+od
X-Talos-CUID: 9a23:uND07m0BihWUvMPISDsUp7xfI84kU3Ll3U7pI1akCll5SLjMTlOI5/Yx
X-Talos-MUID: 9a23:YMDoPQVTkbpJDcnq/CfJ1T08KcBr356FCh4tu5hFu8fVMgUlbg==
X-IronPort-AV: E=Sophos;i="6.01,211,1684814400"; 
   d="scan'208";a="119037680"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyBPczmtAVrK2GlXmwnk04h46A5TOppFKhTP5PBiINW3LZYTmfn3f30xp40jCQb4XZHi7vo8N1wANKPwFZRauY/lS76T7AsOqip1eumpby3jIAMillnchKQjYygCa8asi3EjV+pK6RYCololSBRDVnw1j6HTBzb0SN1ZaJbqE3PpQWLyPcBEQsP5bkx4Om5t/oviNJEbMWe+3rGO/MNgUFnkKoLXRjQ25u2P0j2QExKAfNpQ2HE/1MOTt6N5gBMr9cB7MI4ytnfBgqmffVOyckHnGUPlsJ0rtqA3gt6qBgjKWzxkWcchCGRn/7P4Mw2JJ2q87CRH5Q8ytYoS/Lg14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMI8lmCXzA0GS2WCI1Jd+uwIR0Mxm5ObKw2ug0sl1z8=;
 b=ZN2KLGl638k5hKpw99ai2VNW3gSe85Tr1s86q+C6FkWVPcN/+3RO2l/MrcN2mjb2QPqBtQuKUxg4uXjGqSEzJvp1npI0rjpjJXuapb4xeXRAY4BHxy8u+csDoGbxC62SO54TDN4rAj1/NIMfP6QKijqAX+cEL6F+jgZJRLGTwpMimiIPL2LfNnUgD93nY5Q/V+UgNZt/TxB795ljtak5xrsntGvYtf2+/OBGKtDb1hBahYDK5s9yyhGzA0NthGOxqZxxlzNBStYlmCYwxrwHTGUWSZJgpsnBfRGOn1da2hV9HVZ3xljwTuRcRA5gSt4u6AC98mBfrR1x14CM2EiFZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMI8lmCXzA0GS2WCI1Jd+uwIR0Mxm5ObKw2ug0sl1z8=;
 b=lOgC8hdBgtQx9J0vt53QFoX42Igy5xvQ5yjX2Uaps2vUq1UHAHRnpnn1Rt14tH1dfRsb/KCwTYhvlIwZIwqmfSmz1vkK71Yw6hOdNnnyOflJq6s7zBkZV895V57BMsSmGBSiQf2Y5Jk5+1lAr5SeKM6n8lN6WNg39xgUNnvI6RM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 17 Jul 2023 14:04:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the
 local APIC
Message-ID: <ZLUuWRUeGY29a-ML@MacBook-Air-de-Roger.local>
References: <ZK1S1V71ZUIPjKqZ@MacBook-Air-de-Roger.local>
 <eb2e3b57-a423-cf52-0192-a344db33a58f@suse.com>
 <ZK6wcpHnh5OgHv4R@MacBook-Air-de-Roger.local>
 <d84482f4-8be6-e514-58a7-a529890c8feb@suse.com>
 <ZK7JwEhrB-70nlla@MacBook-Air-de-Roger.local>
 <6d0ed712-0807-33b6-1586-a0588086c3a7@suse.com>
 <ZK_gHltq-1se3fau@MacBook-Air-de-Roger.local>
 <c2de675d-b4cd-1040-efa2-1b8b90448d90@suse.com>
 <ZLFyVugKWItJklcu@MacBook-Air-de-Roger.local>
 <2a2c1e47-767a-4029-bbc3-b809b0baaf75@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a2c1e47-767a-4029-bbc3-b809b0baaf75@suse.com>
X-ClientProxiedBy: LO2P265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::34) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO3PR03MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f62e6a-12f1-4cb7-ee96-08db86be04b6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JT15NSE2mzxGd9AYiocUDvL1RKFRdha38CS6XS03BWAUZlIH7y71v1zcN3g92AR6tzdq3ysNfBv4ra6I6dOIYeGJdoeJT6FCgW3PNDg43RyVzGNOcYQyoZ6iPV2EcMVtAxTR4vXoWaJnTBKcRjDnj4NhpETn8X6tySWfBNhTwcMdO/y5JkPxojtpwz/rat+WMOttlft2WA5Qsf2Qia6AorwhywMTooyEHpaKxBwDDT0MZa5O5/bYAtcBSz7BmjhqDBlANU4tsxLs0Ev28tXVqplxxZl0OF5O9boP/Kn6IRRRZUGjCQuZnmZXX8t/m6xI0CKCJ51OO3sQirvt4NpI/4mb402M8NlLLxXI6uPJSXbc3jo+yQTbFtUZ5rzCTuOPKdNAummnYkufgSmhwTrxZSu4KK7sOCfZ2SwWE/CHLznuE3bfc8OVvL6g1KkLp1MBHw+tkW4F4A27mZrzGEPQ5wKak66S9P9IiOc2QD1P0MKfbs9SvI10KNl3V3ikpP4B4dk9MChQNb70wR19qGcfyymPuYm52tgLNhSbkAJWrPAV4LDMA29Yy7DHFnm4cwSG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199021)(6486002)(6506007)(26005)(9686003)(53546011)(6512007)(85182001)(86362001)(38100700002)(186003)(82960400001)(8936002)(8676002)(2906002)(41300700001)(478600001)(5660300002)(4326008)(316002)(6916009)(66556008)(66476007)(66946007)(54906003)(66899021)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TS9XRDAvVkV0aXo1bWVHR055SDBaZGVrYXptcHhZUW9mMC9JTHNtb2JMVnNR?=
 =?utf-8?B?dkpWZW5hM0NyYUJVY0o1SnZ2VlNFYmZNaW1ZWm9pLzVGMFNXYjBGa2E2VllK?=
 =?utf-8?B?QTRoMS84OGpURkR1TVpiNllaeXRqV3VXMmtuWlo5U3p6cFdOMDRUakg3TXpp?=
 =?utf-8?B?YkY4YVB6ZXVVbjdzYmZxdlh4R2NxMHM5SUY5MFdxQjlPYnJ1OHI3QmhYQUpy?=
 =?utf-8?B?OTVpZktpUU9Rckh0TzhDTmU4MVZLUGtnS3pvLzVLb2FoWWZUMDdSMmQwdHhx?=
 =?utf-8?B?cUVra2hXemp3U2xWQXJsYlh1YXVpUWR4RG1xalVqajlsVDVDOXhUMG5oY3BN?=
 =?utf-8?B?RkE1WlBpM0xMVVlWS2FzclZlU1ZMcXE0bEEvNE9mNGpVWm9ibElsMmRtSnR3?=
 =?utf-8?B?Ry9UYXlWWlZIVWIxNUI2T3NMNGI1ZmRRN3BJNmdXZVozOEU4Mno2b21KenBx?=
 =?utf-8?B?UnpSS0tHWldmN1ZBY252bDJxZ01yeWhPZjU5NkVvTEM3bmJTcUhDUlVHc25h?=
 =?utf-8?B?VGpKYUxhd0VKSUthUVBhRldjeitMMGcxeXk2SGJWVFF0bWlmUkZqOFdGOUpl?=
 =?utf-8?B?NHlVeE1pNXc1c3RGdnAwRTVuM0hkSGM2YnZoS2dKQW0zZUdaOVpYa0dVOHc1?=
 =?utf-8?B?R0lqclcxL0ZqaDFtTllLb3dQVy9HTFlEeWpJNE8yUkNBM1VRWE5tNC9CaG56?=
 =?utf-8?B?bEcrR2xVMm5pdk9PNnFZcDAzNUZGYzdWRFVoUWwzVytsT210RlpsK0lPV0Iw?=
 =?utf-8?B?akluL2FQcnpLcGJKUFQ0QjlRRDY2bklsa2pIOWtmRFFFSTNTNWpVOGRJdzgx?=
 =?utf-8?B?Q2p4K0RtQUZJN05ibzBoaE82cEVIOTQ5bHZQT3ZUcVJySERJSW1uSW5BbTN3?=
 =?utf-8?B?Q0E0UktPQUk0VWpSS1N5dTR4OGZTcFM0dnRULy90N2hnQ1EyZUtBbWV5TElL?=
 =?utf-8?B?aGR6QXdnVlZmalA5Mk9XMFNiVmhlSFQrQVZ3YjRVWHFJODZrSG0xaDRXRi85?=
 =?utf-8?B?SHVNSG5uQ1VacEw2by9yZlhnMUJtUzRUZlNTVk9vWkxxZXd2RnkrNXdUWkZp?=
 =?utf-8?B?cHJkZndyaWJYOFJYYzdsZkhHTGVwS3pvUnkvOGdJSTVBZHRpZXk5K1M1eDVR?=
 =?utf-8?B?RXZ6VHlMZ2VCbTFpZjBWUXRDMjR2TWZEVVdoNkpFRHBLT01URldyeW4yZDFn?=
 =?utf-8?B?Tk9FNTdjUGtJamlrK3FRcU1HYVEycG5DUHNaMTVzd3dqUnR0YndzTlJtbFc2?=
 =?utf-8?B?QTZXdzhRWnlDMFNndk1SOXRteW9ZSkJTVUFQNlNBZFFCRHNqNFNTSm0zeGNT?=
 =?utf-8?B?RjBFZUd2Y2R3WCtiVXNrNTVXYm4xL21sK2x0Ykl3WmthRUJwK3ZHZUpqcmdl?=
 =?utf-8?B?OWZQRTdWYzFlSUZHYUFEU3laM3JCVUo3dGRpVks1UUFVeHEvZjBjTGhyWGg0?=
 =?utf-8?B?V0w4NWtSaGRORXF6S08rcm04clhuNk44ZWFKdUZYbERoSm9BOHY2dldzaTZ0?=
 =?utf-8?B?NnY5aytXdXJGd3g2aHJ0SjRSc1FjMi9qQ0kxaWJGaXF1QWUwN0F2ZFRTSHFU?=
 =?utf-8?B?MEdvMWgwQ0lLRVQ2dXYyQVd0S1VyYTZVMWFFMHhYSVRuRE9nTmFWMHFTYndl?=
 =?utf-8?B?TUlqdjlZdDBKUUoyaFlQUm1KWTZVcnZMQmM2YU5EMmJQSEUzQUxkQU1Ldm8z?=
 =?utf-8?B?b0grNDhEYnJQc1FBb0hiODNZSWZOdEt1dndXdlllMEZTME9VM0lqVGNuYS9i?=
 =?utf-8?B?TjBmUGo3ZGlEVFZNSEdmV3dHU1owSnhBNTlRTGJvQjJOV1FRMGhVZWhnYlF0?=
 =?utf-8?B?K0o1N3dvcUc2VWtwd09NMEVYZ2pyUVVBQkdpbldaRllLa0lHQmpiQkVOa0Yv?=
 =?utf-8?B?cGpZTldTMmlyZVArUlhGbnVVOE9KYkpZcEVqOFRyTUt1a0J1SEcxVm1aS1Av?=
 =?utf-8?B?QitSY0FkMXh0aDBHdXdtWVV6d0VSd05UaFg5cXZMbyt5Tm0rU21KMkpjcEtI?=
 =?utf-8?B?bmdjclVuNDVydndDa2JZMGhMOGZnd0lCemNxeURjUXdqbEh1VVpWT0JvWGdk?=
 =?utf-8?B?WmEwZXhFMFl3TlZmVWZrU3g3VjVxRXRWb2wvOXNqY3VhcDRxT1M3KzFySEJx?=
 =?utf-8?Q?RpqoG0usDeMlqFWseM8h0Log1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9EkVRXhD9eVVF2AAcqgeB4W4/zVaTDKDyaIzI2LmHkl7wDQKxmjzmeK5rrO/rFMngiQA0KYVHgKsFDF92heN8ViDMtV3+oN6PvDMp4aOovL4fGsh0GyWdfeFoT68OgnwZjShAzWvK0ASY+ggYphXXjNOLm5f0aACQh4bhNh3mAGl+xSP50s0HCy87yDEIcuFmn9bxqGzMMDRkXjq7BsKb/uaSp8oGQ22/42UeriSI2barL3qR6GMt12NgH84nr3q7BTr2/UCpBNjf72NrowiaukYZ1Rx8+NT86DH0zOKVF/DukCR1ZRqUDt10fuudM3BmCpOFveyCiMiOL9+aQMV0Um5gfc333p3pyOE7UXb46MAjG+iT3ikqFi8X8WrJt02yXxdf0zCAKkkqoPXjudEe8c3Co9SBpdFNeigDwv2Seo9wZxl9/qlQt38W3OwIyX15QYfZrD+7BysJdd8NJ97IrR7Q3vmVz4Jl0Jw8g2D6eJnvDD0sUkKi5NuLg/HL+YWgV6EzjdbvEB6/SWpFoOxpU9zl7edDp8f/YzXaRs1p6AeTDv2r+5Y8BQ5xJcAbt+ZW8DALkfhhTUnei2NlMeodm04I6+8HJcHbZ8uGGOwbVrrceIOQVTzim/iBv87l11w31vr0G4a7jQGqpib3Vxzq/zCjUmZBQlq69sprHXCg5F11a+yhY9L6JVrKuwYVN+CDIskUkYLjvg/GEGRmnurSV1oP/UYLeGFTLqqhpdd6pnifhvrcf23BCIVCu52M4gXb+QadiPUvHe61pWEr3WceLoMgc/oS7al5ocKfDYhHXM2ngYq64zRKt+epl6DD8S7BLWxsNsCUfvhfAJ30MRI+Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f62e6a-12f1-4cb7-ee96-08db86be04b6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 12:04:48.7258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E703fqXgHQmHKBuP4/VbRgON3pR4e4Uie+MzlfR7l6hMzWIZVzgPYR1Hj+hEbYqp+eJyhDjM/GDnWaRf402R0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6805

On Mon, Jul 17, 2023 at 08:40:05AM +0200, Jan Beulich wrote:
> On 14.07.2023 18:05, Roger Pau Monné wrote:
> > On Thu, Jul 13, 2023 at 02:18:29PM +0200, Jan Beulich wrote:
> >> On 13.07.2023 13:29, Roger Pau Monné wrote:
> >>> So to recap, I think we are in agreement that calling enable_IO_APIC()
> >>> just ahead of the call to setup_local_APIC() is the preferred
> >>> solution?
> >>
> >> Well, yes and no. My preferred course of action for the issue at hand
> >> would be to convert RTE 0 to ExtInt (under the mentioned set of
> >> conditions). I agree though that we also want to move the masking of
> >> RTEs, and for that I further agree with the placement mentioned above.
> > 
> > So I hacked up a change to set pin 0 to ExtINT mode (and avoid doing
> > the masking early), and I got:
> > 
> > (XEN) spurious 8259A interrupt: IRQ7.
> > 
> > This was a single interrupt, but still I think the masking is the
> > critical part to get backported.
> 
> One way to look at it, yes. My perspective is different though: If
> there truly is a (spurious or not) IRQ at the 8259, then it needs
> dealing with sooner or later (in the process of booting). Aiui if
> we masked pin 0 initially and then later unmasked it (after
> switching to ExtInt, if not set so by firmware), we'd still see a
> spurious IRQ7.

Hm, I see.  I'm not very familiar with 8259, I was expecting that
maybe we would mask the IRQ before getting such spurious injection,
but I'm not even sure that's possible or whether it would work.

Thanks, Roger.

