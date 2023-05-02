Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3576F4D01
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 00:41:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528844.822488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptyft-00073o-VA; Tue, 02 May 2023 22:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528844.822488; Tue, 02 May 2023 22:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptyft-00070V-Rs; Tue, 02 May 2023 22:40:45 +0000
Received: by outflank-mailman (input) for mailman id 528844;
 Tue, 02 May 2023 22:40:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTLj=AX=citrix.com=prvs=479cfccc8=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1ptyfr-00070P-I6
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 22:40:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5baff743-e93a-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 00:40:39 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 18:40:23 -0400
Received: from DS7PR03MB5414.namprd03.prod.outlook.com (2603:10b6:5:2c2::6) by
 MN2PR03MB4989.namprd03.prod.outlook.com (2603:10b6:208:1a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Tue, 2 May
 2023 22:40:21 +0000
Received: from DS7PR03MB5414.namprd03.prod.outlook.com
 ([fe80::fdfd:97e5:7c55:82d]) by DS7PR03MB5414.namprd03.prod.outlook.com
 ([fe80::fdfd:97e5:7c55:82d%6]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 22:40:21 +0000
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
X-Inumbo-ID: 5baff743-e93a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683067239;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FNB9GSnyRPnYK98/Gs9Y6pEJFd5wbO1w+y7hmtAbIcA=;
  b=LuHqencmt8ngkpycZ7EhW8VOZLUMK5xVT7V/Yvqgxq/VNNuzqIXq6ijf
   EmGtXCE3dRtfMoDXeFpt9ekbyvaSCegVhYaXZaWXNPvka5o7EcihPX2zP
   I/x4CDL0difqZJlcIjN7PXTWdkJzOsUhHN0G8HYpsUY+BSWUPCeS3iLTY
   E=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 106400643
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3ILQr66FAqk+9ypsawsoVAxRtCPGchMFZxGqfqrLsTDasY5as4F+v
 mNJDzyHO/3ZNDP8eYhza9vj9kxXu8DQxtBjSQM6pSgxHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0T5geF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 O4TDjQQdUm/rsWx7OyFEtYyupsCFZy+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUooj+WF3Nn9I7RmQe1Xk0Cep
 2zL5SL5DwsQOcaD4TGE7mitlqnEmiaTtIc6TeXmqqYy3gHIroAVIBJOCFaGk/mBsHajXPYCd
 UsvpRE37pFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+pQSiaPCEUKSoOYHECRA5cud37+ths01TIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:EeK/za7YLSgKAYek3QPXwOTXdLJyesId70hD6qkXc3Bom62j+P
 xG+c5x6faaslgssR0b+OxoWpPwIk80hKQU3WB5B97LNmTbUQCTXeNfBOXZslvdMhy72ulB1b
 pxN4hSYeeAdGSSVPyKhDVQxexQp+Wv+qauguvV0ndqSgFmApsQijtENg==
X-Talos-CUID: 9a23:EE3REWNNP23Zh+5DQTts0koJAZkZW1ra4Cnue3DmNTlIcejA
X-Talos-MUID: 9a23:k1cfJwgUAYuKg1hODiTGt8MpO5817pmcCHg3qYgBn5TaMhcvAC7etWHi
X-IronPort-AV: E=Sophos;i="5.99,245,1677560400"; 
   d="scan'208";a="106400643"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhynCaDbmxKP3i5Gsz3FwyM3xKKVa562v2Ee/d8QYLd0md19dchnifKlm9R2WOqMBEJLdUbVMXkbLC/O260MjJtMdmkZXwTLvi3aCiVZsqD2J/GSNeKaIgDKAJlXefMnEI3G+3v6hRJseHPn8bY6m46dhXBOMLJD38gg3ZnYcNyT48WSGotQcYwzOJwpZfS+k81/XIgBBWwcp3xYEaUX2vrTaky/J6ICl6LsyJ11mFD4inW2AkfTBXpCB9zbVWkztsLGNKC6aoz78PFnETApQ06kuD2nrra/Eow0/lEd/IGmcvDazF0gqIvSjnn0GHt/RoQgHfk8yPManXy7EV1XJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlq3SnBA/2XciEPKI0qXHiISzju/CjJhWkRkawbwRwk=;
 b=E2eu+u4eIq+fS6OWReydzqs0MUv63TkR3RXJMMVqVsmO7lOdqE+P+DWiYjXVtLapLs12ZrwNpF1VgSvnmEMMLUzswUTECLWpApnFEVF8CmuZv8SWMiFY4jLA/8ZcYCX32CUsNn6k+jPRGXjn4VIDThWV0RsWSskrRi9xzDpqsp6aZZQh3sZC2bDhwsfHOQR//q8fO78snhzhaX5UxglrTj2Od1PISUTWTnHW66rSVwu9ynlwFCxUpGpU/FHbpJMFn+Mkwi6dxUWviYI8mDmmGZm0hF6W2ydbkBJoC6GZAtIsNJ8nzOCFxElX6ZWfJKrsgmxSUHXvFCHrdfta8rq4/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlq3SnBA/2XciEPKI0qXHiISzju/CjJhWkRkawbwRwk=;
 b=KBnyIhg0haOjT7nZs38ciExnDmZ8sJ4QbWtliwa/yIATjAy1vGUYxDFygcUtJmVvM9teNXFNY1voBAkXrv0yxWMN1jBv4uXysWaJfkovNYeGp6vaOcWXG6vYjC0R8L61YjbdHzuQ84Fr/ctuLb0RkFKa/iG0eWtQ4PDQC1LEn2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5e877d50-de2d-0af4-9fa0-d4529a97ee2f@citrix.com>
Date: Tue, 2 May 2023 23:40:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 1/2] acpi: Make TPM version configurable.
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230425174733.795961-1-jennifer.herbert@citrix.com>
 <20230425174733.795961-2-jennifer.herbert@citrix.com>
 <5516fbf5-dbfc-dcd5-0465-e4757fdc16de@suse.com>
From: Jennifer Herbert <jennifer.herbert@citrix.com>
In-Reply-To: <5516fbf5-dbfc-dcd5-0465-e4757fdc16de@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0591.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::13) To DS7PR03MB5414.namprd03.prod.outlook.com
 (2603:10b6:5:2c2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5414:EE_|MN2PR03MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: 6882bbf6-3dc4-4193-6965-08db4b5e3609
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RnaqWcA84bQdqs9njpw3FW9OeB6hIWs4GZJqZvOXfknA1g7AHUMyR5zJHa47pCxWXf9QZPcYCX+TGa8KzM1IA5g57mii9NyLnvne0bGi3+WG5q/1jhhlaHCFV5FvBu9eKOlp37ZbIf8NI4gPmF4wXeuuXt9hsgQmBrItcNaHrUh2s7x678MKGUV0YNmuWmpwD5exVert2O8TX4T5kDAgyH5lHXVHSs1JEUzR9j9BwLDf/E+uyxMdg7it6XCcu9/giPKnVX4gKFnidIMVH6xJ0UPfMaE7iq0esZjA15ySxN82CdFKX95DUoSNIZekDvZ+LUsRVgJt8mYObKLho7qW8JhDlvSSNKsnoxYpUevZSqbFuU5TYQ83NMNhSnnv8YzK6DBov0n6T+/yZyvA5YeWG5xUhBTXMzeGqQO6qbYsGR1dts0tTcajdDs21DpwR45h95VtT6kNdLKJBu6pPFFMO6s3qsH9zTUGybI7rvYj2UQYWjnlWOk5mkV8K095SWzdiqYvqgVU7htStyyDbjH4onjQe5YYnI75/YHxay/0lhgM6C+u72xVu0/yhE17lGcK2iY3qy+35JZf5adzCb2mNl6STUfUDX26sLUOW60kaqWJo3qLHEYyrkgNSaZMglCVz41y4HUil/DD2Em3FRG4zA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5414.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199021)(54906003)(26005)(6506007)(31686004)(6512007)(2616005)(6666004)(478600001)(66556008)(66476007)(66946007)(4326008)(6916009)(316002)(53546011)(41300700001)(186003)(83380400001)(6486002)(5660300002)(8936002)(82960400001)(2906002)(38100700002)(44832011)(86362001)(8676002)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3VOZ1Zxc2ZpZWEwb3A3eHpsdVUwNTBYcENVcGJhVjZrU1JmMWQvQnJrZStL?=
 =?utf-8?B?SHdrdndLSExMM3JvbGtjeVZCRndrUmtwaHIwNFJhMUJkMmJubWJwdnM1TlBX?=
 =?utf-8?B?ZzkySWo0L1BweE85dVVldkdhd1lpbGpEN3JjcEZFS2F6cjN2VGcvZUhOK3My?=
 =?utf-8?B?cmR1MjYxK3BBQ00yeW5sS0gxQnM2SjJLOWtvMjNpZFRWczh0TFh1aHJxYUJ5?=
 =?utf-8?B?NmpZNFlFNVNVV1hXVTVVUC82Ym9TS21hTDRMTUFmL2tmYithdXpGemNiVisx?=
 =?utf-8?B?ZFNSWkg2QkgxTXN4VW9xUG5KWk9QOFp6NWRLOUMxWGFieTVnemorVU5KYml6?=
 =?utf-8?B?K1k2elRaYVFjdFpGY2FUU0RkRVN6b214RXoyUlVQTU5zZFdyNEhKT0NWR1du?=
 =?utf-8?B?ZWR1dHdycDczbnhxVnYzbGhPNlV1MG4rWEFCU2p0OENkdm5BY2tlV2NpTGl2?=
 =?utf-8?B?cVp5ZUxOSUNBRytPcTA1TXRMMWZzNy9wSkZ5Uk5wL0dvNGZ0ZGdJZG9hR2ZL?=
 =?utf-8?B?UXZ2ZVQrbUwwbjJSVzczWTJ1dnpuUUJHRnBCQ1RCMHdPZ0Y4clBKbzBReEI0?=
 =?utf-8?B?eWgycVN0OHI2SDNuVU1NNXBOQmYwZDJGNHhITkYzR25ndmNRSk9PN0prU2J0?=
 =?utf-8?B?Z1FqcXg2RHMybGhBamRyOFQ4TUhKeFF3ekNDL0Z5Tll5cjJaTU1nTXZ2dHpt?=
 =?utf-8?B?Mi9FT2tnR1NRSy9UT1h2QVhPMmZBUzBpQ3lJR0xNc0RvejJaaFpUUnFDUlhp?=
 =?utf-8?B?dHVCSmNwN3haSlF1bTRWc1haaWZWcjFDaitlKzgwOXpwWlpObDVhdWpxUFFm?=
 =?utf-8?B?UkdKRVZ2NUVVbTJXdXJ5NDB4a1pLekUzb1dhQVFWSDg5Vzh6dlN0SE5BWnRP?=
 =?utf-8?B?Y0FpYi90RkQvbXhiYStHUUhZa1ZCT2J3WGtxQit1Y2dVNjE4VXlHZlhLYnNB?=
 =?utf-8?B?djltTDg5SjVhNml6UW8yQWhIK0k0MmFDMDRBZmUrRExMNDN0TE00bFY1OUFQ?=
 =?utf-8?B?VGx0OGt1cVJJYm5VNURBdDVYeUlFZ3lRNW9NZ05xSndYejFDbEFNTmdBeUdt?=
 =?utf-8?B?bCtWUERqK0Y1ZWd1RjZBSXdZUjVrQzE4WFc5OTlJME9BbnY3RGxsUHVlVnRa?=
 =?utf-8?B?SEtsdFpYajNUS01MNGVDbDBYQlZnb0VuTzNIVkMzVnVXM2g5UC9pVms3b3Zj?=
 =?utf-8?B?NDhpN2xzQVlCU3BwNkhrWjUyYmlnb1hzYU0zSmptdGZnbnJOTjlrc2FQNnhF?=
 =?utf-8?B?UDJsUnJmT3JHSUw0U0JYYnZPdnFzUEEwaHFLTjZ3bzBYN3FjRXplbEF1cHlu?=
 =?utf-8?B?TVJzYlYvUXVNU3Q4QTd3dWhWNTdUS2JWZlA0b0dhNnZlWEpCZlRoVGM3bG9l?=
 =?utf-8?B?MmZZYkZJYytKaE1nZEYrOGdVSUFOL080MFBrRTd1ZlRpN3d5aUhJRWRpVnhZ?=
 =?utf-8?B?RW52SkQ0RjMyR0ZPWGZMVnBuUUFZOTltNk1vNVZhaDROVk1GQWcrSFA2WnFP?=
 =?utf-8?B?dWlFYytjUXpTMU9ZeVZxNTBXMEtneDR2djNYZmgxdFJHY1JHcjhiVmdFeVJk?=
 =?utf-8?B?Ymc5Mjd1SXhUc0wvemFpSW9xWlJuelNFbGtseU9Kemk1RGczNHhjd1BZYUlM?=
 =?utf-8?B?U01wRU96UHhmR3dnbXFkaVgyQXRiMGY4eGhlZVVlVnViMGI3T2Nlb05EdHNH?=
 =?utf-8?B?WXEzR3g3aEJHNHUzMTR0bm5lUG04cFhlWTRxNXZIY1ExQ2ZiRHE0TTZEY3I0?=
 =?utf-8?B?TkYwR2Z4RGhFdnVLYUl4VitNWFVwZ2w4K1Vxc1pwVEpmYUh6V0YrZUhsNnBP?=
 =?utf-8?B?S3hPR1c3eGdkcnRWSmx4SG41SWluVzRnNXNDR2g5UFQzNXRwRkhOZEtKTGdC?=
 =?utf-8?B?YnlTYmpiV05WNG0vNkJaYVoxOTNsYmxIRXM2SjFEalBtZFlYbFVEb0grMHN3?=
 =?utf-8?B?ZlRsL3p1UTU5YlNFY1hpM2pLQW5ybUdJU0xVTktzaWw1eURPVFJJMTZRTzYz?=
 =?utf-8?B?NWNNUW5RbnVzckxwN2V4U0dWWW00eUpxRXREQUUyNDU3Z3FhcWZ5K2F3MHZ4?=
 =?utf-8?B?b3BFMTlySTkrRGZqNkhUTFhzMDY1M0VyY3JjTnBsMC9IbklITzNxZWpjclZk?=
 =?utf-8?B?S0tqTFJMWHVLNWRNTlRveWx3QmRsL0tidENIY1Q3Y2VZbnYxbEJseGd1b3Vx?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kqTb7B2bWPV1YEHvVsbHP8wKyQqI13OgF7f0uEFSYKKj3q/o/0vRe6bQ83+ZZ2rIo7qWJpGAhinPtXj6nJFQbH+ohxBT1tiT6dMzjqobjoFd2DZdWmU7JT/vbYk9yAbOqlHBvmHI11G4696l2/Bw1QsoFhszL6uT9Qfdvzf14OG3b6fYZjJSUD+bBenlzF/4K3rmvA4zIrOszEPcF2SaIjQSDNqdar7bMwBNhZA0sDcLPYX+TWd78h8E/02AYmp51+9oR6zeiB39HuxRKF0gIjkYKFxgaXdsqBxzyj84bxE6CSq+FlfPOxgQYu2BtxUNv7yi+uEEWnTvQ/GHr+NRayqck9n15cOoZL4RAGFLH3l/5osmQ2nKPeWZ5TkKzPINQEh/F7pEPOnMVs6xrMEglhwOquYCrzncQwLJCcSfpoYShkFWxjnsgeBEFcJuCXpGP/zCozO2jEpVOSwIyYi0ObRn2UZvT92MU/bt8thJm61mx66ByFh7IH8IRMwrRmb0eQAoILf7IC5aOSvWa5LZ1+OmJ4OKqQ7CEQBAxKjrq9syYPwotNe/gC6v9D+9aS/oMJHivupeLWxNH5sChlfBQEwwM99TPp+jj02G2pf+c5bNHJdYfcfWeNbUiv8Wo2nqIgGMrUeTOnSwyYqfP3FOjCki2rSGbuQKZ03GqD6w0GJ9irNwXw4FHBzQPw2g2DpOUuYKB5ubov78Ck5uMzwRbH5gSDUbMbLSW8XJIVerAp4iqBLGIyi0Jof1AFdpt33530WW55SMxOcDWYeBrHvE5NCimy6LIJfrSVFzIaF28xE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6882bbf6-3dc4-4193-6965-08db4b5e3609
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5414.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 22:40:21.1377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhQwWrJMGqmY34wBhzMfvQccN35nRNOUHITDbA6m2PIt/YHFza1l2zZyBorjuoRhrl0SvumVd9zCqCSnUuni+7o7VNuzpzwFLSTXb/Cbevo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4989


On 02/05/2023 12:54, Jan Beulich wrote:
> On 25.04.2023 19:47, Jennifer Herbert wrote:
>> This patch makes the TPM version, for which the ACPI libary probes, configurable.
>> If acpi_config.tpm_verison is set to 1, it indicates that 1.2 (TCPA) should be probed.
>> I have also added to hvmloader an option to allow setting this new config, which can
>> be triggered by setting the platform/tpm_version xenstore key.
>>
>> Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
>> ---
>>   docs/misc/xenstore-paths.pandoc |  9 +++++
>>   tools/firmware/hvmloader/util.c | 19 ++++++---
>>   tools/libacpi/build.c           | 69 +++++++++++++++++++--------------
>>   tools/libacpi/libacpi.h         |  3 +-
>>   4 files changed, 64 insertions(+), 36 deletions(-)
> Please can you get used to providing a brief rev log somewhere here?

Yes, ok.

>> --- a/tools/firmware/hvmloader/util.c
>> +++ b/tools/firmware/hvmloader/util.c
>> @@ -994,13 +994,22 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>>       if ( !strncmp(xenstore_read("platform/acpi_laptop_slate", "0"), "1", 1)  )
>>           config->table_flags |= ACPI_HAS_SSDT_LAPTOP_SLATE;
>>   
>> -    config->table_flags |= (ACPI_HAS_TCPA | ACPI_HAS_IOAPIC |
>> -                            ACPI_HAS_WAET | ACPI_HAS_PMTIMER |
>> -                            ACPI_HAS_BUTTONS | ACPI_HAS_VGA |
>> -                            ACPI_HAS_8042 | ACPI_HAS_CMOS_RTC);
>> +    config->table_flags |= (ACPI_HAS_IOAPIC | ACPI_HAS_WAET |
>> +                            ACPI_HAS_PMTIMER | ACPI_HAS_BUTTONS |
>> +                            ACPI_HAS_VGA | ACPI_HAS_8042 |
>> +                            ACPI_HAS_CMOS_RTC);
>>       config->acpi_revision = 4;
>>   
>> -    config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
>> +    s = xenstore_read("platform/tpm_version", "1");
>> +    config->tpm_version = strtoll(s, NULL, 0);
> Due to field width, someone specifying 257 will also get a 1.2 TPM,
> if I'm not mistaken.

Seems likely.   And i few other wacky values would give you 1.2 as well 
I'd think.   There could also be trailing junk on the version number.

I was a bit phased by the lack of any real error cases in 
hvmloader_acpi_build_tables.  It seemed the approch was if you put in 
junk, you'll get something, but possibly not what your expecting.

Do I take it you'd prefer it to only accept a strict '1' for 1.2 and any 
other value would result in no TPM being probed?  Or is it only the 
overflow cases your concerned about?


>> +    switch( config->tpm_version )
> Nit: Style (missing blank).
yup
>> --- a/tools/libacpi/build.c
>> +++ b/tools/libacpi/build.c
>> @@ -409,38 +409,47 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>>           memcpy(ssdt, ssdt_laptop_slate, sizeof(ssdt_laptop_slate));
>>           table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
>>       }
>> -
>> -    /* TPM TCPA and SSDT. */
>> -    if ( (config->table_flags & ACPI_HAS_TCPA) &&
>> -         (config->tis_hdr[0] != 0 && config->tis_hdr[0] != 0xffff) &&
>> -         (config->tis_hdr[1] != 0 && config->tis_hdr[1] != 0xffff) )
>> +    /* TPM and its SSDT. */
>> +    if ( config->table_flags & ACPI_HAS_TPM )
>>       {
>> -        ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm), 16);
>> -        if (!ssdt) return -1;
>> -        memcpy(ssdt, ssdt_tpm, sizeof(ssdt_tpm));
>> -        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
>> -
>> -        tcpa = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_tcpa), 16);
>> -        if (!tcpa) return -1;
>> -        memset(tcpa, 0, sizeof(*tcpa));
>> -        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, tcpa);
>> -
>> -        tcpa->header.signature = ACPI_2_0_TCPA_SIGNATURE;
>> -        tcpa->header.length    = sizeof(*tcpa);
>> -        tcpa->header.revision  = ACPI_2_0_TCPA_REVISION;
>> -        fixed_strcpy(tcpa->header.oem_id, ACPI_OEM_ID);
>> -        fixed_strcpy(tcpa->header.oem_table_id, ACPI_OEM_TABLE_ID);
>> -        tcpa->header.oem_revision = ACPI_OEM_REVISION;
>> -        tcpa->header.creator_id   = ACPI_CREATOR_ID;
>> -        tcpa->header.creator_revision = ACPI_CREATOR_REVISION;
>> -        if ( (lasa = ctxt->mem_ops.alloc(ctxt, ACPI_2_0_TCPA_LAML_SIZE, 16)) != NULL )
>> +        switch ( config->tpm_version )
>>           {
>> -            tcpa->lasa = ctxt->mem_ops.v2p(ctxt, lasa);
>> -            tcpa->laml = ACPI_2_0_TCPA_LAML_SIZE;
>> -            memset(lasa, 0, tcpa->laml);
>> -            set_checksum(tcpa,
>> -                         offsetof(struct acpi_header, checksum),
>> -                         tcpa->header.length);
>> +        case 0: /* Assume legacy code wanted tpm 1.2 */
> Along the lines of what Jason said: Unless this is known to be needed for
> anything, I'd prefer if it was omitted.

I'm not awair of anything, but your comment 2 lines down  from version 2 
made me think you knew of some.  So if your happy with me removing this 
line, I am!


> Jan

