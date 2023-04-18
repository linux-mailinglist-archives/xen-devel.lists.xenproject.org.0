Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E46FD6E5F06
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 12:39:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522744.812306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poikH-0007BR-JE; Tue, 18 Apr 2023 10:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522744.812306; Tue, 18 Apr 2023 10:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poikH-00079j-GG; Tue, 18 Apr 2023 10:39:33 +0000
Received: by outflank-mailman (input) for mailman id 522744;
 Tue, 18 Apr 2023 10:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTWx=AJ=citrix.com=prvs=4659928b3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poikG-00079K-9J
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 10:39:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ade6c36-ddd5-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 12:39:28 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 06:39:26 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6974.namprd03.prod.outlook.com (2603:10b6:8:41::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Tue, 18 Apr
 2023 10:39:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 10:39:24 +0000
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
X-Inumbo-ID: 4ade6c36-ddd5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681814369;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yDYjCyDWzR1AXuwgS+syds6olU7VBiFbQDVZd5Fwr14=;
  b=NSLW4keznnAkcSeYwL3V6mKfLJ2/rZZ2ns5Wm9SbhjdY0wJLDiTvMIY+
   LTDWf4zePn/LEweu2sKC9i/PBmKb24uHOw+xllnt1ON8MZxJ6KWYvfZC3
   n/0w80QSkIq5Z7chBGKSahHeRy18I+H8RsK49SgzwTMOVQpid0HKgFJ0w
   4=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 105972262
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ff0bhKiuVwBRMGuCtQwjIUPLX161TREKZh0ujC45NGQN5FlHY01je
 htvXTqPaKrcNDbyetEiPYSx8U9Vu5KAn4VkSwo9qn03ECIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4AaOzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQyLGwqZSuPtdum74PmZNFOo8sgL+jCadZ3VnFIlVk1DN4AaLWaGuDhwoYd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluGybrI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXlp6Ew2gPJroAVIE0VXH7is9K5sRWBa8h2J
 EsY0zAuqqdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakc5oRAt5tDipMQ4iUvJR9M6Saqt1ISqR3f33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxocO51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:e6bQGKve0dDJy3ahtfg3rKPB7skDpdV00zEX/kB9WHVpm62j5r
 +TdZEgvnXJYVkqNE3I5urwQZVoLUmwyXc32/hrAV7aZnidhILKFvAf0WKd+VPd8kTFn4ZgPM
 FbEpSWY+eeMbEVt7eG3OFJeexQpuVuAsqT9ITjJyoHd3AJV0mAhT0YNu/iKDwPeOCwP+tfKH
 J/jPA3wgZJmR4sH6CGOkU=
X-Talos-CUID: =?us-ascii?q?9a23=3AuteUbmmcpTidSPNVEA5EbBgIezrXOVfZkFDbGEO?=
 =?us-ascii?q?KMHZGeeC7cX2196BnsuM7zg=3D=3D?=
X-Talos-MUID: 9a23:iJ+gDga4NdWfCOBT5zzloWhwH8dTuJueEmkClpkvocmDOnkl
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="105972262"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4BwrApIp0zu5MoEfOzvULjK8QJmDT8Dd+KrRcGdNcUgQF3NYvgMxrh7/TCkdvCFR4tNZvaqVQP7jvnEw8xGeq2rbEEpk59lTKLUpSTQQjjyWsiLNAJ/CHDonaz9dcoiHNMC4OlzgSs3Nn/dLa47vOTETlSFz1rZh68fNppk1qUSxm5hd0F3JhZYyw+OuwA1+kkt63gXdjtiBZA0NHrLbBFjKiVgiS60Hfdb7PxWiIEzvAnsf/KwIW7az+CKdgx5LLvIcUuxB/PG5z7kIKYf8SpN1RfsVHZ9wUqyCdyDDxqb1CCafsPLwtta/whnbGgkO5HQUl//LO/NglUhpZdaWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpgpD7oc+ofi0DbdBk9Tn5P++fBjIyyFxvDUqif+9Oo=;
 b=I/fU2CkUow4UtGidMk5Zt3c30K5iulB8JvrEX2wPOeeFP1Ex8LjolcXhu8wPwTwd6sjrEvqRmDs3TuL4YrvgoeqdXLRMnUuaN+OSM9lptSbRHKOKehTucjbMdtyhjTxFzwfXzmAN2ThsHb2a5RtjiTPbZoraJL2IsXgjfsm7yxM1b4DuAgSpVcs4S4yvb9HPzi76UZF+AV+s3vqbLvNwD388mVv+dMaoIjtWfqvARrBNz+BlPCZ/Ai1myMEZXmVpxbVfKwXJDctVIzWmNK7hfEvQT/idmdZ/FtI9M8V1c441vlqdVjHk212wSTzS4uTNEItjwyYGPtiQHh7ga4lV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpgpD7oc+ofi0DbdBk9Tn5P++fBjIyyFxvDUqif+9Oo=;
 b=ahMNmni1DBfwgcC7zkDjIzNneqQJd2HjZ71XulXyCuzYBvkTXKLZwRMIJTCRkoAkSHu1CtN66IM0wYKrSbWqOGs1k2RCIS/A17Ej/4WdNktT9naPynvs26M9HtYcJdei6mWw4sTyagEfheW7LqYHZnorqENSldH7x9mlyVvdnPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7eab4bb3-f20c-6ce8-cb05-2bcaa8ac35f3@citrix.com>
Date: Tue, 18 Apr 2023 11:39:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: cpu{id,}_policy_updated() can be static
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <a24ace58-2ac5-6152-c42b-0037355ce9c4@suse.com>
 <ZD5l/y15PkJS8jbw@Air-de-Roger>
 <cdd717b4-dd70-fff5-eef9-33376de4baa9@suse.com>
In-Reply-To: <cdd717b4-dd70-fff5-eef9-33376de4baa9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0172.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 56999325-78cc-4050-755d-08db3ff92d59
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bQBibAW+PtAULtcHwRKBg4qNEd+S8dSQHtP+nBkd6i3/I9vwvuDlBxGxtgJpPZF8UzknMaYjLCarcOKzgktWxrfuCdkOPXpdIBh+7E7iBhyi+Uev3xUSdD9oZ4Ffle94vC/2p+sa7WTWAYUQ4+BPrpid/YY/f/0QUPR9dxRNXJC+beQloiBoTJq3V8TO7W2PG2UfiP8eQc9yE1s3Hw0Sd7U+Ek1axuCfLsv0TwLD5FXAfmZwhDTfYej+J9mnv/9tSCuZA5NLeR+sPhMw6Jy//Qkym20BHBVqXJBjPGXWABSLDwy8t03MwiG/lWU3fEdQ03wSZd+c1G5LR4b0obJCHprYqmVvfRSeFJx4hs9XHOXbBXqCRGLIAcPYGajf40H5u71HzFud3Pl85f/dEIe3/WuVYYmGI4myAHLaCx9ShK2EKVK1PrwNoo9uUSFyhPH2kjj4yEQkR8R7WsREla/bRoRQP2hr+1vSmziejhae5raFHyGI0Or1jtE/kajxbZREYFrrUsLRHBnFW1fdCqiQFpIKjSM6XhsmfqmEOoIwP2AeaEypGtZwQBzlg0Y8HRvwWQWBDZJZlJ1s/DENWdMrY7vEimqvEo5Gb0cekvQMXf/HpA+UjeIGLkNP6UDtWIgbNmA+k5fSE4gTo1bW0JmPJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(6666004)(6486002)(478600001)(110136005)(31696002)(86362001)(36756003)(2616005)(83380400001)(186003)(6506007)(6512007)(26005)(53546011)(82960400001)(38100700002)(316002)(4326008)(66476007)(66556008)(66946007)(2906002)(8676002)(8936002)(5660300002)(31686004)(41300700001)(54906003)(6636002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGJTLy8xMUUwUExoN1NqaktRM3Q4VWhQWUh4Mm0rQkVYTk85VE5hSEhpR1Fw?=
 =?utf-8?B?SW9yTnE3OHRxWDhMYllYWTBnR21QVVRlNUVDb0hVbzcrbnpnSG1mU1JyVGNB?=
 =?utf-8?B?TjZtckJNOEhWTWR6dy9JTitPWkpNZmp4LzVEYUVNcGlLc3J6bmJ6WXNVUXI1?=
 =?utf-8?B?c290d3crVytnb01FZ3VianNQdit4R2JpZENkMTVlRTRRY1NzMjdkZ25NOEkr?=
 =?utf-8?B?cElUbGZsTlVTRVBTbjFqUFRaaXhOc0VaTnV4UkFjYkhYYjhJVjdsMlczZlN2?=
 =?utf-8?B?UVZlV0NUaW5pTHYyQTBEK2lKUm1qR01xaUNIMFZ4ZGVKTmJrZnB3cHYyWFda?=
 =?utf-8?B?UWwxcldEMnFFYXBHeGN5UXVoQjRyb091L1U2TlpsOFNZZS9PSUc4Nzk0eWFa?=
 =?utf-8?B?S2d3YjA0cXFIQkFVU0gvYktnazBWcTAvNzl2cjJlVzZuTUpsSHVHZm84UE04?=
 =?utf-8?B?cDVIM2RTYXUwVkhkK1FxUVFZMXVaMGwyTnRURThEUUJza1dQcmRSNGpvR1Rv?=
 =?utf-8?B?d1dHWFNoditpdlhOUFRZaWZiN2kyZnNyRWRJaUk3cE55bGNYNS9La2g2ejNM?=
 =?utf-8?B?N01URml4NVFzTFNJOHl5QUxpckxkcUNsejRsanZUM25vSW54dU9EeGkraFpI?=
 =?utf-8?B?Mkd4WDJMRDFTUklHQ3NVVklOQWFFZjJTbUlLMnhDblFZTVplRUtXdHEvalZs?=
 =?utf-8?B?TzRadVRNcnY4eTJ0aTR3S1d0OWU0a0FiVlJoZkRSS0tRcFFyZjFLclVhcXVa?=
 =?utf-8?B?Yk41bEpUK2huaENES0dTTkU5VTk0bXJmTG5QS2ZORC81L3BML0ZiWUNQdEFF?=
 =?utf-8?B?VGxFUE4ySnJXWG9SWGtWc210ajB1bzQ3Qzd0cE5kdkNCUHNHN1hmeGsrUExj?=
 =?utf-8?B?SnBqOUlzU0ZGNGtYQ3Q0bVFBUmd3cGtFbHJxcTlMNFlMNEpSNzJmNkdZNU1l?=
 =?utf-8?B?UDFOREpGRUI3Y1RtZFJWQ011OCtFSHkyOGVPTlVUczllZ1FpNUllbHphSmhT?=
 =?utf-8?B?QVdCWWFaYnhjY0c4OERteTNRUU5vMmpiZ1dpNndaT25ydkhRdjR0bnJiSFBl?=
 =?utf-8?B?aWcySVVWYWdySDA4bEhSajhDbXMzUW5neG1kT0M4aTJvbmtVT3dPcjdOdmFS?=
 =?utf-8?B?aFRkWlNVUEUwQXRabkpjRTl4V0o3aUR5UnNXZnRUYnk0YjlDekZjOWwrbFBn?=
 =?utf-8?B?VXh0NmZkU21scm9MbEIwcER6eHluV2NuYy8xRXJwWTJDeGNibVRxanNNNUNK?=
 =?utf-8?B?V2VPNjFxQXlUWHNoWFd5elhZK0RLRGNqVWVsQnNIMjNJSC8zeDdISzdQZVpY?=
 =?utf-8?B?YUJaL25GbkVxRlpzeFVyaEtCRmY0MTFpbmNJOEFzK1lXbVcrZzkzOHVZMU1T?=
 =?utf-8?B?cTJIaHpKMURLWkVVWVhIbzNYT2s2Q2JNUFQ4MkNJU0xQK0RFWXpDVm1ZRFdq?=
 =?utf-8?B?OURuOXhwRTRCeWxkNUFiNnFiVkhZUmY2a3JXYi9qNEpOSldsMFc5dGMxYm5k?=
 =?utf-8?B?MTNsR0FvZHc4TnFnMnp5WEJRTnRJelhiK2dybmd1U254MENSQUZ6YlJydmVN?=
 =?utf-8?B?K0dNYTZrMWU4enBCZVFWQXE3Y2pnUlpkWGYyYlZXMi9OMnU5MS9aU2dXdHdX?=
 =?utf-8?B?T1lFQVQxSFJiMmZRYjZVeW91YlEwWEhqVFZHanc1cmh2UGpaNmlNcUpBZEJX?=
 =?utf-8?B?cEM0YWdlTUhGcVZEaTl1bGNLUTlhUTByemx6RGV3MUl4LzB0TU0xWEpMdTdK?=
 =?utf-8?B?WlQ0TjkzbEtvYVFZOVBLaGtrdDF3QXVNbUJWWjcxZVJpd2R1MTNVL1MyUmEr?=
 =?utf-8?B?U2VEUTJwdmxoTC9zUXRsbm5IdWJmekNQcE5XM1hDeXFoaW9NeC9BN0hmV3pP?=
 =?utf-8?B?ZTVUb0J6WGpKTEZtaTdyTGdaYkVnYjdrdHJsUHRjZkJDZzlWUWo2ZHpsMmhU?=
 =?utf-8?B?WUN0M0NzUHUvQTZpbFRZNUVrZzB2MmRzQ3RqUUtoK2plTWJZZlNIWWt0TTRq?=
 =?utf-8?B?bUJBOWR6U1ZEcWVYbGVRcUhiTzNzQnpZUzlvSjNua29YT2RkTEdCYkt5QjZN?=
 =?utf-8?B?cElBQzVaSTFFblRWZ1hRVkt6Y0c1OTQ3eFVxNnVXTXg0R0VsVFVuZ0dhUUUz?=
 =?utf-8?B?RFpFRmZEVFFUUUNVdjlhWmkzUGtYa3Ntdit6RnM1QWtDKzI4TnRGTFhEZUFi?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C7oVGwH2ifXlz4SJhc6b3OA+nx4NwQL9BW2wCsje9Pq/H/RGBdbhCUv39LXCk1AFkZ0he9axxVU+19CtqoxLNSkwslNnauTzgXxoB+s9Hop71rSgaw86+D9VkseDa4icQ8679twzjryt8uOJUfYkfMVRRt9JH/gp1Z5ahg7jfqgY0CrSPJ4xORjo+hanMCGzjLUUUcteAeTNudBDhogMguwHxq5Z0F8/d7h9WQrPoMuORNylqjdVzJJnf/uAXY2SWHuc/bzCTsqcYlfugWW023a7j8ChAHMYU9Ef89JEv6HnG3zJdd6TsZopfOE0Rowu/KWD12xeWzTs/4Gvd6pRRC36MMmcfzgeGD8pIxA2ZndJPbUxxHA6RLweTy6aa7IPDHEknkGfHdxQDYIee5IqBeooJ3hPW+2XdJsPQcPEEGp+z4oxFEgygD+MgAJFkvfuWTIhzB3frwNLSTZ6lS/1+w8qvZqk+nKrRUHmyPdPomc1FK43UuwDZ4EFPEaF+xMwy8mh5Q+7fNGCxTm2RmcNirsmAL+XDtk5RpOC9GEqYSKe1ePFXcoGQMbzY2n9/PnbxVhgjG/AXWcAUmG/v9ADEyzgGbGcsQFRzZDh9VuZKT7qcpSfkvmKTMJ3zay54F5w8YNii3XHsLTVKSKmLo9sKibqcvoGnO9MYQT8nV2oHGztKQgq17YeT2ICjHGF7tfxA8YNGfWs5YK1xMjLoS9pdq5nrfENYy7+XPqepF8r1S4/6yAvkmis4SSHN6YD7Mtk9s4jwC1twv+Xww8hfGTdAJWcRKsWDazQvgOxnQvX4vOnrxc/ywvc8Naf8ql1GgZXTe1xX4D6+DldVVwvlpj/rA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56999325-78cc-4050-755d-08db3ff92d59
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 10:39:24.5823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsZ3XxMpGzCslmjA0+fhTEAFzr7X+jOpC5Zqwr05AA0RMG202sQK2obJJelfNSJrTEdDmFIhCUUA6OR9MMnR0+Z4uu/KXcpllzw6dXvPuaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6974

On 18/04/2023 11:22 am, Jan Beulich wrote:
> On 18.04.2023 11:42, Roger Pau Monné wrote:
>> On Tue, Apr 18, 2023 at 11:35:41AM +0200, Jan Beulich wrote:
>>> The function merely needs moving earlier in the file to avoid the need
>>> for a forward declaration. While moving it, also rename it following the
>>> recent folding of CPUID and MSR policies.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> Thanks.
>
>> We might also want to rename the hvm_function_table hook.
> I did notice this, but it seemed orthogonal enough to not do it right here.
>
>> One minor comment below.
>>
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -288,6 +288,16 @@ void update_guest_memory_policy(struct v
>>>      }
>>>  }
>>>  
>>> +/*
>>> + * Called during vcpu construction, and each time the toolstack changes the
>>> + * CPUID configuration for the domain.
>> The comment also needs to be updated to contain CPUID/MSR or some
>> such now.
> This isn't the case just yet aiui, but will be soon. Saying something
> like "MSR configuration" would read misleading to me, so I'd prefer "CPUID
> etc configuration", if that's okay with you (and Andrew).

Technically it already contains one MSRs worth of configuration, which
is misc info and cpuid faulting.  It will imminently contain two.

Please use "CPU policy" here, which I think will cover things suitably.

~Andrew

