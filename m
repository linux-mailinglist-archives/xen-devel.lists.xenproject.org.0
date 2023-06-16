Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D603733AC5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 22:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550415.859487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAG1U-0008VW-8w; Fri, 16 Jun 2023 20:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550415.859487; Fri, 16 Jun 2023 20:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAG1U-0008TN-5d; Fri, 16 Jun 2023 20:26:20 +0000
Received: by outflank-mailman (input) for mailman id 550415;
 Fri, 16 Jun 2023 20:26:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4sU=CE=citrix.com=prvs=524b4a1dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qAG1S-0008TF-EN
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 20:26:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a43758c-0c84-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 22:26:15 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 16:26:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5389.namprd03.prod.outlook.com (2603:10b6:a03:285::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Fri, 16 Jun
 2023 20:26:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 20:26:02 +0000
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
X-Inumbo-ID: 0a43758c-0c84-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686947175;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D68y0Iuth2b8s+b9LkNbHLAaQ6fmtXQNRJM4hkJuQps=;
  b=X7S3ekO6WCqs0K/ko9XhFLRfW4DjbQem6MGTGcgusz/N3WDh5kKcixhC
   Wps+6rK8RMuXbXQ53wJ1F24apP7vReGNyKcRiylVJ74atSLhJA2mM7vx6
   spjpl7nG7yaVCJmCTJt5d/jYPOwdc6rT8IGo+lIqJSNJSDblzL0dBegZk
   k=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 115656598
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2lnCMqzu12VlCw3Sa8J6t+fExyrEfRIJ4+MujC+fZmUNrF6WrkUEz
 2EdXGiFPfyOMTT2fN0iYN6+908PvcXdn4MyTFY4pSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPK4T5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWISz
 OIieQlKVBKs2eXo4JaEYMMvvv12eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQvuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAd9MSePlp64CbFu77H5PCENMckGA+Ojmi2G3YJV8A
 Qszw397xUQ13AnxJjXnZDWjqXiNpQIVQNtXO/cz8B2K0KfS7AefC2UeTzhOLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcYVQYM+cLkpqkphwrTScxuFqG0iND4AzD2z
 HaBqy1Wr74al8IM2o2w9ErLhD/qrZ/MJiYu/RneVG+h6gJ/Zaamapau5Fyd6uxPRLt1VXGEt
 XkA3sKYs+YHCMjVkDTXGb1TWra0+/yCLTvQx0Z1GIUs/Cis/Hjlep1M5DZ5JwFiNcNslSLVX
 XI/cDh5vPd7VEZGp4cuC25tI6zGFZTdKOk=
IronPort-HdrOrdr: A9a23:8yfaf6BR3nA4yRLlHemF55DYdb4zR+YMi2TDgXoBMSC9Ffbo8/
 xG/c5rsCMd6l4qMk3I/OrsBEDuex/hHPJOjrX5Xo3SPjUO2lHJEGg41/qa/9SIIUSXndK1s5
 0PT0EUMqySMbEVt6fHCKbTKada/DEqmprY4ts3bh1WPGdXV50=
X-Talos-CUID: 9a23:UyKtw256sfudVkHYd9ss9xItBPp0SzrnzliOJBGYLVlDYv6tcArF
X-Talos-MUID: 9a23:YVLbWASWKqL2gFaERXTGlm1iap1P+Z/3GR8Mvpw9/OqucgtJbmI=
X-IronPort-AV: E=Sophos;i="6.00,248,1681185600"; 
   d="scan'208";a="115656598"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuFL4ODsf/fA6r5yoZmJZvhj4lkxAeaDuuFfBZCd3YOXZZHopTl0xHtwZG6x4TRINkCFPu8bX+HIEESjmipDf3P6qYbRzhZo+9pn5EEdyyT2NbqnZ7XP9xANcCWXfYU1M/BXSekAPvygy98RMfdeOa+7Dy/kdDfymqGuepj9gD/rk9vnqKR0zWyI7euOipVrCNzDjuH/ZybDaP4iEKSKhEMRFGYYjIp0cSQMFqWDMPYSaLBNAOMudui6MVc/JMcedn7aVNX2gSLXX3vPooYU4FyRx3gCTUOTLmK1PfeCCWmxJctbeIlC/NjAwE7/pGr6nwycjNdJyu4+jJNq9hl6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D68y0Iuth2b8s+b9LkNbHLAaQ6fmtXQNRJM4hkJuQps=;
 b=hyjHn1OKwXdMKs8wmWn42hIw3vCnXzrTQLZFcsB6daBnX9DOqPsvCone7j8kWg0hC3CNAXnAFKyh62eJV6iDR0G4E7JNhQr+286AuwUp/84F7/0mZp4tQhaIPkzRrzoqj5mRdeqQCgzJW7afaNhfAt6K5+h0DulN96KgcpkNDp7KOqbkPjuueWNP1dl3H4R6j8E3ifgksG2+pJe6jqXCs/+9q3+7iAWwey/6uiilN/a09salW9hMdnbtWsHecY8dtSPNV2uHf7SzW2ecctl36VksMaqsjXM/XJvPRORh5nDwbCVjehzYFEfJr8kscPXaVoONQaBMJQktu+m3gpH4wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D68y0Iuth2b8s+b9LkNbHLAaQ6fmtXQNRJM4hkJuQps=;
 b=l6ZWKpaGhyOmtTuseMWpacFhO/ccHeFkcxVD2LZeSx9WBfFalTi1JmYjRCXifnakG4qeY6Xs97zQaa6lvFfEnf66gavspZ5uzm2mSQxxiSZIe3bONQL42y9TLojZ61Eggdjew7U7hyRcx0viRR+aMNPBhCAgtdiVUYDoNP4Sp8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9a5a0ab9-6bd1-6498-43b5-4df782a4cea5@citrix.com>
Date: Fri, 16 Jun 2023 21:25:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 3/4] automation: Add ppc64le cross-build jobs
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <1a09823b03b5054c97efcf7008f9626d8ee83f49.1686936278.git.sanastasio@raptorengineering.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <1a09823b03b5054c97efcf7008f9626d8ee83f49.1686936278.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5389:EE_
X-MS-Office365-Filtering-Correlation-Id: 0483a8cb-3d64-4870-9be0-08db6ea7e71d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ajkoZjXvuFoiO8JyGdd7ab0j2Cl+wmCSNRttrhDGrjmPaItwWqcBjVsq2zkpk66mj8Bb1rgzUp8b82G6TUHR4ZoMluAd0EsdVhSaBEKC3Ol9sXkNMA7jp6g9/akGnf9HDCzAKQfHhbKnZCJybDkYpwlOy9Il376W/RotfHTzSU0O1k62nQPPkC71qto9Ka6qqtJI0DFcifj0NHHDb3CvQi8L3a8UtSykkLdPn0oprphbf83tMstqT/VycqpQjBV4yaOJUeIk/Wg3DS9PQYxVHVF6W3VwwNs6RH6kCFYK7nNIvYxsbuIMKw1u9DMy3SOjU+qaufvKmZBMyRT+I6uKV2X9E14NfBxFjutBSrFGWBKMpjM6+yG84WpWyW/VkTt9cHuDzqwjG+mOTMi5PXDP36tzjKJcfAySBsvmxixk/qe//SWTPFeGPHHQDS9Zk5yv+177mZHeSKeEdV2w/Qa86gHOvmWRvRvlP5DXivqBMnBDY2x0IhpBkpS9DNXeH6PlW3P67ib9rIoMJoPnUaJ5dWlFazh0mB4NNODs8XQgcAUi7ZXbrxCNV05hbmpN8ruc63UxDpAjhhwHIbhWBt26JEGuYvlP8Hmow8j1l+WZP62A/oEqe03qz0l3b/Z0Wx8tYq1GjojBrIndI+7We4VOxw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199021)(186003)(316002)(26005)(6506007)(6486002)(53546011)(2616005)(41300700001)(8936002)(4326008)(8676002)(6512007)(2906002)(5660300002)(6666004)(66476007)(66556008)(66946007)(508600001)(558084003)(31696002)(86362001)(36756003)(54906003)(38100700002)(82960400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkRwNTdKRllNdkhlaHB0KzVSTmdPdC96WlBPTno2MUs4TStHV3ZQVGxwTmN0?=
 =?utf-8?B?dnlROG9tdzlZWnYrQzFSTE1EWkZJV0JVOURTMGdYTUtCQjhuUE1hZ0tjT1o5?=
 =?utf-8?B?SG9zUmdJdldIQUlqNGFmWVA0aDJTV1EwLzFla2Mxcmh6VWdLTU1IZmhPY0RK?=
 =?utf-8?B?YmRQTU1BeGN0S0RCWVNzY3luZ3MxZ1A5a2hKL0RCUUI0a01RMnJTaFBLcEw1?=
 =?utf-8?B?OXcrWTRaNWtNWnJ5K1R1dUowQk0zcUpmK1MxNjQyYkhXMkExWjUwSlVaYXZo?=
 =?utf-8?B?SGtMQzZyOGVWQi9UU01RNVAvOWliLzNyVUJRRnBEVWV4UCt2UWJiWldmS2JV?=
 =?utf-8?B?RG93ajMzekpaQ25ybzFRSlR5UWcxaldPZjRJby9TM0pFcGUvNE1qd0QzV1Rx?=
 =?utf-8?B?b2s3bkgzN1l1ZWxsMHczOWNUV2UxN2FocTVCR1JBeCtyT2dkRmxUcmN1Yk4r?=
 =?utf-8?B?MThFdVdVLzlkQitnZWFLcUdSeWdUZ1BCdzlYZldUQUFKZEZHbm9selkvemsw?=
 =?utf-8?B?VFdZb0ozK2VYZ2lyMHR3amFzaHpIdUprcVJlZnVSY0hucnBPVVd3MXpvaEVX?=
 =?utf-8?B?UWxsZ3dIVFVYdlJPWE1NYm1mQzBjN0NoeGV1eCtRZ0lTek1YWFRYeXphcFJq?=
 =?utf-8?B?VzhJaVZTbXMvZ3IyVEl3R3p6RVZBek91VlJYOG83NGg0blF2WFU3UXJNeVlP?=
 =?utf-8?B?TjluUW51dURqaGxaZXhRUjlxUytSZ1hQNmRRS0tqVlZlV0drNGhHcnVudDRB?=
 =?utf-8?B?UUpmOGIwdy9lODR3OVNCeEZJeW8yeWJGbWJ1TElDSk1RMmZRcWtGR0xQM3NG?=
 =?utf-8?B?ZVBKeHUyUm9MN1NkUWZrV2EwWXRyTkpDallYK0RWM25MVW1OR2NqRktDc1A4?=
 =?utf-8?B?TGZUQnlqVUVnUkFFQXV1ZjEzSVVHVlo5bE10SFgveFAxb296a2t4T2E5c0xY?=
 =?utf-8?B?cjVvdnNaYlB0MS94S2VpVUNHV1JPNmNwSFZpQitjdllMY0p2Y3hJRmtoNyth?=
 =?utf-8?B?NGxGM1pPZnNGdzJ0WUxXa3JYTThoTTlOYWtLZzBKanVyMlluNDU0aTUyaDNL?=
 =?utf-8?B?ZTVHTDlSQ0p0T0JXMlArWmVUWStOSmZiOGt6K05CSzBiQ2YwNkZUS0xBa1Zr?=
 =?utf-8?B?OXNKd1JKQUJFYVZwekQ2MGtvYVQ5S1o5NkRhRUNEb2tmWmFwV2diK2lud0Vi?=
 =?utf-8?B?V3J1b2VVVXhlWmFSbkhTMlhWTi9NaEpXRktoL3c3RUt6Q0lTN1pwL2VJQjRr?=
 =?utf-8?B?OHMxZFdDS29VNEZoaCtOeDM1djVlcW9LWW11cTZLT3BvanFDUzh3ZUd0RFdW?=
 =?utf-8?B?NG4rNkZKc0U3dE5US0NhbU5ZQXd5OXg1K0oydXp5OWNrUzRZengvU2h0TFBv?=
 =?utf-8?B?NmpCajVmTDc0cG15QldMaHpjWkFlbjJWWDBxRCtuai9wcjFrMXBBTUlhVXls?=
 =?utf-8?B?M0NUUUk4RFoybmptSi93azlLWUlaaU9UWVdSMUxsdWhXVFptZGNVSm91ajJx?=
 =?utf-8?B?U3lncVhxVmdtQmRWSGVldnBVaVVGY2Z3RFFobHV3bWdvN2NqTUNaUDdxZklt?=
 =?utf-8?B?cU5LNGFNSlRLZStmYTZEUE02b2RxZFB2M2U4RFVwVkF5bXE3M29IS2RWUmlG?=
 =?utf-8?B?TXkvb2t6aUdWQ2ZVN1VCOGl6aGRsc2RMUG5YK0haaXdKYTRDeklXdm15RVZE?=
 =?utf-8?B?ZmZGWHFJaHE2WXVCU0g1WktIYkIyajRLTjFjeVhaMzZ6bUVZVFBtOTlVVVlU?=
 =?utf-8?B?KzZ5elllT09qZkhFK2QwbXdQa1BWNzFuQnNSNkxkRXdPcGk2SzM1SlBHbFZ4?=
 =?utf-8?B?RHRoR2cyUTVUUm0rV29mVzl2Z2dIU0hhTUh0TzNaU0JscGw3UTREZEtaTnNp?=
 =?utf-8?B?N3RQNVJkY2pBdU02bjNnSjk1eFQzN2VwWkdLcDBxaXM5REdrOEd3cjgzV0Fj?=
 =?utf-8?B?Z2lIcEw3c2JzalRLVVp1RHo4NFNidUFlWEsrUjZrTHJqYjd2RTNXdnFDRmJQ?=
 =?utf-8?B?b3ZabWNYRnlTKzB3K1FhMTRNRTNpRFg5VStsS0x0RkFzYWs0R3lGTGZTZlBP?=
 =?utf-8?B?bHlNV09EeG9JenN0WlpBL1l1Uy9PVzQyQndueC9Gb25GWHFOTUpYWUR4Nklx?=
 =?utf-8?B?Sk16Ukg5bnBIRTE1NDZseVpybU15QXV1OWx2OExZalV1NzhRSkE2RUVobVRm?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ALnyBluBaLThheyFvNPUKWl5undSOs0i4nuhrB4lpbWcHRarYbbSHGbuw5OKJKjLY9ni3ltcnpVirhI6DrR7LTaKhijdFK8U3s2iHrz8HwRygeNA8PvBHaG4IPzKSyv2vjsZT5sbpvT/cEFEjaVZFJem9xapvw2M4utLOt9Gd8T0RJDHPW1RB8U4UAw9u0huUG2YUAlWnqF5IF/Ej0W8lC+TBpATgv4pdSfeW/JguIBTYwgXSJPcZXK41jgLbWRfKTAcJlwkPZtsSNtU43NWOyv23LVWJvX5R+7BTWfD7phWeoqGj8w6tVqXRaVwiwcqQ7HHIcpmdScqLo+n8zijFtOJaFUJ5iz9VVSUN6AusJgdwMH26gyIvAXJXRZLOlLx2jJK2Rjtq2u1CweCl1PZsaPwVO1ZNK1wwPcd+3CfKOSTgOyAE0Pw2WM2eOP8/gqIBb00cvxSLp9OiI1vdA3d+1f3TQHpLDgCgTjPSndxaunZrNu2A/7Ab5M6IzLpv8rWAlO+P9mmUH0T5KIVRJ8zK9A1v/R2sb+5p/zUpFVTqk6RC1Hzm+/oczTxXtyEaH5UGxLvgFDFrc44XwDdSoMHuOdVSjK2Jnna2/mIwx7dxEUyzaLELXAEIh3CNYyar4sPHg2jGd30g+3oJOBQq3b9PhhrmnI69whk6g75ONxpsMiTZzBmX8DjPcZhb+eWGVP6RUtLTZgSWzwJTCaBffktWSzJCMEZoS19BvIlYfwS7FyPDL8dv4NYXUfPIEIg5UDAjNRAp6FJYfXk1Gcvw5qCWszaqW8Ci/I7NGM2grbphBwdHcLhE0RIZwcDHKMhy40gJCYMWRBuIWATTwCdY/SCAU3Vu1+5f/O5PV33UjxnsKPPml315wTLqgQc90cwKlxNJxfjFRbzcSqxrqSBvLbHEg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0483a8cb-3d64-4870-9be0-08db6ea7e71d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 20:26:02.2048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13ETCjN1N4YgE6w0M3/AyklMBwyUikg9AmUagyK7hOsOioQRvddxP7ZLv0xXWY+1B0y8cgjjygPfXYVinl8G3CQ8sd+8VFtl/H/zFgq7ntc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5389

On 16/06/2023 6:48 pm, Shawn Anastasio wrote:
> Add build jobs to cross-compile Xen for ppc64le.
>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

