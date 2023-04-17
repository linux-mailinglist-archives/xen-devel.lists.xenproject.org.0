Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D04616E4584
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 12:46:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521969.811018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMNB-0001Ez-Fl; Mon, 17 Apr 2023 10:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521969.811018; Mon, 17 Apr 2023 10:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMNB-0001Ci-AW; Mon, 17 Apr 2023 10:46:13 +0000
Received: by outflank-mailman (input) for mailman id 521969;
 Mon, 17 Apr 2023 10:46:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poMN9-0001Cc-3V
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 10:46:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ea0a116-dd0d-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 12:46:09 +0200 (CEST)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 06:46:05 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6965.namprd03.prod.outlook.com (2603:10b6:303:1a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 10:46:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 10:46:01 +0000
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
X-Inumbo-ID: 0ea0a116-dd0d-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681728369;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qIpiUhZSyHGmv7An023UC8NpDFm6tx8941EcX0ptUlw=;
  b=D7LjGRK19iTP+uznLZMWm0BKl01GmlvzV5ApBrJQlbyAs6BytkrPTPUR
   zDC+B+63UJGhP62SNXr4iGbmkBfuWtT3Ifii4WTetoXIM76sKqcgo6Fdk
   9PPjUqV8LLl/S+gd+JMmt33ea20Df1G7S2oBH5+tcNEwFNlqT6LmkiP8o
   0=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 105820573
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fXYJUqmGAA4CsYPhyLjyVj7o5gywJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWWm7Qa/veYGPyfNklPIix9EoOuMKBytU2S1c+pHwwRCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgX5QGGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fcGKTEgfy+xvMm7g5WgEu10qMgjE/C+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieCwWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTODorKY33wb7Kmo7KRNNXGC7p9WCh2mCd+BzJ
 0I5yyY0ov1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xBW8CVDdNLsMnsMweQiYj3
 VuE2djuAFRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85i8jVf5mGa+xy9fzRjf5x
 mnSqDBk3u1Oy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDEhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:L5MM/qEknJWYyNzypLqFcJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskd2ZJkh8erhBEDyewKkyXcV2/hnAV7MZniDhILFFu9fBOjZskvd8k/Fh4lgPM
 5bGsATZ+EYZmIK7voSlTPIdurIt+P3kpxA692+815dCSVRL41w5QZwDQiWVmdsQhNdOJY/HJ
 2AouJaujuJYx0sH4yGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3y0ZTyhEzd4ZgC
 P4ek3Cl++eWsOAu1PhPlzonttrcRzau5V+7fm3+4Uow/PX+0eVjcpaKv2/VXsO0ZmSAR4R4a
 LxSlEbTo1OAjrqDxuIiAqo1A/63Dk07Xj+jVeenHv4uMT8ACk3EsxbmOtiA2nkAmcbzaFBOZ
 hwrhGknosSCQmFkDX25tDOWR0vnk2ooWA6mepWi3BES4MRZLJYsIRapSpuYeM9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BHsM2I1Dpdmmx/0iIjtbkit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4H+sFSdvfMB29ffsNChPtHb3KLtB5B5uWke+L3Fwc3pDXRKA1
X-Talos-CUID: 9a23:XQTcyWB/UATclgv6EyJ59U85C/8XSVbQj1DLe0ugJ2ppd4TAHA==
X-Talos-MUID: 9a23:3toJygWuR+wecbHq/B7i3zhZNMFE2KmJNGw/vZkIlviILyMlbg==
X-IronPort-AV: E=Sophos;i="5.99,203,1677560400"; 
   d="scan'208";a="105820573"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fk8N8LAtgO8M0XRmaprDASx9eRdubCQk0BqvV0rtNbO5f5xaKlpcqJBDek1ycJnB4vn6PnqV7pTDv4qNS9hl9a+JEhGSznlMFGwE+mi4KsaT462djFhGJngHo8i3JmZ1T28ipPGhePUFVIE2TgrDVXkXsvwj4wS9m+7demaYCHmu2RjoaJui/csDN/TYhVKP26U0dKQuU34RuW4uHdmJm1QBp6qerh6vUve7Wa12mO2rv/z1qwIl/E15o5Q2czazUwzxJTOBCqUN9P6aW77QWQrMqu7WBYVPP8E3V6LvElC39Icoy9DGmVb5DHmL0vaBvKIJWxwPfApf6xqYMXbZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuGMmpMgVv3Sqli+PmWRBIzdFVx7DqqibqKW7hrQ+I0=;
 b=cnbu78Gs8VoKo5sFkhVAaLSGWZVRCeVYzMRmrEm2UAwji9UYdA8TuCILmFp282zObBKRpAlB4kzB/LmFDnp5J7v2Z1CbvqTZNetoy8tZMPQTeg+1sh1GvWHwrEpO4UKrjkaFSOP96i3NxeUnREUXGuGFq83zxq4INUXNfuDMSsWPZ/pgAfqGxZFDkXuy208U9aaU+qwknHqeeMTjE0/KojByvWq1lzQIhJWZENjbHQcW1OcKaXDZsOQVMlSO9XbfhNPoSagtljkCoECLBPxON18K7cQ1La5w0w5TRUMmUzKOONAcIIIG39Qgo4tCy2Gl83mvB3c98dlRMrN9plNHFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuGMmpMgVv3Sqli+PmWRBIzdFVx7DqqibqKW7hrQ+I0=;
 b=ogOPJKGkx1pziVyQHgAUb6L2AlHEF1n7gtHiftK7GJ/jqfqEXJQ0r1IrtO/KHrjgOXTyQn0Z/7Du8zDEdIy+mBu0rfyKSJiUKFBmkG/B+pJpIjnrEqZU0vkH5ipSWb7ma8vEMVPohjYTYX9bG491+j9Iy7Sf7Zlf6GK2xbKY6xQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b9fb5819-14c4-98a9-dea3-bf20748a0fda@citrix.com>
Date: Mon, 17 Apr 2023 11:45:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/livepatch: Fix .altinstructions safety checks
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230415022229.3475033-1-andrew.cooper3@citrix.com>
 <dd6615fb-dc2d-9885-e3a3-9cf0954f57d3@suse.com>
In-Reply-To: <dd6615fb-dc2d-9885-e3a3-9cf0954f57d3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: bf14ca5f-a827-4e4e-7bde-08db3f30efc5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r+WVK7depdb3QkZW0t/90JZ4A864Ed3CnwbiNvwkLN9k3B+/xfRCux0u6nTYRSdySing4Ltco96nQyZ1QuMGl/nWW3zQ49BggBaqhys8VyPF/AFAnJ2fx831XNDMdwOIa1nErdSZK+WBO/VR5JijO5UxZ7AyE+rWN00SxgYxVQQebpMr3+l/fMT1RN0/6umBwM0XqTHe2XebpJFh+JUNU7FOaiTkxgdxoo75ABi0sPlw3dWM0zFoaoXK8zibPdXxqHzx204pD6UCS5eVeV7sidARb8JCuKsTCIInOGWk/daSthUALx6wtRaBJr0juVAgkcUTX9tlpNaqME4fWgeg3jYaUeUqPo3+WwePNrtxcqsp7ymArda8XoSbKmLjPyU9EFZF0/Dtgo/L5XgHsmrV9sxdyIHwESQw+V3eRRmdJTMOYvlRM1w6pzixgzskBPII7oUalRDw7+EBctJMH0EnBZDpH2B0BV91+ptK8WCP3UxnFNXZfogZ3DkP5JQSVJrw2+odtZeWyfbvWykQKDybRHy0eQdri49vWGm/ShAXb4hPkBQFHkk5ziydIlHMbCtlmFcaWeN/T8JEY58DA1M5VVhD4qwF5QelX5FWUUhhe9xrXiGH7pGFEiPc3EppgIO5I1zFJOkIXcroJ71WW8RyqSoKGqzft5DZPuO7PNQwSpSRmkhB8getGL5VR8T0hNlV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199021)(8676002)(83380400001)(2616005)(54906003)(478600001)(6486002)(6666004)(6512007)(6506007)(26005)(186003)(53546011)(36756003)(38100700002)(5660300002)(4326008)(6916009)(316002)(66946007)(66476007)(66556008)(41300700001)(82960400001)(8936002)(86362001)(2906002)(31696002)(31686004)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUtGemQzeG9Ia1FuODQyV1pKeDBqUXROb29lS3d1RndiMEQ3Ykp6MXhZeTZn?=
 =?utf-8?B?WnBXK0ltalMwQWRuUGZCVFBMY2k0VVN3TWdaT1gyYmFOSmNrRUF3SmdjUnJ2?=
 =?utf-8?B?bWYzQnAvVGd5UG10NlBneUJHQnczbFQ3V0dZcFA5SUpza1Uvd0c2TURQU0lS?=
 =?utf-8?B?SzBVbVk0ellocFBWL2NBeTZWeTlyblJUSFRuTTFocGhrN01zMnZuem4yUFNN?=
 =?utf-8?B?N0g0OTJ1L0NUWWVGdStRalV5clhTbkhzVjJrUjNXUkJhQ2R0czFkelJ4SVpI?=
 =?utf-8?B?Y2gwSXRCUS9EQThiTSsrZmU2bm5IRmFkS1RJOWFwQld4MVU2MzdnZ2NiWnFi?=
 =?utf-8?B?MENWZEM2YVBVK0FVVGpEeDQ4b1dvVkJsbDhEdkRMd081N0Q4N2JUcUhETXZG?=
 =?utf-8?B?UXUwRkNNVFl1YXNFdnNXY2RoN09IcGtsdHp2K2owVDlVd3BCVVdvQmUxVXUw?=
 =?utf-8?B?RHRzNklmT1QweVduY2ZBM3pyd1VNVStHRXdEZ292NnBIYThXNy9pSGRLeTcw?=
 =?utf-8?B?NlovMVNtbDFKWkUzUVJRWmJ3NjlFMDBTeTVILzBXK0lVTzN2Y3BzQ0hKU1FC?=
 =?utf-8?B?VytQWmFnRm5SQW9kUlZBY0c1OTUrNysxTXBOSk9WZ01wenFma2FRSHBOMERz?=
 =?utf-8?B?L09sWnJPc2JWbU9OczRTK2F3WTQxd1NXa0xORXNaS0FGRHQzUHZEMEZoYXpx?=
 =?utf-8?B?UVN0QWxrWW81clZPM2RxMy83dFhiOXZ5Z2I2d1NWZ1ZkTEg0Zk9Sc1hzdnhq?=
 =?utf-8?B?OWtRb0hDSWNNbWMyL2JjTXdYcVA2ZW9ZZXVMeHJRcFVHMDFHQjl4QTJkNEJm?=
 =?utf-8?B?bGpjTEFNTHp6N0VqdHQvaFVNU3l6aForNmRzOVZveWYwUjJ1OHN5ajNpNFRk?=
 =?utf-8?B?K09FZzQ5dmwwTjV5cEZnQ3B6Zk1zckZReW1YRG1oVUM4RXZzNnVGWnpwU053?=
 =?utf-8?B?aUhxdDZPZU9GZm1pbnIxWFdsRFBUbzhVWG0wMkJnMUhQdnR3QXFuSGtaUmVh?=
 =?utf-8?B?eVY3N0xaYnpqQTFPUDlRQ2x6LzhrcXpnYXpoRmdsTmdsLzFlcVoxUVV6QjNp?=
 =?utf-8?B?UWlhOEhnVTEwSmpQTDhjT05sUDdNaEhra2FZd0NXRXk3enpDekQ5dE5lNXEr?=
 =?utf-8?B?QkJqNjVRVVlaSCt0ZnpUSFZsSTNIb0wxL25HTkZkUVVQV0R6TmZYakgzQmQ2?=
 =?utf-8?B?NEg2Zy8zUUtNWWVkdHhFN0hOOEdyZVplYTBia3BKcFRaNzNhaUNTeVNrSkRZ?=
 =?utf-8?B?aHFjQVJFMm1QSnA3VHhZaXd3aWtFd2JrOXB0U29wNGRpWnNabWRYNVlYaEZh?=
 =?utf-8?B?UkdaVFkvNEV0R0xrODVmT1RkNmhaRGNXSjRVdlBialVDY29HbEFRTjRlczRj?=
 =?utf-8?B?NnROZVFKSFNCNldkWXF6OXRjY2phcVhRTlBtY3AvODBwTUc0N3F4TVNrTU1j?=
 =?utf-8?B?NlhUejk0Q3BPTVdSNnptWmplam9oRXVYQkxCSk4xc3kvTkJmNXZNQUU1VjNt?=
 =?utf-8?B?RFRneU1hWDJwbUNYTmZ2SmpySG4yb1JoZUw2S0xnQzg5eUVmQ0dNZm5lQmph?=
 =?utf-8?B?ZjM2U3R0QWtMaStCZEQ1NXBOU0tKdmdncUJJdXpLL1Awemp1a2dLdGZRM1dm?=
 =?utf-8?B?YWM4WmJFMFlWbXZTR1QzcWZXdUZWcGZFWjk3OGRuMDM1aFhPcEozVE1QcTJ2?=
 =?utf-8?B?Z0xjOGwyemN5WHFDNytaL2llZE91eERGY0t2dEVkMk9CUEpsUGZJcDhwbjRO?=
 =?utf-8?B?SlA3bVVsVFpqUHVJYTFWZ1pJbFM4NTZiVlhJZzNpQWF1K0hDdXl5NU5mSUNZ?=
 =?utf-8?B?aDE5cVd5K3ViMXJGcXNTdGlVYWFzeG1jSkdhL0lNbTN1Z0svRi9hVDhVUzRD?=
 =?utf-8?B?bUFScXFFL2tzby83dWhwNlEvQVlSNmlaU1V4eWFyM01UV1llcW1tT0FnT1Y4?=
 =?utf-8?B?d3VxQnd4eExHNmlxQTlUSWxUMG1qVTYrdFJNbk9GTlVGcWg3dWl0bno5ZnUv?=
 =?utf-8?B?UHM2Q0Mrei9WSExjOEtpRjB3YVNsZmcyemFkNXVlZXBGWHNkSTN2bHppdnNp?=
 =?utf-8?B?dis3clNjSlZyb3JJL2FjWGsvc2Y3T2h4MnJIQlgrbWFjMnZGZFJaSldqRGRS?=
 =?utf-8?B?WkNNMTJRU0tRaUhLTkxuNU90RkJLN25lUmhDQlVnYkZVN21BWS9UeHc4V1pY?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2v/pojSHmItgG3GAoO0ZR1tO6RJ9kSalQ905jPpe2kNBCglImYQt2Bka/kw108hiCuYyRbhn4kci8MPa6JBgIsKSugXeXeD1vC5wSkYNsRxTlwpAzyz+/VyL4Avign/rz2SNn58Nea696PJVvB8O4SzWpHQy3ITcxemLPchTnjzlUQE6j0C02b+BXFWoG52X//nWtt+RCeSzd7fMG3W0lrFsYY/KG8mIK0rVSn2h6NWFL1nH4OZgk7WhtUcHfye9P2k4mbHA0p5F82nI1KRsapn34+MzQVgFiy/33F06v9NZgGIKlLfiuFdh7ZZEzbWD5KAP252hgLcqullT+jSc2PINlVvlu7p54C3k5Y+WDSZohKRUHwHJPyXbXFKHzcOxHwRWObsiEHdQEOui0oStXdNqwXIobCn8yK/Qh7kapNhMYOoGLz8cvYGYeX8qXdfDxBcQfIxdZ6F6jRKOBsOCBNqiSoxdDMH0DFBGPG66kSBujQ+lKmHk+oEmyXvXg+DnVE4fTz96auL0aRqf55HIelrfz9LnRvMWy5CTpFFNgshE6/b0wgskakN9XATrqXrR0uQYmG3wNSN1xaON+XuxIbIy74/9JzM2Cl9CsjTDT6LReotlrftCkIcmUJw0gOtrdyStYO4hsUDuJy/DNrbr6iP9GkzOPo78lMJXoaADjBJf06Po2SfrXKP9JemdliWrvdoSjMm0I+oAQTNjSKbsYQcBQ1zuPkyiZjgYFLucj+/oKWWWw09e2Y1qH2Hv2QiKgVf748PvEv80YXD6Y4+ShLRihd2mIJ3mCRL0nDh8u8EuUz9Oqh8Y0Xfqy5f0W7JfY48LAOkQf09zQ+a4FHckmg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf14ca5f-a827-4e4e-7bde-08db3f30efc5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 10:46:01.7628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrSoG3nbPtFwmPvezBf9f1GSi5n0EnC3Bw8In4FrMkuX7Z9TBrmALQZm0GMv9yvI8mI0XWuDgzUATHLzTjipbb5ZeguSCzvyUK/JKqxdqWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6965

On 17/04/2023 11:01 am, Jan Beulich wrote:
> On 15.04.2023 04:22, Andrew Cooper wrote:
>> The prior check has && vs || mixups, making it tautologically false and thus
>> providing no safety at all.  There are boundary errors too.
>>
>> First start with a comment describing how the .altinstructions and
>> .altinstr_replacement sections interact, and perform suitable cross-checking.
>>
>> Second, rewrite the alt_instr loop entirely from scratch.  Origin sites have
>> non-zero size, and must be fully contained within .text.
> Or .init.text, which may be worth making explicit (perhaps also in the
> respective code comment). Or am I misremembering and livepatch blobs,
> unlike e.g. Linux modules, don't support the concept of .init.* sections?

Here, we're talking strictly about the .alt* and .text of the livepatch
itself.

I suppose it would be nice if the safety check / other one-time hooks
could live in a local .init.text for the livepatch itself, but we don't
have this concept at the moment.

>
>>  Any non-zero sized
>> replacements must be fully contained within .altinstr_replacement.
> Yes, but if they're all zero-sized, in principle no .altinstr_replacement
> section could be there. Not sure though whether that's worth supporting
> as a special case.

This is discussed in the source code comment.

Right now, all zero-length replacements reference the
altinstr_replacement section, so the section is present even if it's not
got any data in it.

If this changes in the future, we can accommodate.

> Furthermore, ...
>
>> Fixes: f8a10174e8b1 ("xsplice: Add support for alternatives")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
>>
>> As a further observation, .altinstr_replacement shouldn't survive beyond its
>> use in apply_alternatives(), but the disp32 relative references (for x86 at
>> least) in alt_instr force .altinstr_replacement to be close to the payload
>> while being applied.
> ... if .altinstr_replacement is retained right now anyway, isn't it legal
> to fold it with another section (e.g. .text) while linking?

Why would it be?

We're auditing what the current tools actually produce, not any
arbitrary theoretical one.

>
>> --- a/xen/common/livepatch.c
>> +++ b/xen/common/livepatch.c
>> @@ -803,28 +803,82 @@ static int prepare_payload(struct payload *payload,
>>      if ( sec )
>>      {
>>  #ifdef CONFIG_HAS_ALTERNATIVE
>> +        /*
>> +         * (As of April 2023), Alternatives are formed of:
>> +         * - An .altinstructions section with an array of struct alt_instr's.
>> +         * - An .altinstr_replacement section containing instructions bytes.
> Since this is generic code, perhaps drop "bytes"? (Or else use "instruction
> bytes"?)

Technically bytes is ok here, but yeah - it will be slightly better without.

>> +         * An individual alt_instr contains:
>> +         * - An orig reference, pointing into .text with a nonzero length
>> +         * - A repl reference, pointing into .altinstr_replacement
>> +         *
>> +         * It is legal to have zero-length replacements, meaning it is legal
>> +         * for the .altinstr_replacement section to be empty too.  An
>> +         * implementation detail means that a zero-length replacement's repl
>> +         * reference will be the start of the .altinstr_replacement section.
> "will" or "may"? And especially if indeed "will", is it really worth mentioning
> this here in this way, posing a fair risk of the comment going stale entirely
> unnoticed?

Hmm.  Thinking about it, I expect that it's not actually always the start.

The code uses pushsection/ref/{repl bytes}/popsection, so for an empty
replacement it will probably reference the end of the previously
replacement.

I should tweak the comment, but the logic is fine.  All I check is that
[repl, size) is entirely within altinstr_replacement, with no special
case at 0.

>
>> +         */
>> +        const struct livepatch_elf_sec *repl_sec;
>>          struct alt_instr *a, *start, *end;
>>  
>>          if ( !section_ok(elf, sec, sizeof(*a)) )
>>              return -EINVAL;
>>  
>> +        /* Tolerate an empty .altinstructions section... */
>> +        if ( sec->sec->sh_size == 0 )
>> +            goto alt_done;
>> +
>> +        /* ... but otherwise, there needs to be something to alter... */
>> +        if ( payload->text_size == 0 )
>> +        {
>> +            printk(XENLOG_ERR LIVEPATCH "%s Alternatives provided, but no .text\n",
>> +                   elf->name);
>> +            return -EINVAL;
>> +        }
>> +
>> +        /* ... and something to be altered to. */
>> +        repl_sec = livepatch_elf_sec_by_name(elf, ".altinstr_replacement");
>> +        if ( !repl_sec )
>> +        {
>> +            printk(XENLOG_ERR LIVEPATCH "%s .altinstructions provided, but no .altinstr_replacement\n",
>> +                   elf->name);
>> +            return -EINVAL;
>> +        }
>> +
>>          start = sec->load_addr;
>>          end = sec->load_addr + sec->sec->sh_size;
>>  
>>          for ( a = start; a < end; a++ )
>>          {
>> -            const void *instr = ALT_ORIG_PTR(a);
>> -            const void *replacement = ALT_REPL_PTR(a);
>> +            const void *orig = ALT_ORIG_PTR(a);
>> +            const void *repl = ALT_REPL_PTR(a);
>> +
>> +            /* orig must be fully within .text. */
>> +            if ( orig               < payload->text_addr ||
>> +                 a->orig_len        > payload->text_size ||
>> +                 orig + a->orig_len > payload->text_addr + payload->text_size )
>> +            {
>> +                printk(XENLOG_ERR LIVEPATCH
>> +                       "%s Alternative orig %p+%#x outside payload text %p+%#lx\n",
>> +                       elf->name, orig, a->orig_len, payload->text_addr, payload->text_size);
>> +                return -EINVAL;
>> +            }
>>  
>> -            if ( (instr < region->start && instr >= region->end) ||
>> -                 (replacement < region->start && replacement >= region->end) )
>> +            /*
>> +             * repl must be fully within .altinstr_replacement, even if they
>> +             * happen to both have zero length.
> Who is "they ... both" here? Surely it doesn't matter here whether "orig_len"
> is zero.

I haven't explicitly rejected it, but an orig_len of 0 is an error.

"they" is repl_len and altinstr_replacement.


And FYI, I need to repost this as part of a 3-patch series in order to
not break the ARM build.

~Andrew

