Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C7F6CBCE8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 12:55:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515654.798751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph6yr-0003zO-0c; Tue, 28 Mar 2023 10:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515654.798751; Tue, 28 Mar 2023 10:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph6yq-0003xQ-T3; Tue, 28 Mar 2023 10:55:08 +0000
Received: by outflank-mailman (input) for mailman id 515654;
 Tue, 28 Mar 2023 10:55:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UojI=7U=citrix.com=prvs=444182d81=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ph6yp-0003xK-D5
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 10:55:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe27164b-cd56-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 12:55:05 +0200 (CEST)
Received: from mail-bn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 06:55:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6536.namprd03.prod.outlook.com (2603:10b6:a03:394::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Tue, 28 Mar
 2023 10:54:58 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 10:54:58 +0000
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
X-Inumbo-ID: fe27164b-cd56-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680000905;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ghup7X43Ve7ShV0jGKZUOfSzgg8oEtfXsxVzGBo/vD4=;
  b=WzQYcaJIT04afczcch2VAd7a4Sf4Bt0leHeTxOxfXvIfLxsHubc69GTp
   7k5nzfooPRB4YJhHBaWHPFdZiTKhfozfA7gdOdwpfK7ttBGZkoB51Szxd
   lc87/YQ7Ova8ycDPyrHDoWpRTETikQxFhUHcfWHalNc7Nb/G3ibWHGZJn
   8=;
X-IronPort-RemoteIP: 104.47.51.45
X-IronPort-MID: 103218658
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nUHXh68fvAIayjDybBtmDrUDaX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GIcDGCAO/eIZWSgedh0boniph5Q6JTWxt5lSAVq/ig8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqob5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklSz
 bszLC1WcSu7vM+rxJ2Ve+MwisQKeZyD0IM34hmMzBn/JNN+G9XpZfyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWKilAsuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiANlITe3mq64CbFu760pPNho3VmGBkeCzrGW+RIx2K
 WIKw397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnMM7QD0C1
 1mXnsjoDzhirL2UT32G8r6e6zi1PEA9D0UPeCsFRgst+MT4rcc4iRenZs14DKe/g9nxGDfx6
 zOHti4zg/MUl8Fj/7q/1UDKhXSrvJehZgwo4gTaWEq14wU/Y5SqD7FE8nDe5PdEaYyfF1+Iu
 SBen9DEtLxTS5aQiCaKXeMBWqmz4OqIOyHdhlgpGIQ98zOq+DioeoU4DCxCGXqF+/0sIVfBC
 HI/cysLjHOPFBNGtZNKXr8=
IronPort-HdrOrdr: A9a23:AFuIha8alYnF2vr6wH9uk+DJI+orL9Y04lQ7vn2ZKCY5TiX8ra
 vFoB11726WtN9vYgBDpTntAse9qBDnmaKdg7NwAV7KZmCPhILCFu5fBOXZogEIEheOk9Jg6Q
 ==
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="103218658"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TV1/DhuE5gHmEMQyuonNFZQkKAwPVQrAG3kEUwUxzih3aY/DnCheQz3UQoSQim52+bewdn2n0jz6XGFB2Jp3lBxH6DZBzJKT88rT5wm9mVi7A/pirukD1yA1jtZDgcbFd8pjQ4t7ObJHfnu7DvU/gYUEpUYKtJhV/YX5Pm1Ag3BxBkn5B3YWvfTZpla+AJmNaxwtR1WPWhOQnMrOZU0fnmqXQbBmICyC0DdWen/20ZbLhG4H+zv6qEELn8bTPCRvRiX7h1uofHopGFwal2xs51c8ckFWx7cHBssTUGUWZ8SQh4jHeqXmKNg2dUNCf2DXua4vVq6Mi/xZAI8aWVvhcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PynbXxAGCQq0cz4TLXXjtNT46kbM04f/9WFDZlFGHTE=;
 b=hh8aRudbqsFYdYwI2OxQUPNYcUtmSzGC2Gr1QMtXTUyPeawd+rLkWBgexcpqyWwB2sCbHSIpA2t1YksDUwJKmkNykQFH87tJUBeJI8qdS3ch9QdCq0Qc8QcHKwijJDswKRd0lBTmRwIwAcDvdbwFSxQUR3L8xlp1vucrj4GQKunlKfjA1BdUYN+V654kZ+dNbX1bOnOM/5Cvn0YSOcb7SfnwDc1oxGYL6Da/A8/VLVmWYpyfwKcVhGF3mc0xrdUi6YUNR7scaTUpez+2J9UdBC0Mu08xJkAqtwnycpcXBDMSd49WEixHMN2a7CzyXYyGGghbt4+XlrKiTWr+Cfoi1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PynbXxAGCQq0cz4TLXXjtNT46kbM04f/9WFDZlFGHTE=;
 b=nsIunUaWeZ9SS54zBYnKdU63ZqB0AdNQKefXtx8Qco0Rg26WMnxcuk2eqX13l8EZFW9cey5gtqwUvN+y3dDih6eG0qxufg4n2Nh2DtkopQkrtic0kMPOQhhSBCaUfzEgXnmNu+/cp2Y6rX18XHfJZJRHBkz0rwSv0m2NrLrmiJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <504baa65-7fd8-0492-55a3-48bac5aa7f27@citrix.com>
Date: Tue, 28 Mar 2023 11:54:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] configure: Drop --enable-githttp
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <20230324201404.3247572-1-andrew.cooper3@citrix.com>
 <d3d2c13f-5fed-4f02-91f3-be803b2f8588@perard>
In-Reply-To: <d3d2c13f-5fed-4f02-91f3-be803b2f8588@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0654.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe2a0c1-d2d0-4a2f-1a4b-08db2f7adf60
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KN48/N2DL0ggW0ZCmeyGzhXsO04XsutFoliG9Ws1ItE0lct5SN9gi6CTFnq13j+VWoE/1Mr0HY9g0ScmGrzoxWM54j7xiuf4m77vSsQCqlj1shHG91ueKgNhbtsWLeclcVnUjP+SJCfEuq9IleYhw4z84KwrsoeWwjzwxdotI4NR6vI36oql82xE8J3PXnheQBOma27BibbQUW+A7nzoRXKxb8QJC+GR0sTaN8vjK9xdFlPlNiL8/qisxJuMYUY2hw3UfNzHsLGeZM5WYufl0YUuHDAAROCq3NU/JoAqL4c7qwIgAvafOeKuJM55fekeRalhzZuQQgWGXzlIJqa76d4hPLbQonboSR/DPfNk/Jooh4YGn0yfPLqCze0CFdZ8m7q7Hajc+wZF8TNX0ANn30JthBYKuFvN6MTi6uiLMN4J9RYnU4wfg2yAyCuATOl470qrFmYFS9FGxl5wEPSW5cICC+Rc5weUbTJf5i0USPyAp+0lC1qSwJtT5/VMdKwLViLm/y1lxjI/HRhwCAjgttvU+bcTdgw7+jRbDDAgujPLdgu2eUGsZAW6fs2Xyf7pGRxkc1F9ItMeXYCfMHiE7WkNPnwa0pQ4CdVjJ9ufnh4tmPpTpEJahnJt+4637vhdjLg86JKYIIq3Xdt6bhwaHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(86362001)(38100700002)(6636002)(54906003)(4326008)(8676002)(66476007)(4744005)(316002)(5660300002)(2906002)(82960400001)(6862004)(37006003)(8936002)(2616005)(66946007)(41300700001)(31686004)(478600001)(66556008)(6486002)(31696002)(26005)(6666004)(186003)(6506007)(6512007)(53546011)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekkyV2pINVFmb0p6akxrSVFnK1Arb056ZW8vOTlycHR5NndUdkRrQURDVVVk?=
 =?utf-8?B?eTdRSnhVSmZieTJ6Vy9aU3Z5MDNqSWUrbWdZSGxSMk5Xd2twYkhpOExRakRD?=
 =?utf-8?B?ajhVTndkdjgyamxsTWlxdGxzdGZ5UU1IVFZoWHFaRVdGcGsrNEF0TWdmYmtP?=
 =?utf-8?B?eUJaelRiMG9yNC9GdUxxaG8yNUxwT2JFeVR4M2FQRHh0a3NROXBTcGozVm01?=
 =?utf-8?B?SDBsNGFkOFVFOG5XOVRzUHRSeHFJN3hVaDA1ZkY5ektDREM2WEpVam9XMkpL?=
 =?utf-8?B?cmpVc1J6V1ZmdFR2MVZqcnVlYXhBNFQ1RFkyclFkM3U0TVpvanBzR2cwRC82?=
 =?utf-8?B?b2diRzM5TEx3TFo2VlRPZjFqSHdvZ2hJQ0NBSVFDNHc2V2xEcnkycHpYM3px?=
 =?utf-8?B?NUNzMEx3N1c0am5sMmlxOFZzanU5d2FxNk1vdXk2Y1hqTjNKd1pCRUVZY3l6?=
 =?utf-8?B?Vm05ZnB1Zlp5ZWRLWEhWdmV6ajh6Z3JhdnVSdUtLVnl3UW11azhSVUtvTFFY?=
 =?utf-8?B?dlpxSWRBdWQzNkVVUU1rOGlTM01DNjV2eThsSWprY1ZoY1VQbG9hcG1GM0I1?=
 =?utf-8?B?YU94YzJVbmxkYk9iWXBpVzVXY2xWS1drbDFBQ002UmRINU1rL29ZRUtUTjNE?=
 =?utf-8?B?aDE2VjBKczlxc0piOFNkc20yRitKeTh2aHMydCtVVmVSVVFIUldKaWJqMmU1?=
 =?utf-8?B?WGU4SEtJMXY0b1BhSkJJMTFaSG5sMnZRZERkTmpGdTZQSTQxRWVyVlFSZ3ln?=
 =?utf-8?B?WkdNdTVNZ3dyamhUbFlkNER0dmdUc1ZBREJaK0wwdmZyUHpkUEtEbGx0WjJu?=
 =?utf-8?B?UzRKeVhLem1kdEJ6TzltUmU4dWhtaERYT2pGQWpRbHJ0bkZNeWVyNUovanFk?=
 =?utf-8?B?eFpUaW1FL2ZBNFRYMHM3NVp4aGtyQVdmV241Y2ZybjlGc29ka1UyZm05aC9v?=
 =?utf-8?B?YXpBV2s5cks2Y3YycGN3V0RGcmd1bTEvWHhMRGdMbmFONkF1MXlwZFcyejhz?=
 =?utf-8?B?WTljekJYYkVVelZNTTQ4QlAwMVZvSm5BS3crN2wzVlI5b3R5MHpnY0N6Wmd5?=
 =?utf-8?B?aHhmOEZJaWZiV2FDbmhnbCtQSE9IU25RQXd5Yytkb29keFE0ME1TNmhBU1Za?=
 =?utf-8?B?MDZxMzlQZGVrRFlta0dFUDRkM3hicHd5dEdBVE1rNmZnSHFWRjRHQWppWEdy?=
 =?utf-8?B?b1JNMkVBekZuNUhxb2dSRjZJOHZDWWVEdCtIUlo5NjNWS0xQQWd2TnEvNGc3?=
 =?utf-8?B?L2E1TFhaMnA2bWtnM3FybG55RWpER0NaVmZHb09HeHB5VlpScHZYeEF3TSt0?=
 =?utf-8?B?dnVmYVFQa0hTQ0hDMU13WjVIc1pPc3F6VEZaNkZpSGVpNzhWcjllazVvaGR0?=
 =?utf-8?B?ZnNiMDBVMzNHeEdTbGJEQkxKbXBta1h5YWRWK1ZJVnU0eE5hL2pMOGRtNm1G?=
 =?utf-8?B?OTN4MFB4TmRlemtuVU92M1pMZHRod3YxNkE5R3FHRGpEUzlmUzZsSjh5VzhH?=
 =?utf-8?B?aUZkOG85MUI1TXFYSWxPVE15Q0hDY2FoZm8wbWxPYWVsNW1TUjFHVVZ6UmM1?=
 =?utf-8?B?eW1oL2xhSHovclhEQU1PYzZETjYvYTFwMDNOaVgzUU9EaUk4K21KK0Y5OHRX?=
 =?utf-8?B?OUZzUWFNWjFoc2xCQ200ZElCT2habzNxRlRMOGVzUDYzeHNncVNuMTBkSjVl?=
 =?utf-8?B?VlBOVGZWck0zWDJNK25tVWlMUU5PQ1JoTHg5dGpNWEJDYVpjSTJ6VWpkK09u?=
 =?utf-8?B?aWM1dUpTMUJPNko0SW0xb0FaUGgrQk9PamZKNVhabkpibnMzM3pXVzdKY3Y5?=
 =?utf-8?B?ek9peVFQa3QySGkybDNwTHZkMnhHL3AxRFpwQ1NQR0E3eEZBWTZKWlJQank3?=
 =?utf-8?B?V1hBOEFSVVJ6L2djWEkrR2MxYXd2UkZTbTcvTWx2aWZyaXdEaVRLcmFOZEpH?=
 =?utf-8?B?UzU3SUhlRGlKYWtEbHNEUUI0empvRnE3VUUveVV3emUyc3NJZCtVOEdpeFlF?=
 =?utf-8?B?ZW5xNDNpUVNTNGd6ZGFUQklUc25Nck53SVFSWHA4MitSNUNya3l0YkkreU96?=
 =?utf-8?B?OFNvZUxBbHNHR0ZqdHBabkVLRCtReGpTeUMramxkSFV1cElzTnVyQ1paTzNu?=
 =?utf-8?B?Mmtzb29lR1IzN1NSSEV2VHJBRCtJQ2xVUldKMHh3RnY1bndnQzNYRjh6R0hZ?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KWtnptQtZj63v+kw3jhPsGKF7+C+LkQTdnK0zFO5aRNjwiEuSqzpPryQiZetpBEl/K10TfKXowaI1laknixdTED3A+BgGsS+eqxARP1yoB7OTrcUax7wdOwQDfFWAqx4atBZwX1e+1f++UsJLxvlpICUF/ZRe8nX+13ElGHm53ZONf1aXsIpBUVZmcD29n7cgC5pn52ERkeVdI8gTmqvq9dsXBOhvT6Udz2/a5ZKHhJE+AILiGqRiTdxv0Z0XSsiRV+MOrp2bOS1mEMkXsx7dnZpsOvy54BTY/XXb3DxdHSaQudaCdofy4v8vOQHqpvyJvbizXnMJh9/XBH/4Xgsa6zrZIawHRGjEw3w8i4cPav5b6bjBKL9CPwAe3p2Rghuiw5ywaqkLrSJn8LVst8DxM5T9blsvBau7yL82J5cjcD4uxirYHkB5viIYIeL7DjUAUm19ryaGapJvIV6Ehx/+LmAmq7cYvDdYdf1bC5TM4JGYx7/LW/ETQ36yEVbT/D5U03utjKkdCUDvSIam6JGHKsBEEKC2fE6T+/vJQWAkc4aaOttBbIN5uQhLlTsYvJQe0x6xAeh7z/vyNDTD4uUyPameCdR28uOzORrrVrQYhNaIy43XNpuFiJXlhXWJrSD2yvGxiVShBppwJwypm02hHEYzgt2cu+5wNqyBMwdY85ebcY4T91YjKOY2rSVFa1sWrO0WOxyx0jGwQFcz7+qRvnegqQqDJnV3sQc/HsNpdFeLNSIADIpnSG3fYEddlDh3zwPtL8RI7xL/AuxfkEd17tBN2ozrwqiL7k6jYIHCcp/cDLrbAE0DA2NMtvXVikU/q05z2keFv+2H91Xu/hLhVSSW2Ub6ecJuC4gcPEBEIWlHK1rUw+EiKRJTcNtaI9wucAX3rMmcu2QVWMMITTyH93/eqd3WZjyVsxgJPLTNU4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe2a0c1-d2d0-4a2f-1a4b-08db2f7adf60
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 10:54:58.6334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZNEXqEaA+V9sg4gaLCVK26MKixj8mNVTQlUlX0fA/rT7O6ASuHR5Wx1WauIlKyKRto+tsh3exWxN9dvkPGobnhWNGlDwhW9MenSxl5u6JM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6536

On 27/03/2023 3:00 pm, Anthony PERARD wrote:
> On Fri, Mar 24, 2023 at 08:14:04PM +0000, Andrew Cooper wrote:
>> Following Demi's work to use HTTPS everywhere, all users of GIT_HTTP have
>> been removed from the build system.  Drop the configure knob.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Do we need a changelog entry about these changes? (That git clone are
> now default over https and --enable-githttp / GIT_HTTP are ignored.)

Yeah, I was going to write one after everything has gone on, because its
more than just this one issue.

> In any case:
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks.

~Andrew

