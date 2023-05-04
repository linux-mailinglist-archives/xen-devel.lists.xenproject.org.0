Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C25F86F6900
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 12:20:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529666.824302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puW44-0003h2-4m; Thu, 04 May 2023 10:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529666.824302; Thu, 04 May 2023 10:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puW44-0003dz-21; Thu, 04 May 2023 10:19:56 +0000
Received: by outflank-mailman (input) for mailman id 529666;
 Thu, 04 May 2023 10:19:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puW42-0003dt-4J
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 10:19:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3350d690-ea65-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 12:19:50 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2023 06:19:42 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS0PR03MB7204.namprd03.prod.outlook.com (2603:10b6:8:122::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 10:19:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 10:19:40 +0000
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
X-Inumbo-ID: 3350d690-ea65-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683195590;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JwqknuLbanHrBbQKXOwppLLuBzXBLyYx3ASMR+/7AdY=;
  b=G4DXBrLpLeaCtP+7Z+LEOmxZlmw4aQrKty877oac9GmQkhF41t9b1p6y
   aGuLTQUPT9Dp/nvkKSFoV7kf74R7kz68Y/DhqECNUkAGK5uh8LNDsQvYt
   lLiQI3JLALYXGoSKjsq/EsumBF7wIm2wn8M+qNP7DqA9DmtLatMSBCEjs
   E=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 107165809
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Lfba7a6RpHkqwylLbcBhYQxRtBXGchMFZxGqfqrLsTDasY5as4F+v
 moWXzjTOP7eN2WmfIp1Ydjk8UMGvMTWz9Q2HVE//nw8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0T4AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5ms
 vEcMTkcdAu5hLiT752rSM5vu84zM5y+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUoojuiF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKS+Tmq64y0TV/wEQuGkYobAW9scKZsUm0ZeBtM
 X5IoSoX+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqWMMfZQ4M4t2mrIRtiBvKF4xnCPTs0I2zHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxa8owFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:5/cgh6iawKCwC+NFcdqiYLwm5HBQXt4ji2hC6mlwRA09TyXPrb
 HLoB1773/JYVkqM03I9errBEDiexLhHPxOjrX5Zo3SOTUO0VHARL2Ki7GO/9SKIUPDH4BmuZ
 uJ3MJFebrN5fQRt7eY3OEYeexQouW6zA==
X-Talos-CUID: 9a23:C0mGJWzTvvumcMh0DiuqBgVTF8Q8e2zH103TeWqXJnZrb76oQ0+PrfY=
X-Talos-MUID: 9a23:RwYfswWURKRbhTnq/AL+3w9basF42ISVD0ozo6cciZXfNRUlbg==
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="107165809"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tuv1ZuCnvtBzUSePmJXJUxaH9PCNvJ0LqMyhV+dojnUMgwO2e26uBm7Ax14w995PaLXfygWAa8KtLAsJZcoF6ycpyoXpdWBFJstq7LJ/SgW2pOh7qDfn1VDAk50iLYCD93JkeOuHS7ijm7dTaYHkrfBAiuxe40kYiGC5ngm1S7zZ+p4+QBY8Q2+2YaikjNhoEFo1a+CvTIc9nwMBPGywpKQgZ87bL4HRV3O9ArvGrlv76CLOrtOLBTWsECI2zZRQQe9Vo59gQqnzwl/ICRuR2azI91Ul8YUxunXMChQaB9w1GmfhYrqG4BadkK9CWti2AHNKQAuXeTsT67AzuodlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwqknuLbanHrBbQKXOwppLLuBzXBLyYx3ASMR+/7AdY=;
 b=V+Rw0mEnOsWiWwmnx+uXR6fNQbeWHMVLqfpFDbhH2jTtZNvgiFxGxl9AYjC+2TcfOqmsnAY870pGp3MWLdT4/PU/c64/u0EJapeNcqEXKHMPtr9RQrGdcNdutkQUcbGZZ/hGiX+wlqJgd1Ii+4CAgNcAAHvkkqx0QftLzWMMcPtQz5uJ2MC73/hFy7849IwJTKDifYG4GZ/cAW6xlJAKtsZckvXnxRxUXcPVTh0EzqRwqoGDtPI6NIB4ulHqlqROtVoAT4yyobsqW7NAmm3Ci+TSjUYDvLWGxRRp/F9SYUOIQuPeh+wNFF4TQXyvu9cVLPu8SZ62MA5czRH0R5kVxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwqknuLbanHrBbQKXOwppLLuBzXBLyYx3ASMR+/7AdY=;
 b=bAR8YnmgTWwBXB9AydGWE8UqgTBuSUeTcWIdMGOaGQ7mifkOJG3tBqGFbSGxRXF4hfxqETeQDLN9bChic1SnLaQeV7tlw5R/EMSu8i+3sW9PZ2UN23Io+fxEKYdGkgfeM4fUCFfUSyZ9nWoS26rzOFv1zHt+DAsARbJf8ot/zk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <82bca889-e412-c71c-a680-8cc1530cc06b@citrix.com>
Date: Thu, 4 May 2023 11:19:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/ucode: Refresh raw CPU policy after microcode load
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230503185813.3050382-1-andrew.cooper3@citrix.com>
 <ccf68f0f-6fd7-a9a4-ef72-03999d11035a@suse.com>
 <b655305f-293e-a0dc-ab39-36b0c9787433@citrix.com>
 <2b125ebf-53ed-27a9-2f04-be2a6cac7fd0@suse.com>
In-Reply-To: <2b125ebf-53ed-27a9-2f04-be2a6cac7fd0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS0PR03MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc68f9b-df22-42ee-d8a2-08db4c891207
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	15z0UuX5BGWx+LZuycy4syS3WvJru07IMNY+UvO8lg0Wx/VX7eYh/b5pQ0UX/8Jgoor4E6WYNFtI/IN5TPlG2eRnSVDRhe0WS5d1kb2ag5Qc8xnevjOQPsH8ebw0dM7xHTeZSChLjli/FF7HIROInzUvKM58VEyGr6fCO1RjZzwH24VDkMWw5jsDVJnUUVeGDAdPf+t37b4/Q0Z9vWjfMqth9F3ZaADOlCQcwgGIoqjsqx4w2+VqdneWhz7En+ifKQmMWXbWqHykdR4ptI9zp/d2VB80Lst+J+YzgnDgXuStQRGaM3UEw06GJT9jcEURKeK60W2Rkw8Topi3YKLs5nPqcSsYRyonZ1w2ZKAosExx0W1ke7YUsfA7m4JLDsyYAcZQY3HMU1PUjPTay2wn8JbZUrZAZXvvaFLnKNXyoEjmGYY4/cTudwbqvUu7Giz0AwHgMGnTsG2XevUqd2fQC3L79a1Xdz9jtkhACYcMyVXEcmoF9T/xIWh2IqHNSfxPpGnfQ9Ko3VXVhXJ2rdkSx0e6KWB0BMsCIwbPIODsLpV1ityYNowgQAvNFOmLa/EvBigKItZLC9WSIi71zI+5NWbF4HMzH1Bxr5fkikbNhrA7kg3U+MTXMP3u2DICS6Ite2dARiuuaZdv33DJ8wSOWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(31686004)(36756003)(5660300002)(38100700002)(2906002)(8936002)(31696002)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(66556008)(41300700001)(6916009)(82960400001)(83380400001)(186003)(6512007)(6506007)(26005)(53546011)(6486002)(478600001)(2616005)(6666004)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0lxU0NzR2dhakU0bVFGZmpWNTVHbzFOK09hc0xQRnFJdDc5TFQ5NFVjVHA2?=
 =?utf-8?B?NTVoaEswcmxGWTR6bTR5c2RhSm9zTGE3aU1sVEJrRmdiLyt2a0k0WGdyQWNS?=
 =?utf-8?B?M1YvbGw2cG1DZWMvZW0yaVU1RDhPQlFkQS94V0x0VFFHUXl6VlErZ04yK2wx?=
 =?utf-8?B?dnZuekhmRHl5OTVvWDV3T0F1WHRkeVJTa3pKM1Q0SDFlUUtiTXFSOHo0b3hF?=
 =?utf-8?B?b0NLbnFPUVVGWEJIRTFYcFREQ1Z2Q3dUSjRyS3JVTmhHZlQ0eEV4RUR1d3Ft?=
 =?utf-8?B?cWFxd2tubVRQOU5JYW5RVzduQnFpY2VSUkpQb1pHRFRhc2lSUWxOcm5ReHBN?=
 =?utf-8?B?NWdKeHF3Tlp1bkh4azlCNDA3Ky9aLyttaVYvV3NMSkd1WUJ2bzE2WTRsNnhB?=
 =?utf-8?B?M1lMcHE5L1p0cU9FUFlvQWw0a3hrNno4and4U1VzcGV3TmpCYjZTejVSZmlt?=
 =?utf-8?B?ZXlGQ3pTY1FzaGJDbjlRZFIvSEtxQzlYamhsbkNTUzZ5aEJ2Z3dWSXpVdlRj?=
 =?utf-8?B?eVRhNDk3VVU1aE43RW9NV1J6K2dPbUpBc3NOajdxVFp1VUZEQXltUFpJUGh3?=
 =?utf-8?B?MWJsQ0F3ZXhLZDdUTnpPUHF6TzlPQUs0YkFONDlHSWphTUFKbW5Nb1ZDTEFD?=
 =?utf-8?B?WGZkUlFsTWdsYXBnMEpaTTdKUGEwWThsWisyRlJYZTVpNDViYk8wbmFuZEhl?=
 =?utf-8?B?bjBPcmp4NVVDZDNEUFVIZTdRY3RnTklqUkRUWDFwRDgwWFdNTnFyUEE5enlH?=
 =?utf-8?B?dEN5UGQ4Ym03cDZOaTVnK2xwYlhmRThFOHdKdklUSmdVN1NlRHU2WmdzR3hL?=
 =?utf-8?B?dUNQS3BqK1Y3bHhrR0NBZUgwaDA0RFprNGdZUWVNNkZZcmhKYmJ0dHRZMnk0?=
 =?utf-8?B?YWMxbTlZTi9mZi9XTHVwekVzTXp6cS83SCtVYnhVb2ZNNlBTK0RLQmtmbzJ1?=
 =?utf-8?B?S3NwYk5HZDlDOTEySlEvd3Q2UUllSWJrMW5tSlpTSXhYb1FXY1Fvd3ZnRGs4?=
 =?utf-8?B?cHV2Y0wrYWI4ZW5UTmNMTTlmTVFscVVoTG5jY2JYRERkbWUrNFRobU1VSWN2?=
 =?utf-8?B?T0R3bHp2NXJQTU9YOWd0U05KL014VzBNQzE5aHNaWjNCb2NLWTNLZk54ZzN5?=
 =?utf-8?B?NEFsNG93eFZmSFE2RDFNSUV3Q1pWck1HYlZQMlpWdzN3ano4UW83enpsWDVu?=
 =?utf-8?B?blVYY2NqRGRUckxNTEVmbTlvYnRBQytMUmNEd2JrMmNEaDFnM01OYkZ4a3Vu?=
 =?utf-8?B?SWZ2ZllhWXNDTk00UHpRWC8yQS83TjRGN2M2WXJEYStyRm9qWXhhNjg4WHVK?=
 =?utf-8?B?TW1jc1B6ZkFnVnNPQnhQbERFM1lMRDF0YXV1Rkh0YzdEcWR3Q2l6OWtUZC9R?=
 =?utf-8?B?eU15d0ZFZ04rT3dYbExQblVSeWZ5N2s0OHY5RzJxbFdlYVptZXVWRzlxdVE3?=
 =?utf-8?B?Z3Nzdi9Xdy9ZSmZCMTJWbUFNZnFzNU4xSk9RaEdtTVIzQkwwNThmdzJBU04v?=
 =?utf-8?B?NndYc0FBdy9NRUJNb3ZGb3E0SXBKL3ZsN3lWeUhzS0YzNWFBalhtUkM0MCt5?=
 =?utf-8?B?Tk5ZSlZ5MWxYVXo2TGtVbU1nc0l2blpzVUp5dURjemVSd0dMS2RVYVRPNWRq?=
 =?utf-8?B?czhucmJScEF5bkkxUTRIS2hUT3E5TmdxNGV1Qk9JakpnaW4ranM0UHh1NUp4?=
 =?utf-8?B?K05XRmdOZGU0N1hjbWl4Z0plYUdRK1J0NzludlVOc240aFRhMm5MaGNEdlVu?=
 =?utf-8?B?cFpuMjd5T0tld01RV2dneG5SdDJsNWVvS3dGeXhQdStDSC9rNTBCa1RaSG1Z?=
 =?utf-8?B?UkVhd3huUUVGOWR3SStCenhSRE9ZcE5WWW4xUmFuVE9jSGkxMklONGVLMG5K?=
 =?utf-8?B?ZUVyYnkzVDVDN3Y3cGRqTmt5TkwzSnpXRkRiN3F1akkzNk5MWXZtZzY1bGYz?=
 =?utf-8?B?NlRWdE5teEx5WVVCWDcyb1llSHl0TUxseTlYemJKKytWdHNIaDFaRVduVldr?=
 =?utf-8?B?RlFrSVpQUzRGS2dsZURERUo2VkhOM1dzKzFJUnhjSmRBdGpJWnF6THBOQksv?=
 =?utf-8?B?K0VieFhrOVRScEg0ZUdjbE9GWHJSMENpS25GRXZ4WEl3eFpQQlBvZWgxSmVu?=
 =?utf-8?B?R0ZFNTJxdEFLN20rQnMzZ0dla2I1YTdlQnRzMGk2VVAxNXZVTC9GbmU5OS9s?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZzBW7gUI2ksla1pMXxwucoxKXpTT7hwMPngptL2C8QqpTZZyADsxTAdlWhUQoZgEqXk1zYaw6hMfbpyUqyHO5Q+higWVZEceYNRlqZ1bjwhbY+/U+4i7Slh+9ILbGxHzFTDp5dMELzjlbf0wJtRO+jZ0N9jMej/5ZIfqTWX9mh9NDgaOzsfsauuekwagyul/w+K8jwIpzgYw/fb9013nKJfUyq1huIVAF2WMbl2cn4EUEw52FbjtCqSgNou+3D2KciiorEqJ0eQqUXGnJ0P3j3wmtWlX6Bh1OY+G0AqlJDuKfquw1X1EbsT/RAl6HfojCM5E0ci9WBPsxp42go8r1uZWv6kFew1nH5EIl8whv/h2cG66jrS9pStEFA1o74WwskKiUwfQcaeSCn5eAyth+j0MFUOE5MGNNsFj7wAh7D+eY+9Wd0qJvhU/64f0AcNNXUP+JVfSMofotaWKdzBzx1N1kWAxpOojx4fqvomCWNZxIxcje9LGSnPBTOuXdyOh9CqS7a11lUkugB+7PogLFfmcvbrdESV0g17D4nz1HlgWQ0fNnvP1bz7jXO4bAprV8uQ8ztgRR/eUPYrBpOo/RO3IWshEO9UKKzgV4hJqyaA4NPOn2mBDRtlnTsM99r8pQKZApcMvVMnSC0J0gNFM5r8xptFfQ50Uui0a828hdQF3bXFvZtZGSoJdW5Z/zL2anRElN887EdeiIa40QECMolfd2TP0NInTqoUJZ14sToqfQ+77O818GYPYcWQ3xLFQEV3ztGBHL6Tm8PSmWM7uwztlRKCH/F4gF5X3z1aqJSBXkJ6KmuidlQhmWF/I+jxt
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc68f9b-df22-42ee-d8a2-08db4c891207
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 10:19:40.2397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7nUFkuLJE2m46bjhYR5FtZKrZBphZd4/JRx+QzduRtN4ut5dEnlL08FweL0LGjmgHxcRxu3FaEyyRi5cCfjlcS3rHdhorqdylBl3tu3CxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7204

On 04/05/2023 9:17 am, Jan Beulich wrote:
> On 04.05.2023 10:08, Andrew Cooper wrote:
>> On 04/05/2023 8:08 am, Jan Beulich wrote:
>>> On 03.05.2023 20:58, Andrew Cooper wrote:
>>>> Loading microcode can cause new features to appear.
>>> Or disappear (LWP)? While I don't think we want to panic() in this
>>> case (we do on the S3 resume path when recheck_cpu_features() fails
>>> on the BSP), it would seem to me that we want to go a step further
>>> than you do and at least warn when a feature went amiss. Or is that
>>> too much of a scope-creeping request right here?
>> You're correct that I ought to discuss the disappear case.  But like
>> livepatching, it's firmly in the realm of "the end user takes
>> responsibility for trying this in their test system before running it in
>> production".
> Okay, with the case at least suitably mentioned
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

>> For LWP specifically, we ought to explicitly permit its disappearance in
>> recheck_cpu_features(), because this specific example is known to exist,
>> and known safe as Xen never used or virtualised LWP functionality. 
> Right, but iirc we did expose it to guests earlier on. And I've used it as
> a known example only anyway. Who knows what vendors decide to make disappear
> the next time round ...

It's true that we used to expose the CPUID bit to guests, but IIRC we
never virtualised it correctly which was my justification for hiding the
feature bit when I was doing the original work to rationalise what
guests saw.

 
Removing LWP was an extraordinary situation, and AMD didn't do it lightly.

What they did was sacrifice a fairly expensive LWP errata workaround to
make space ucode space for IBPB instead.  They hid the CPUID bit (and
specifically by modifying the CPUID mask MSR only) because there were no
known production users of LWP, and a consequence of the patch, an errata
got unfixed.

On real AMD systems which used to enumerate LWP, and subsequently ceased
to, it was only "normal virt" levels of feature hiding.  The LWP CPUID
leaf still has real data in it, and you can still use %xcr0.lwp, and the
LWP MSRs still function.

Software which was genuinely using LWP, not tickling the errata case,
and late loaded this patch wouldn't actually have anything malfunction
underfoot.

>> Crashing on S3
> I may guess you meant to continue "... is bad anyway"?

Oops.  I was clearly in a rush for my morning meeting.  What I meant was
"we probably shouldn't crash on S3 resume in this known-ok case".

~Andrew

