Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA246D5F4E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 13:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517836.803723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjf2Z-0005pv-Ey; Tue, 04 Apr 2023 11:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517836.803723; Tue, 04 Apr 2023 11:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjf2Z-0005nz-AX; Tue, 04 Apr 2023 11:41:31 +0000
Received: by outflank-mailman (input) for mailman id 517836;
 Tue, 04 Apr 2023 11:41:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b6be=73=citrix.com=prvs=4510202f8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjf2X-0005nt-4E
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 11:41:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f7f29a8-d2dd-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 13:41:24 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 07:41:18 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5247.namprd03.prod.outlook.com (2603:10b6:208:19f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 11:41:16 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Tue, 4 Apr 2023
 11:41:15 +0000
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
X-Inumbo-ID: 9f7f29a8-d2dd-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680608484;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Z59NWup1eQF6ib+PLgar8cI684KTkUwJrqiiGycw+Pc=;
  b=GDvwjNXyFmFJ6mJpTClHcLZW718vNMCM/oqdm0dZVlHqyLxKj55HR7ND
   Ar/PpVX+WdfdEhCucsSjnjhIa9LHSkGgugM0uzz5fGLzZi21hwk3dhSDI
   j/YkPldIR3IK5txbbH9xRuuChvjKyzLqY//SLuFyGrvJbEL19bd086umk
   A=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 103050501
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:y4RQHKJgPhJmM7mkFE+R95QlxSXFcZb7ZxGr2PjKsXjdYENSg2RVz
 DdOUT2GOa7eZ2L3KNwlO9i3/UwDvJSDm9BjQVZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA4gRiPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5IImh0z
 NJGFgohME7a3PCa/OPieu9z05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGMlWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03beSxX6jAer+EpW4qvp2m0+/21ciJxwcVUaLkb6wlX+HDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8kN+pES0cLGtHaSpaSwIAuoDnuNtq0UuJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:gQ5mNq8Q1aYoegUPY11uk+Fbdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQkdcKO7SdK9qBLnhNZICOwqUYtKMzOW3FdAQLsC0WKm+UyYJ8SczJ8X6U
 4DSdkYNDSYNzET4qjHCUuDYrAdKbK8gcOVbJLlvhJQpHZRGsNdBmlCajqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOqXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6R64aT1eUYpDLS8KoDOCW+sLlUFtwqsHfqWG1VYczNgNnympDs1L9lqq
 iIn/5qBbUP15qYRBDInTLdny3t1ysv7Xj5oGXo+0cL5/aJDg7SQvAx+r5xY1/X7VEts8p717
 8O12WFt4BPBReFhyjl4cPUPisa4XZcjEBS5NL7tUYvJbc2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcF0gbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xN/efGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzvekPcV
 T6ISBlXEIJCjLT4Je1reN2Gzj2MRSAYQg=
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="103050501"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZC03thCXRgw54az2y05hx8DexSyGUvMa9mH7mgU5GD5pMa9WSAH5QD7eXUzhXLAu42AhVp6dOfvCqZjjUz3TEAjFrSrmsZ8QBx6chYyjj+704kZXWACEFS30nb7s9dLg1QEnUpnDUHkcuawqC7Fq+RGUjdqmH9ge+ENNk6nnM8RM74DvD3qUN9KP7GsFIdHx6j3knDVJKWsdAdHK/yJx0BPiMh6IIkP1rDcN3SOM/ODnNQy+ielhcpXWp3r4rdPLY9s2kSo7tJTYGuoh/6jW/fkmcojD0e3ctCaFtArqbRBdOGsx6e9ZZ9L1ukog3mv3yzasPlT2Apibq3t+CKASQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvN/doML6DAbPVu6JvfmZv122kJ+JIPSdwlwdDpfzbY=;
 b=M83JZd9I95AlpR5Fu+1nMf9H85bxtQSejGxqA52iygrwmCWp4Hy7SMkN/cYaz/IIk6XRxCrzyobgabpdhm8AFX6RQhpgkJp0iZD6NQesAA6qEsjlkMoV6tbS0mSDy6GFd3NxfaM1et/KIk4G+j0bsSiWx/iMRBj2AvGhWUCecphynh7LBZmK4U2oTgArpNyzBbNuMd0R7s4Lr8FwdqrGBQjkOIMM0fVHhzepeUhdOM1WWkK8ursXUjXkPe//zwH/M6AwtMWBR9ROSHQxiYipkBr+w4eJdQb7bmfGd7NcqaC6d9YSsFqUHwDmUuafjS/XYCcqU8XYMIVVQl4uY49E6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvN/doML6DAbPVu6JvfmZv122kJ+JIPSdwlwdDpfzbY=;
 b=mFCXZv7rqiuiC3swS/1monEZnzTlJKpo9QUuHAO/lQHbhI15mS3uON1zNIk4G65Yfh0+aH5LzPKSpcEQip9/nKO8o9oNpAubDI3kMz8Q9j7VMqwUX9LegoGDgg9Tzb6BXcxXAcdxTZc8A8H0oyj2L/tjYfeivRfUxkTGIdOdzi8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Apr 2023 13:41:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Message-ID: <ZCwM1SfCAfh2koBD@Air-de-Roger>
References: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
 <ZCv3+cpzJ52Y679G@Air-de-Roger>
 <3752672b-f4a0-5ffb-9759-dd315ce31079@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3752672b-f4a0-5ffb-9759-dd315ce31079@suse.com>
X-ClientProxiedBy: LO4P265CA0240.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5247:EE_
X-MS-Office365-Filtering-Correlation-Id: 8068abbe-50bd-40d5-b06b-08db35017f97
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	858fYNEfiy97ZGDd4P+a5DfygRFDmLshKtppaA93nOi970XsU6APLuXXvbEUY7h0vHddFMfPkzou0dk0oXK50KhM2sMl/L/qYDSdcjbEkTOI68kfeo86Q4y/4omBymJZGhtOh0EjKtQWxb9xP4QoMbubz/J1617zu7rNuVf6jNk0iMJqtR+spHZqgKOEfHlmdNyx1b9YB4CnCSFAbNXL/FfTyN9v4YGGkkmSszZ0Xhz/1NtHRgMraVq4cWA6VjJfbZ1gRtWcJEvJvFTKN2/OuM5Y3sWh3iCv1yUIB9i2Jyja/7ivoMfmD48u2en2Rr5AF1XbQaC4zMtar+oJpn7qbXUqotm0R/34azoEeZi+U4O6JmZwYGJKzwO7gyPi3rQsXlUUjIt3lyzlvr4V9uOSBsyDOWWYjZ2tWyefnWtrPn0DxV28rxQPdPaEMDEiA8K/Kne4PXkCnQSX4clUkVliDwFp1JQ+WR+vs3iGXiUYmHG3ekcAJwCpdumhzNsYc+VKfoVixwVNXdUP+FRVXcbA8XSx6zuZNX74o85hjmUDRpw4JI/U4V/qNIsA4P3BRJK7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199021)(4326008)(66476007)(66556008)(66946007)(8676002)(54906003)(5660300002)(316002)(6916009)(8936002)(478600001)(82960400001)(41300700001)(38100700002)(186003)(53546011)(83380400001)(6486002)(6666004)(9686003)(6512007)(26005)(6506007)(86362001)(85182001)(33716001)(2906002)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1FkUWY0MW1iWGpxeUI4OXVhRGhKUTkrdURsWnd2ZjNlU2pQbS9YSHVad21x?=
 =?utf-8?B?WS8zdVMydUVwNmNKMlpIRUF0QXJVMG9wTlBEM2oxKys1a3VaejVROVErNzRX?=
 =?utf-8?B?dmxEVzR2Zys1SjhwUEtJSCs2V2c0MkdtZ1NJTFFQT0Y2TENsTlUvbHpzOTNw?=
 =?utf-8?B?U0VUdXRBTFZLVjFDNjUxMU1HVW9uQVBwMnhCZkl0U0xNVkdwRXZ0eTFLcVVH?=
 =?utf-8?B?NFJMSWU2NzJTbmFCcmdUWGVxV0s3S0JuSWhnaTNyVkk3OHlCNDM2ckZ3MEFS?=
 =?utf-8?B?VTJGOU4xU2tOcVpEaW5EcCs0OHRlV0ZRQ0RESmZQVENoS2ZkYmZkYXcvRjBv?=
 =?utf-8?B?Y0x5ZFBFOFVPUDIrV0o4aW5oaHhZb1dwQUtZQ0ZpR2VwNjJiSXJQMm03UEhU?=
 =?utf-8?B?a3JzYnlFa2dPNnhyZXFJUTF6aUtCYU9GYVdHdTd3MWw5d0YvTjdPdW11Nng1?=
 =?utf-8?B?VzROV3hTeW5VZmJRNVgyc2wyK2pJaCtEdUg2NVVzTkVLM1d0a240Lys5T1lK?=
 =?utf-8?B?cDF0cC9LWjdndStPNEhHV1NYN3ZBRy9jTlBNSEdTSmwzMjh4M09ya2orM2lX?=
 =?utf-8?B?di82cHVUWWJTeFpBOVhMRjBDZFFSbko5Ti9oR3lVdjFEVlBBVFJZdVU3aXYy?=
 =?utf-8?B?cC8rWGVCRTZ6S083b0pKUHIzVnRDKzBnSFhiYkpxZWs1Ykh0aGU2SWw4cXhJ?=
 =?utf-8?B?OW4zTDQxb1RDUld3OGsyekFzblVMSDg5THd4T2h3U1VZRGVVeUJobmFxUkRS?=
 =?utf-8?B?em0rdThRVjV0cU9td0JRNzgrS29meEVrRjBEblhlUGdmbElleEl4WmJNbXFo?=
 =?utf-8?B?SU1xRHBQZmxxZmk3cnZHdm95VS9qSW1XTGx2aU9BWjBvNlFLVThibUU5Y1Zm?=
 =?utf-8?B?NmpOL1QvWitldTdLenFpcE85YTl0U1VvWE83MXhtZVFqZzQ3LzlWWGoya2Fk?=
 =?utf-8?B?SlJmYkRsaG9IdDliMWdnUW9IZWpkNG04WHVNNlRQWU91c01neFdkMUFSS1pJ?=
 =?utf-8?B?V2pEUWJkb25JWjY2ZU9FNm9wUW5TcG1ndGdzd3krcHd0d0hVSjByRFZNbmZa?=
 =?utf-8?B?NWlsWGp3MVl5b0xvNm55eW9GSVc3SkQxSC9RMXBUeS9wZTdKZDh3Y3pNcFFS?=
 =?utf-8?B?eml1OG4rQ0hacjRwU1hWcVhwOXpnZUh2VWZGL2xSTDYvamhna0QzTnkyN3d6?=
 =?utf-8?B?YXB6VVlTUUJWVk1UVzdvSHBBWWpjWWtjeHRSUFhtdEpWU0RxNkN2cGFXQ0hv?=
 =?utf-8?B?alFKdHNFU0cwc0xUVDU2dFh5cEh1d0NZazhXRktlUmhLMk1QallZNTF5K3NF?=
 =?utf-8?B?MFY5OVNnL1dSWFFjeldXV3p5aHVyUFJkSWJGNUYxUmxITVZiNUJTdHJmQlh1?=
 =?utf-8?B?NkVrbTNzYU9PRm9BaVJSS0Yva0Q3NDVOZVo1dGYzbGhsYm1hN2FWdWpmS3hq?=
 =?utf-8?B?MFNiZ0JnNWxkYlVRUW5DcGdLa0JMOXhsS2o2TS9iTlZsKy95akh1UjFidmpH?=
 =?utf-8?B?dEFPaFVBdDRCSDRHbGtRNWRFQ29aeFZhbWYrWkEraUtwNm9BSnk4K0pLRERD?=
 =?utf-8?B?c2FVYzFBT3crVUxkUXNEKzRxbSsvYzg1OGZ5bGE0b3ZVUkNrVUtrdTcyUXYv?=
 =?utf-8?B?eWtjNERkRG5PazYwVVJYVW9WTTJaQ3BOczc0dW5wSUFaSkhDdUMrVWtKcksx?=
 =?utf-8?B?VXhFeWkwOWJyNFBwQk1tZ3hoQ3ZqQnBlMllBSjNvRndFNTVmaGdpTTkrM0Jx?=
 =?utf-8?B?Z0lyUVhlVkJNTWExN3FGWC9xbStEQW80clhVQnprMDRFKzRvQTBRMkZoQ2ZX?=
 =?utf-8?B?bVJIa1Y2eTJ4SmIvQUR0MVRuRk8vMkhFSjg3T0M3Tys2K2lKak96blJsNmcy?=
 =?utf-8?B?azlKdk9yMll3MVltcDZ6VVBxdlFMaVk4a2ZDR0JFMjVsUDNqcEFvdGU3Q3pt?=
 =?utf-8?B?Q2JMeWVSQTRoUjBtNnRVcjAyeXlheFI2a2lIZjRKb2N3WjRCcHI1aThYZ0N2?=
 =?utf-8?B?UXJhZUwyNngxNE9VaWNCTGJSUHoyZkllZitBRjNVclRWcExibHpmeTU1bGdK?=
 =?utf-8?B?ZHpQOEd6RzhTWkduYTRyQ1pkbHNzMktidjVRdzlzbGs2SGd0c1M1L0FHOU0x?=
 =?utf-8?Q?j23LQcu1Fw92yh5zaVJtH2x/L?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0FBcI7CAwrmmErj4MQLs1FI2hiWNbaVlZBbn5XoX7iBrL27WkAnYsLzB/N3hFebsbvFZg9+2BxSJupSLGCUjFtXAeupyEUFaThE5Zg4mZ/qDgrG+XHLksI0bN8AmBgwgzZNtR+6/k5iIqTKfA7jB9KnWP2/cuefvz+Xkn0ASueV3KQoarPjme8TVaWhyg/tMtlsG4+5Dnnkj6OqlvtaEV35GSYrH1pU4TJ3X55JnxZL/TxESsKSHxhhrc2JPjsHb3tCj1V6v+vBJqkHSmYbdCXUor5Erv4mMGn+NprDXeoPvX1FkznfAiw9KiaarRQrC+op6jjJW3u7MUtFrAT2z40aL6vNNSgaT3dKcX7DZi0xW2UL/Y2VnyWM6kQM4g04EWXmgsrNTK7tzBRgGD+tX/rIEeABUhGniWl2D+TCeXPaFxmiJnKEjtAIU73bUu2w+KZurXmihTTayi4RRgmW37dEjipR3rnw00d7JQ8ysEAW9cBKyPQAcANb5NQnLDJ8PVF6rs5bliimP3vry6e9dW5OmTH4gIonNLdK/1VpaxTquT6oP90H6EYEKcqRYjPmr2AwVtY2k/wgvVxGMJ5WXmUuXO4PnK4+ZmgzJw3j+oB2ZLBFoPbMzJNTQNf7Xcbq9qbM38XFB6acO+tCu6Mdn0jxGgGxo2I3EGdl1MbcZkan7N1vy845URXl0nkYduf5ep0JukXltxYqhTH5/ZPzKoHjpOTCR5b9WNva90s0shg1VPVS7x1uk5ZoJYIyi07Sn9/5U0Y3l6SnRi0PhqfmhWgCi6ByBsuMIq8ZZwgi5AOYKxihNp44QWv8ADAxJgs5v
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8068abbe-50bd-40d5-b06b-08db35017f97
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 11:41:15.6901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpIW4ULc3Z7MUY9IPGv4R0RFiNMGZV9TbxxrqYxbu4IpwkxREJoM/xUmC/DqWX7Qbf32e3/VIxOQN29yoACZug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5247

On Tue, Apr 04, 2023 at 12:31:31PM +0200, Jan Beulich wrote:
> On 04.04.2023 12:12, Roger Pau Monné wrote:
> > On Wed, Feb 15, 2023 at 03:54:11PM +0100, Jan Beulich wrote:
> >> While the PAE-extended-CR3 VM assist is a 32-bit only concept, it still
> >> applies to guests also when run on a 64-bit hypervisor: The "extended
> >> CR3" format has to be used there as well, to fit the address in the only
> >> 32-bit wide register there. As a result it was a mistake that the check
> >> was never enabled for that case, and was then mistakenly deleted in the
> >> course of removal of 32-bit-Xen code (218adf199e68 ["x86: We can assume
> >> CONFIG_PAGING_LEVELS==4"]).
> >>
> >> Similarly during Dom0 construction kernel awareness needs to be taken
> >> into account, and respective code was again mistakenly never enabled for
> >> 32-bit Dom0 when running on 64-bit Xen (and thus wrongly deleted by
> >> 5d1181a5ea5e ["xen: Remove x86_32 build target"]).
> >>
> >> At the same time restrict enabling of the assist for Dom0 to just the
> >> 32-bit case. Furthermore there's no need for an atomic update there.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I was uncertain whether to add a check to the CR3 guest read path,
> >> raising e.g. #GP(0) when the value read wouldn't fit but also may not
> >> be converted to "extended" format (overflow is possible there in
> >> principle because of the control tools "slack" in promote_l3_table()).
> >>
> >> In that context I was puzzled to find no check on the CR3 guest write
> >> path even in 4.2: A guest (bogusly) setting the PCD or PWT bits (or any
> >> of the low reserved ones) could observe anomalous behavior rather than
> >> plain failure.
> >>
> >> As to a Fixes: tag - it's pretty unclear which of the many original
> >> 32-on-64 changes to blame. I don't think the two cited commits should
> >> be referenced there, as they didn't break anything that wasn't already
> >> broken.
> >>
> >> --- a/xen/arch/x86/mm.c
> >> +++ b/xen/arch/x86/mm.c
> >> @@ -1520,6 +1520,23 @@ static int promote_l3_table(struct page_
> >>      unsigned int   partial_flags = page->partial_flags;
> >>      l3_pgentry_t   l3e = l3e_empty();
> >>  
> >> +    /*
> >> +     * PAE pgdirs above 4GB are unacceptable if a 32-bit guest does not
> >> +     * understand the weird 'extended cr3' format for dealing with high-order
> >> +     * address bits. We cut some slack for control tools (before vcpu0 is
> >> +     * initialised).
> > 
> > Don't we then need some check in the vCPU init path to assure that the
> > cr3 is < 32bits if we allow those to initially be set?
> > 
> > Or will the initialization unconditionally overwrite any previous cr3
> > value?
> 
> That's not the way I understand this "cut some slack". Instead I read it
> to be meant to cover for the VM-assist bit not being set, yet. Beyond
> that it is assumed to be tool stack's responsibility to constrain
> addresses suitably. If it doesn't, it'll simply break the guest. (There
> is some guessing on my part involved here, as the original introduction
> of that code didn't further explain things.)

If it's just the guest that's broken I would think it's fine.  As long
as such mismatch doesn't cause issues in the hypervisor internal state.

Did you see a toolstack setting such entries before pae_extended_cr3
is set?

Thanks, Roger.

