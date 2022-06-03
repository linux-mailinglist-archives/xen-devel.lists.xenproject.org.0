Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CE953CBED
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 17:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341601.566846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx8np-0007te-MK; Fri, 03 Jun 2022 15:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341601.566846; Fri, 03 Jun 2022 15:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx8np-0007r8-Iq; Fri, 03 Jun 2022 15:01:29 +0000
Received: by outflank-mailman (input) for mailman id 341601;
 Fri, 03 Jun 2022 15:01:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DOPF=WK=citrix.com=prvs=146533d13=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nx8no-0007r2-3g
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 15:01:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 098c8316-e34e-11ec-837f-e5687231ffcc;
 Fri, 03 Jun 2022 17:01:26 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Jun 2022 11:01:24 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB5325.namprd03.prod.outlook.com (2603:10b6:208:1e4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Fri, 3 Jun
 2022 15:01:22 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 15:01:22 +0000
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
X-Inumbo-ID: 098c8316-e34e-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654268486;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=j1AkPfPtCKGgbnd7VZ5K7F3GvnADsPaF8IEAUDYxpKE=;
  b=bvSCsnXsVvDjDy+qnlHceyTATfIN8UgfFvNwpSHF53j1FF2FLlvjwk4j
   xxclTicaiLweOugc4JNW271xiWnc2y2JWT6wGKJKSn6XwUhbBE9CpWcte
   /b6xGZMcO+UFAgFhCa1kFxtOPix7nAUN+qv6tLDuQnTWp0LJcAiRL1+hs
   E=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 75353324
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QYl8x6uf8Dojx7xIblpnwxk5GufnVCJfMUV32f8akzHdYApBsoF/q
 tZmKTvSOP+IZzenKdh+O4yw8EMCvZ+GyIBiGQQ++ShmHyIV+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW13V4
 ouoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8UJPLIt9tMWSNSCgFbNqNZ8pj9IWmw5Jn7I03uKxMAwt1IJWRvZcgy3LkyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4AAmm5o36iiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3I/vdsuDKPpOB3+OC2YIr1UeebfOkLu3uo4
 WXG8mG6DR5PYbRzzhLAqBpAnNTnnyn2RYYTH72Q7eNxjRuYwWl7IAISfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUHBBqlz6PV50OTADcCRzsYMNg+7pZuHHoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd17UZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:5seDQKCYixXp9K3lHegwsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80lKQFmLX5WI3PYOCIgguVxe1ZnOjfKnjbalbDH41mpN
 tdmspFebrN5DFB5K6VgTVQUexQpuVvmJrY+Ns2pE0dKT2CBZsQjTuQXW2gYzdLrUR9dOwEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfbHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+0+VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qZ5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 529lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ5o+a87bWzHAb0cYa
 hT5Jm23ocXTbraVQGSgoBX+q3iYpxpdS32AXTruaSuokprdT5CvgklLfck7wk9HaIGOuZ5Dt
 v/Q9VVfZF1P7srhPFGdZA8qfXeMB28fTv8dESvHH/AKIYrf1rwlr+f2sRH2AjtQu1C8KcP
X-IronPort-AV: E=Sophos;i="5.91,274,1647316800"; 
   d="scan'208";a="75353324"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jguwvDVCpD99ePf2yWin6Yr8Xa+XXiUgLrk+u+oodzg9Y3ae1KIs54JqHshIDV/p4pkjTXZ+QAvNnyaYu5JTNvzq1HOMfLZvfGjO/nDtSTyF7uNLn3GBtoXTV8B01cFdVwtpYblz1SPhG3mMHRedHGDfi0nMOCB0FRnj+lbGHwFWa15usQ8pCd1Z/ElPwt/onbhqOtmdV+d2+y3JlpnLJhJ9TUIHl11xUns+U40kJPOjaq4Eik7Y00rzw6i281Tyt/YwIgUiFoIGP/ARpy7YLlfOn9WOCr879BIRDoLzqxmnxmxsApp3jStQZcA0Al7+XVPlUjzKbnNEEWVdcSkEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jweHrj49xWVULGG2jMQ0CzOE1DRKXh3yACBN7lOJSMw=;
 b=goo5PETcFOrl2fFEdP/QXYLF9vSxz4/TjFU8mwE40xnchf+iwIQgH1fBobIBxD36Xy74qeMXxx5MJymuEVSrMggIWg1gs+rV6n0XWyQ+pOSX+VjrqbMQUrnEYEiXHdirRSOdgy2GMXkMTgKWtO8dh7i8aR8Daf06GKugj2oK11SKN/EP9+U5n6v5MuYEpm/74dRJKbsBeWKdCvNQdc8h1xK3IKQ8/zI99Q04NHBrVBOXlG9Dbn7b/NbGLGj8z8TYgzCQ4IsIzVOAOJ5+VA4oDRJyZkSm4IsSuV0NjhkzgGm9gMFnLDY8jv6AFacQsaUDy5jUd5oblHXs0qy0nOHb+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jweHrj49xWVULGG2jMQ0CzOE1DRKXh3yACBN7lOJSMw=;
 b=H3SAo1J+AyM4zQfuG8Io7YRG0+XfOfnHB7Kn9vZVWvlAP/U941ju4KfKd5JwEDdxcZahjXhVOpSMa/oIUV/75hqydJaoKg6UhQfrKdhPFOfyF3sRU/itHG9Isvppw3w3xCRqvv5Fu0YgQtygAzI26mu/eupzlZssbc8vDxg25dA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 3 Jun 2022 17:01:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC 3/6] x86/ioapic: RTE modifications must use
 ioapic_write_entry
Message-ID: <YpoiPRETkjBskr1d@Air-de-Roger>
References: <20220421132114.35118-1-roger.pau@citrix.com>
 <20220421132114.35118-4-roger.pau@citrix.com>
 <febbff78-6a2d-f2fb-d8ea-a15f97a3abf4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <febbff78-6a2d-f2fb-d8ea-a15f97a3abf4@suse.com>
X-ClientProxiedBy: LO2P265CA0298.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f68bcb09-0066-42ac-f5fa-08da4571ebea
X-MS-TrafficTypeDiagnostic: MN2PR03MB5325:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB53254C4A651DC1EECE40AF358FA19@MN2PR03MB5325.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wiUUTC1KOlz1rBrpdCw/OzLnqa4B1lLsCRwYZwaRmOUtuUVGhzKDtGf/5Sr2KEBG6kWtmQzG57sDjNbFesdQ3tVy252gNDwphgnooq4yR3S2IUjXcYGfD9CnV0i2OB90aYo+JOV30kXWuotqg+DZK2fOEZ4P6clR0QzrTjBgUDSqOoigZXzPAFWEQNKANrmoumpt8a23mqDJqXO3HfysrYtveiB1zTq+3heUJt7FaxoE6UNNeVWyqeQSgm5bN6K9zVRSh/U3jI5MDwXoeopQq1Y/2lbOYSQuc5Tf9w76QDShtntZA8aFF6/m4QaPtyh77kTByexMjp4qflq3k5zjKjWw0yoZ9A/YqHuC/6sQAYilzyt82VK5VtW/MtC7T9o02I/fLwODqnsppnPhzXUveOWUgzEXzplb39b7uM5fIAu+NPO7DwfFsO6pMt6G1uHpUCIUH7vXzj50QuhiUBy4dcaoZtZEyPBJgiEtltdrde578hN1BI8pqpIXNJsrH4rYw5RP0aYRj0uLqjJsdBWF4wConWsZvAnAXH6qI5dq4/DDztoDg9LD/441NQKJ1aMIPiyFqvkKSsHlx5cLIalF3zLIOOV9Pgq6Q9zM6z0PLZAPLb9pwVfZekr5Z2loy+7WSdNzWWNR7uAGLDJbwPYEoQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(33716001)(85182001)(316002)(6916009)(54906003)(82960400001)(38100700002)(186003)(26005)(2906002)(83380400001)(4326008)(6486002)(66476007)(8676002)(66946007)(66556008)(8936002)(5660300002)(508600001)(6512007)(9686003)(6666004)(86362001)(6506007)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFl0VC94QmxhOUFQOWlIZm1VK2xDdVdnN3ZsTVF3eGJTSGY4Mno2ZEFpWmoy?=
 =?utf-8?B?NVpydGV6MThLbTBweGFZVEFQUThlSUhJZ0dvYkQzOTNjSjhFZCsvUlZpbHYv?=
 =?utf-8?B?MHZScDhPVy95SXRtZG5uV2tvNzB3L0tiWVFJeWlvQm0zNEM3Y2oyVFE4NHcz?=
 =?utf-8?B?ME9meGd5czV5ZWhLbWl1aFpxcmYzUkdZaExzdzlEMEx0YjczVitkV1J0bS92?=
 =?utf-8?B?VDdzUmpsLzRtM2Q1MU9jUmExZEFPaEdhb1M4VVdjdWNkOGcvRDRRa1ROVDBR?=
 =?utf-8?B?aEx4eWNZTis5K2FLc3g1YXZOcFgrenpIOTViRWdhai9LWGlPK2JwZWpZckYv?=
 =?utf-8?B?cUtaSTQrQ21Rc0dxNG1LblFjVnB1VmpGUXo1T0ZacmFmejhSQjl3cHdRenRl?=
 =?utf-8?B?a3lDSFBKU2JCUlVod0JKaHdrMHlnVWpmS0YwTEo1ZU1XSjZtTXQ0VTJNa3Qy?=
 =?utf-8?B?aUh3Z3FVSkVHK0I5VzZWMHg5OHkzdTRyUG5nMHk5RHZ4TDByODM5c0tCZkJH?=
 =?utf-8?B?dy9zZUlNWEVMRGlRaTN3aXNRMW15aUNKOXNEa3o1WUFTeVZtV1hOelloS0w2?=
 =?utf-8?B?ci8vL1ZLdUxTQlNtNi9xSHdCQXFUbURSRzd4dGJGY3RGN3Y5OGVwcVdwYjIv?=
 =?utf-8?B?U3A2VzdDdkJMOVpqWTZJNW5MZ3FrWFNMVlBBbUNnamZ1QnIyTnhnK0Rna3FW?=
 =?utf-8?B?c2FPR2FoT2dIaVl3MjRMd01DMVo1OVg4V1V1ZG9DZjdYY1FjbEpHZTZ6MTNN?=
 =?utf-8?B?NHZCZWVnK2JHeVZvTGM3VzRBWHIvcGVtOHk4N1BwaFYxNGQ0eE1GK1Ficndj?=
 =?utf-8?B?OTYyeTZuMVByd2ROak9DUlNiSkVHNUdvcFB6b3dwZ3NUcHNzeFYydjRaRkxs?=
 =?utf-8?B?cUdqRVFydFNPMTFsNWpKMVYrN251am0xa2J2MVoyWk1YdTZ6cEFqUEdHRm81?=
 =?utf-8?B?R29hMFcvNk84OWVDdldwMWNYai9IS2gwa2FiRWkyZ0dSTUtPWGk2Mk42Ykd2?=
 =?utf-8?B?TUNTMUMzR0lIMnZWd3ZqeXRoak5OUzJrR2hnUE85aFdMVEVsRzB2L2JldkJI?=
 =?utf-8?B?V3hRc1NrUHk3UWZUUnhSUVdLcDdzaDJ1MVhvREM5QjloT3ZZUXVSRGRMVUpr?=
 =?utf-8?B?eVlXWGJac1JCYzFVZzJ1c0xGQkV1SFdMVGtPMHc1TUtFbEhtT0tmVTJ6N3JN?=
 =?utf-8?B?UjJBS2JrUzNTdCtOTGk5V0RwSkYxd0NncEt3OHc2REFKblhWUnZpQTFheUNU?=
 =?utf-8?B?N0ZtVUFKeGh1cFYyWEE1Q0JOM0MxdUtrN2hlZXZrT2VrZmNHb2V2S2dLSU5z?=
 =?utf-8?B?eGJldXNlK2I2blh0NUJTMGtIeFU2WnBNV0JHWjJOY3A2SDFZeXZZWURjdHBB?=
 =?utf-8?B?K3lpOXBzRmFPWllpMmtIdGc4ZnlISEN6QjltMnBUN1pLc0FFUmtncStCdlYv?=
 =?utf-8?B?cUw2c1RhYk14MWw0OWQ1Rmp1ZVY0QkVQQlNyREp5eTFVSDl5amdZZllKZGRs?=
 =?utf-8?B?VzRGV20xQ1BjN0krakdyN3drWENLeEZxWUYxRWtpTUx6RkFxM1pjVC8rL0ZC?=
 =?utf-8?B?V2p3a2ZqTEcwZmhpK3lsOUJSTzZ2SjBSRlFBemxVbDFwQ01kSXJsTEd3RDFT?=
 =?utf-8?B?M0QrZEh1dHVwckd5NVhFV1hsM0lBdGtSZk4rNWFNekJUTnFvMEpyNzNFNDU0?=
 =?utf-8?B?TjR0Z2xlVEMvZkFNNFhkbXdXYjBXZ2xTaGF2NUxMdDVxVk9YRGg3TWxLWHFM?=
 =?utf-8?B?V2ZISDNaRE9QRkNTQUVuZHJZODZGdmt0UVA5bEdNK3FsYld1U2Fkd2VxcW5Z?=
 =?utf-8?B?WGtUbkpLK1ZhN2p1OHBIbmtrM3ZDekFjSGtWNG9jUEYyeWFXVlRoaXJnZUZU?=
 =?utf-8?B?bTBpcTNsMFE2a3Y2enFJNWdoa0pnQXppYlNBTVNVRHR1YzhDdzd3TjI0b1JN?=
 =?utf-8?B?RnlseHBBNEhKOEd6OTAwMG01T2JZR3IreTlUSlFNcDlPNnVwRnhYRGlaK0lO?=
 =?utf-8?B?WEFob3p1OS9qcnJrVy9seXNqMTA2dU44bUxCemVmZmF4NC9nNXNDRlZSaFo0?=
 =?utf-8?B?M3FhS3lpcDRRQnFBMDJUZkNOSzBxR1hKRUgvdUN1QlBBQmhyUENQVmRQdE9m?=
 =?utf-8?B?cWVFRjBCWXdpKytBZ1FLM0JzRGZOVHBJSVRNdy9pazRXZHEzNng0Y2lrOVU5?=
 =?utf-8?B?S2dJRlFPRXp1a0xCTXVvRndpeHM4aDJaUFV5cy9ZekkwZVBJL1IxUUxkRkpy?=
 =?utf-8?B?eUZMZTFLVmxVUDlmd0RJNDZadVNQL3pPVFQvbFVaZXRYTllQZldiRkM1WXRn?=
 =?utf-8?B?MjVGdVBNTE9Dd0wxa3hOVlpCL1JGMXFzZnNQNDVHa0xJdmFTM25yNk02bHdW?=
 =?utf-8?Q?PZW0gyDyJ26Y8Hiw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68bcb09-0066-42ac-f5fa-08da4571ebea
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 15:01:22.0042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4g2a92nwpq/8PDpkaEc55cxghCCyYdStwf7JmTGcZ8oDvVgNRbRU7c87YkwCErI81y55cjyarInxqqeSIV7OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5325

On Fri, Jun 03, 2022 at 03:34:33PM +0200, Jan Beulich wrote:
> On 21.04.2022 15:21, Roger Pau Monne wrote:
> > Do not allow to write to RTE registers using io_apic_write and instead
> > require changes to RTE to be performed using ioapic_write_entry.
> 
> Hmm, this doubles the number of MMIO access in affected code fragments.

But it does allow to simplify the IOMMU side quite a lot by no longer
having to update the IRTE using two different calls.  I'm quite sure
it saves quite some accesses to the IOMMU RTE in the following
patches.

> > --- a/xen/arch/x86/include/asm/io_apic.h
> > +++ b/xen/arch/x86/include/asm/io_apic.h
> > @@ -161,22 +161,11 @@ static inline void __io_apic_write(unsigned int apic, unsigned int reg, unsigned
> >  
> >  static inline void io_apic_write(unsigned int apic, unsigned int reg, unsigned int value)
> >  {
> > -    if ( ioapic_reg_remapped(reg) )
> > -        return iommu_update_ire_from_apic(apic, reg, value);
> > +    /* RTE writes must use ioapic_write_entry. */
> > +    BUG_ON(reg >= 0x10);
> >      __io_apic_write(apic, reg, value);
> >  }
> >  
> > -/*
> > - * Re-write a value: to be used for read-modify-write
> > - * cycles where the read already set up the index register.
> > - */
> > -static inline void io_apic_modify(unsigned int apic, unsigned int reg, unsigned int value)
> > -{
> > -    if ( ioapic_reg_remapped(reg) )
> > -        return iommu_update_ire_from_apic(apic, reg, value);
> > -    *(IO_APIC_BASE(apic) + 4) = value;
> > -}
> 
> While the last caller goes away, I don't think this strictly needs to
> be dropped (but could just gain a BUG_ON() like you do a few lines up)?

Hm, could do, but it won't be suitable to be used to modify RTEs
anymore, and given that was it's only usage I didn't see much value
for leaving it around.

Thanks, Roger.

