Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0AC605B6D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 11:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426332.674730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olS9G-0002NF-87; Thu, 20 Oct 2022 09:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426332.674730; Thu, 20 Oct 2022 09:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olS9G-0002K9-2s; Thu, 20 Oct 2022 09:47:34 +0000
Received: by outflank-mailman (input) for mailman id 426332;
 Thu, 20 Oct 2022 09:47:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NEB=2V=citrix.com=prvs=285423218=roger.pau@srs-se1.protection.inumbo.net>)
 id 1olS9E-0001OM-9g
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 09:47:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36ca03f2-505c-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 11:47:30 +0200 (CEST)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 05:47:30 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6027.namprd03.prod.outlook.com (2603:10b6:408:118::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Thu, 20 Oct
 2022 09:47:28 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 09:47:28 +0000
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
X-Inumbo-ID: 36ca03f2-505c-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666259250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zhU/cvtVTG1/4sJCeeB/wJONeiOC1F2tMr7LlQSVZm8=;
  b=HvjoCCAEghT5bIRMmUTqbW7LISMZ5DR9HTO9HG1w71nboM7PQRWhPZbP
   kELS92xSkgfKrAu/Tj89axsAWBBUjhV6l9lw5RsJ/k0FqZ5QDZbUY6tcr
   1XD2Fuwz8rTITr+QOH6hP1H9h9ZMlAPcKfX64yZBop2zabtvj/PUtSVSR
   o=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 83565871
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EQJS/K4b1k08hWOIvF9hhgxRtELGchMFZxGqfqrLsTDasY5as4F+v
 modWj+CMvaKYmH2f99+ad+//EsHu8PdytNgTwZtqHsyHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5gZmPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5oKztAq
 8ZfEAk1ZzW7ls7twpmCc9hF05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGNnGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iL327GSzXyiMG4UPKL/3MRXg2fN/Vc4Cjw/V1mcruKkpGfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWblXoVRZEYd0i8cQxHDoj0
 wbQm8uzXGI/9rqIVXia67GY6yuoPjQYJnMDYilCShYZ597ko8c4iRenostfLZNZR+bdQVnYq
 w1mZgBn71nPpabnD5mGwG0=
IronPort-HdrOrdr: A9a23:uud85ap6qzRjBQVQjMXfHrQaV5uwL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwI080kqQFm7X5XI3SJzUO3VHFEGgM1/qH/9SNIU3DH6tmpN
 5dmstFeaLN5CZB/KHHCWCDer5PoeVvsprY/ds2p00dMT2CAJsQijuRZDzrcXGfE2J9dOcE/d
 enl7x6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr18jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvS/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kda11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtZqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW/HAbgcYa
 dT5fznlbdrmQvwVQGYgoAv+q3nYp0LJGbIfqBY0fblkAS/nxhCvjklLYIk7zU9HakGOul5Dt
 T/Q9pVfY51P74rhNpGdYE8qOuMexjwqEH3QRWvCGWiMp07EFTwjLOyyIkJxYiRCe81Jd0J6d
 /8bG8=
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="83565871"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGCC6ZWd2XotCbco2NAAFVjsEK6yOR8geiHqFqm9PLLj9dQ/qH2dBrGgNejOPStM55yUx0p08A2Zx35zK2LKJ17MzxIWdLrqnaSD+3pWbNIvoR6hF+M8zzgFTydVtoznltdvvLJ/f+WkPgSPeBMLKcjn75a3GdTBRnG1vpXTcamjSrodJOKstoWlBI2oXTZ7dfUu23OIOytPOer9TYzl+WtlLLkoy/S8JqwM5lBDoEE+8XleMky7pwi8WkkUgpXr1+0r79McbtgGoXoDzf2ZlyGBPg5buPmaWvp4imG9x11PqWXaO9t58w+7bJzZc/dn6WPPq6kh5IHGs4E7lOcAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcNqGycumZluqS1dv81OQzz4p9zUec8vGdrHjobcML0=;
 b=fu0+v4n25iLXRhQYOYLizZ2ZIk7x9zCHtXyYR4Bpd34cu7hiTncXYtBpt/BVwBe/5lAEUVdJz16TC8ltP8u2xalc6romO8LZewN3A6LpTwG4F6Xp6jTcvUWX56grkaob+oG06t+cls68bq01z3F7z5W+0Jrx94K87rX9hmLAI+XgcDU1AoRGCXtDSF6H/dvTfFVrGHxXXUE5pm8thZPi+2SveavIB+kCRxuIpZoMMqjFZDik6YZ+D7c5O+fQFOadSWBipZiWIuwA2i8vmEdSN/Bmg2ec2Urhpv9JI8KncxmPdE/DHByIA0TWQ0ersD0jNHGsR8hOCcXnfbfcGCMNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcNqGycumZluqS1dv81OQzz4p9zUec8vGdrHjobcML0=;
 b=wiyew6rYX/0calNxVHMkPtpAJZfqga+i0fYoSdFdJvEsGZMOLUD31DHG0m5IXuhO3R5Ppem+W44T5IY9kCBqz0IpEtxi+vVhmXjlcsOEuBqZGSSxGylY6OMEj8OlE40KKMaB69bfBGJzYevOAqOIATFrHJY+9dW4d+aIQfioZMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.17 4/6] vpci: introduce a local vpci_bar variable to modify_decoding()
Date: Thu, 20 Oct 2022 11:46:47 +0200
Message-Id: <20221020094649.28667-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020094649.28667-1-roger.pau@citrix.com>
References: <20221020094649.28667-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0657.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: b079895e-1c0c-4144-01ca-08dab2801955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Husm1w+74Z8vtSAkUXxYbjiwCKvF58/5YtxE1kmZ3zXt/opOkLB1DwwO8APeMDK8hG+7M/CpMtQcsXoxJ9jPMSmStL4Es1MxhsoMSvOnaZ356tRHpJEuzv4dxvpwGekI9ZizoKRaxWTEYUsIHHOJ8pc8h3adiLJzBjYGoG//avFP21SrK0gTlmKoDjfU5xyTSYcNWKOLNDbgaS0KjSKmz79CMvL3ytDLc4sFvd5v8kAT3fYNq2q4y+NyjraxkLa2fcTv5dM0YAr9lXALiE4riZPZqWfhxjQx2MKAymgleAory+FGz0LRSou7Y98CufEjZzM1SeKt1DZ+kY+Nhew3G5iy7OEygKteHtsNi8V83q2ifHlGJGz8aM+Jj8sQV8sbJLnB1Ff7GCWqv1MeYE99MC8k+gIQnimiW5S7Y4DeId0UyOSBkcKOiyRU+suVRkInV9sN4Z3zujk4iMzU1S0NZG3ekWLQwwDWXqUifRf4vAlKXpJa7dKGwG/7IkXbEHEAJT0GFBVeNUODoDzxpNcgSCUBMQg8RbgAOYVXYRwHQjuRvaip/U2MbH8e0VnIm3MIyVaZhfdHNtp3Kw1bpakPCahPn3SigGEFndFvM/PAcD3NZigbWPDbmwOdRw4WtIZ3WZfS2asA+s95t4OTCFKznROWInqLkFx8mWvOmxf78v2P1FJoqfQxHPEoLtv8VNo0RYH1mu4Ax0xO6iZ2llg4Wg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199015)(316002)(6916009)(6506007)(186003)(36756003)(2906002)(41300700001)(1076003)(2616005)(6512007)(5660300002)(83380400001)(8936002)(26005)(6666004)(8676002)(86362001)(66946007)(66556008)(66476007)(4326008)(107886003)(38100700002)(82960400001)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eG1UZktMbEFOTm9PSUY0c2ZFT2FyTUJuWGViaDdqNDNtUXRJelZ4Z2Y4bUhq?=
 =?utf-8?B?Y1pUMmJyNXJkdTg0bHRBeWRVMklzeWJzK0pSYnlNU1lSeVRtYUh6dSs4eVVZ?=
 =?utf-8?B?K2NZRCtGR2psQUc2NWdyelU2K0gwM3RSK0xVenNJT2NlbFdnczk0Z2RRNTNR?=
 =?utf-8?B?K2I5Q1MxbG1jVGRNKzFnNkV2SW5HZGUxcDNNeXhaeFFKclE3U1hmU0k0dTJ1?=
 =?utf-8?B?bSthSGp6S2dzZ0J6V2FTVFM2dDg3WDYrR3IwRHEzU09iRmFMNWgzNjczUzBZ?=
 =?utf-8?B?UThqVW9ReDhPd0F0cWNrcStpd1hIYTNxVzBXQ3E3R1BlM0JmRjF6Y295K3g3?=
 =?utf-8?B?OWQwc1paWE5JR2ZwWTVxKzFDc2ZlVG5kdW9WdkRYaWpQblI4am9lMnJXZFRs?=
 =?utf-8?B?QTQ3SzFabDJPcFFzeUtiOXNSRUtnNXMwdU85SzhQSldhWWJzODBvUGJOelpz?=
 =?utf-8?B?MEQ4TkwrTjNKVElSQlBjV3hFdVNEN2pmRHlrUmZkbGZxYTQva0gxTlUxNjlQ?=
 =?utf-8?B?WmR3VitCYjJjZjQ1SmFSbzFEaTExamFkbkZheUljOEF6eTU1d3Q1T01jZldy?=
 =?utf-8?B?bnhsRVUwNUI2bGZsRUlVNVRaRXFablJTZWJwUXF1N29vNTM5cExZSEg4cXRH?=
 =?utf-8?B?YmpEamloMkp2c2NxbmJkcXZVQm41NHhzTlNlTHZWdkx2dkQ5bVp5Y2tpa3hD?=
 =?utf-8?B?S0NCaWRTT1cyQ0o2d3ptMVhkVHp6MWQzYURKb0ptSjlaTklNVERabTRDaTVm?=
 =?utf-8?B?MUdJbERNR1ZacDlhTVpDazlveU9adDVDdFE5aDVsdGcrdnRjNVc5MnNudTFu?=
 =?utf-8?B?cjdmUUVSalU0WExPYURFSmZ5N3BueHlxZDJMVHRWa2t0YnpaTmN1RVhLQU8w?=
 =?utf-8?B?Yi93Q1RDcFhOM0xPcnVqSXN0cEJkNzB1M2xTSEl5bzhHT2lsWEhDQk1DMUZJ?=
 =?utf-8?B?L2liR2pOVExvaWhGQTFaRm1LOENxV1RuOFh4Y0pxdnR6Smw2N3hsbEJGcEFm?=
 =?utf-8?B?UjFlRWZibDRaM2o4ajRNcTZOVkZiQmVVNGxUME1vMFpxU3RDZU5hSmdyQTFG?=
 =?utf-8?B?a2p6SVAyUzVkK0FtMTBuM1UvbFA2V1JpKzRpSG41ZDEvVkFmZURyZVZZdWFP?=
 =?utf-8?B?dThkK1pEcUhTWlp2VUh5N3ZkUTB5amRaTUFzWjRiVFpOMGJSd0lCa1pVclpI?=
 =?utf-8?B?TWZKSTRKUjhBK0Qweis1bTNaWmY2MWhwZ1NVY2xsbEFCem1CSEQ4Y2Fyd3N4?=
 =?utf-8?B?c0YrYis0NCtRcGVaWmJKcXBINUUxVzU3c2QrTGVzdGlOeCtESHpUanFpa3J6?=
 =?utf-8?B?UjY0V2xPb1ZMbVlMVW0xS0Z3aWlLenBGL0x5Mzc4RkZCaE9aR2pRY01NYWdP?=
 =?utf-8?B?K3d0US8zVHZjaTdZLzIxUXJ1bWJFbEpDdlhYUEZEc0hvMllRQURCYW9kK0xG?=
 =?utf-8?B?NXh6d3NsZmRSdHd0K0Fvc3QrMCtxa3VxV1ZsUlp6Wi9pMzNaTTBMN0NYV3F1?=
 =?utf-8?B?Wml5SDZ5aThkc28wbEw2UklXYWViWGFxUWVsRUcxTEdPb0hzeDczS3NyUXNl?=
 =?utf-8?B?Z2dudDFwV0lnU2VqODgwQzFKbndiK1RkNmxGU3FFSDdYdDJHWlBWQ21XeUgy?=
 =?utf-8?B?NVlWR2NmSEJ5Wk15MHRhMWNLM0FvbGxSaFlHd2UzaUFKRWx6YVVBMDdEdDJV?=
 =?utf-8?B?cEljNW81c01HWW1tZEFlclVVMjE1REU1Ymp6cGxTVmRqQm9sMUZXRjRlTXRa?=
 =?utf-8?B?WHdHZFUyYXU2R1B3NjZ0WDhlalowZGVUZlVpdzNiWXBCTkZ6WFArRXU3UGQ5?=
 =?utf-8?B?QStBRjNiNFZWRmtFSko0Mk1wV0VHK0MyZWM4Tk5JekNRcnV1ZEFySU5GRHlh?=
 =?utf-8?B?VUNwQk1mVk03bnRUMUpUdTBiMW5UWDBEZ3AwMW5SZGRjOWg3dnhFQ3JhZGdL?=
 =?utf-8?B?RlR6SEJFUUlINElTM3pqZlc4OVRlZ1VoTzBHSmdIMVRRWkpXQVBTbjBzYUd5?=
 =?utf-8?B?cE5kaURBNGlFeTVzQW9WU2JBbDdKUGZCVmc5amJEVzdOa2s1VFpNTVhrTkFR?=
 =?utf-8?B?OXZ0NzhJbm9NNVZNa0tvd3AvdC9ua0lFdTFRc0NtcDBwck9tQUhVV1AyOTdX?=
 =?utf-8?Q?KNU3Apwi1AB6HYr0pZiLSJxmR?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b079895e-1c0c-4144-01ca-08dab2801955
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 09:47:27.9405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzHyw9acq0WVBKaqn3/Rt4UxQ6AyxoymcKHmlAq85Oe5rxHO175byHxv0g61nIEhBaGS2VABoEULLRViFED7lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6027

This is done to shorten line length in the function in preparation for
adding further usages of the vpci_bar data structure.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/vpci/header.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index a1c928a0d2..eb9219a49a 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -103,24 +103,26 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
 
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
-        if ( !MAPPABLE_BAR(&header->bars[i]) )
+        struct vpci_bar *bar = &header->bars[i];
+
+        if ( !MAPPABLE_BAR(bar) )
             continue;
 
-        if ( rom_only && header->bars[i].type == VPCI_BAR_ROM )
+        if ( rom_only && bar->type == VPCI_BAR_ROM )
         {
             unsigned int rom_pos = (i == PCI_HEADER_NORMAL_NR_BARS)
                                    ? PCI_ROM_ADDRESS : PCI_ROM_ADDRESS1;
-            uint32_t val = header->bars[i].addr |
+            uint32_t val = bar->addr |
                            (map ? PCI_ROM_ADDRESS_ENABLE : 0);
 
-            header->bars[i].enabled = header->rom_enabled = map;
+            bar->enabled = header->rom_enabled = map;
             pci_conf_write32(pdev->sbdf, rom_pos, val);
             return;
         }
 
         if ( !rom_only &&
-             (header->bars[i].type != VPCI_BAR_ROM || header->rom_enabled) )
-            header->bars[i].enabled = map;
+             (bar->type != VPCI_BAR_ROM || header->rom_enabled) )
+            bar->enabled = map;
     }
 
     if ( !rom_only )
-- 
2.37.3


