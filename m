Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB955FB65
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 11:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357697.586436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Tie-0004yY-PI; Wed, 29 Jun 2022 09:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357697.586436; Wed, 29 Jun 2022 09:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Tie-0004v6-ME; Wed, 29 Jun 2022 09:10:44 +0000
Received: by outflank-mailman (input) for mailman id 357697;
 Wed, 29 Jun 2022 09:10:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JXcD=XE=citrix.com=prvs=172c93792=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6Tid-0004v0-56
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 09:10:43 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5812a8dc-f78b-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 11:10:41 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 05:10:37 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MW4PR03MB6329.namprd03.prod.outlook.com (2603:10b6:303:11c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 29 Jun
 2022 09:10:35 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 09:10:35 +0000
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
X-Inumbo-ID: 5812a8dc-f78b-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656493840;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=prmL4w+zXxLZzai1GxG4oCtlsLRjQinUhA9zyDJ0J5M=;
  b=AHwQbJK0Z/mt7ioGpm/u5yD1rbz9bF59JV35mqveF37hgI75zMBRnz4B
   iMoJk2yFPXitqq9VpNYcjjYZgxk2Z2wYQiqlpV+GeY6xZwR0sRSiHjeFl
   sfH/FTpoP/zBbGKkEImXm4YL/OfpO/s6QFM4mNVxl309Pgt2w95ou5sIs
   s=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 74666284
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NgDGp6DLqJ6tyxVW/zviw5YqxClBgxIJ4kV8jS/XYbTApDlx1zEFz
 DQYUWvUMvmCZWWjc90nao/j80JV6MfXn9djQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgH2eIdA970Ug5w7Bj09Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhak
 NpMiJaZdDwgGYbnhNsnYRx5DAhXaPguFL/veRBTsOS15mifKj7G5aUrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t2B8mdEs0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLj02CehKW0EwL6TjZolpG3D6hB06uTGENiSatrQdOQWx3/N8
 woq+Ey8WHn2Lue36xCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa9lGtCN/0XBS6oXuNlh8aR9dUVeY97Wml1a788wufQG8eQVZpcNU7sOcmSDps0
 UWG9+4FHhRqubyRDHibprGdqGrrPTBPdDFTIygZUQEC/t/v5pkpiQ7CRcpiF6jzicDpHTb3w
 HaBqy1Wa6gvsPPnHp6TpTjv6w9AbLCQJuLpzm07hl6Y0z4=
IronPort-HdrOrdr: A9a23:LYLI76haYSiECXQA+NvThgW9UXBQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/hSQRI+Lpv+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+6emsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30l8dFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNPN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wWJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tAB+nhkjizyhSKeGXLzQO9k/seDlAhiXV6UkaoJlB9TpX+CRF9U1wtq7USPF/lp
 H52+pT5fRzp/QtHNNA7dc6MLWK41P2MGLx2UKpUCPa/fI8SgTwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.92,231,1650945600"; 
   d="scan'208";a="74666284"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F60QSMG2JrSPiCIBAhqIvhVAP+cmAItPVHjOwGA2BD6Kk7LsfTtstkE20h8CkwNQcTro1ILJN3k818Jh8uS+w8/FNelxfb8iNZ0vt1UNuCJHEaLBHau/bJr+MpHJxvA/C0t+dYM1DYRc05uW2FTDpiDKYkl44sItyLELjgu9U3yBHOoztCIEfr0xAHXjnXryqZLRVR24yrFA+n7nQqk1TpPxBBnjSbD6vqH+kE+tzi/MwOv0rf+GYWm1xq5GcoYGZwZBDVQ7Q+8BrjRXTwntWMKbyiMdBpcVUU+9mXiC62Dgy2iA8Db9bjIhOXAKT66bQ3aYA8exWHppyzpLB+RYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=546m18QLwJdo3blaNNbrIhLdTBlakkue4/DRTTBf2/s=;
 b=SigGM7lUvRBJvMVj+3mnVZQsTgVu560CFf7WJa34gGaT9NnGR5ML1VFIKRHaTtyoMRdDxwhSyY3eK+OlKktU5kBNwSGb+Svop5ScQ/S5HdoWNNJBp9irndgX+mfdGQjQo3KywApcQtbrXMrYNfdfXREMSwOP6kRi6lPWaI36AGeDIobupgq9kUA4/a96wgPo5m+rgvGTVf6uOdBiDR5cVXLLKUvkcJIURpEJWX25NS329UbFrcgaWqEgl79FV5qB1zkIKdmUuoIPE0ZZVAdDwM0+9Sgzpj7sz+XCLJy5z8Zyhju1VrfFwyHwwB7LivrQzO7xvLzkKyyziaJByOYJ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=546m18QLwJdo3blaNNbrIhLdTBlakkue4/DRTTBf2/s=;
 b=k7YDzfXDhbJwOno2AV2YI/3J/pNd46hey2pAu9lC1ozWuJHv9WSaJPf7uxbuvWyK+9zpHSEfuVMJ2HKJChCdYYDpG6KBU7k4YCx7kSAhFAphuPPIc/4Ht6zm60g+eaMiLTmkIGhSLdnaTVmAkoGWFvRq292eA/XQvIENHOflkUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Jun 2022 11:10:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>,
	"Beulich, Jan" <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Nakajima, Jun" <jun.nakajima@intel.com>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] x86/ept: fix shattering of special pages
Message-ID: <YrwXBtvpIl81GhQ7@Air-de-Roger>
References: <20220627100119.55363-1-roger.pau@citrix.com>
 <BN9PR11MB527685F117AAA3C1716A41EF8CBB9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN9PR11MB527685F117AAA3C1716A41EF8CBB9@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: LO4P123CA0446.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18533b92-3caa-4b06-227c-08da59af39d8
X-MS-TrafficTypeDiagnostic: MW4PR03MB6329:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ig3EGHCubhIdcA+DEFEhPLMXIQR8wJqYIK4WV8LMIjYeYO+d72PE6WZYrlH3EwwDRdewoXqEThpIncGn9Db83OIMmodagLWF0ep4+QmaSb+c/NvHk9spc40gm4WULmcZdU+ReFAfcPHDsfeRY52HL3RFkdZ83wYjWHprzd/p9JEFTdhwlaNQroJnlgZXH9anGCGREsT9IhS6qgFiP+Jto6+SJk4zxyvqrb7sGlBgyYvzyebVqaslbqbpVAUbjTS+uc4eYPh/4xlojvkBk4RkJJR4YuQ7TSHmX8JKE2nn3dDbkqkELAiTtFDDrUj93xz6Ot8BZ1QdLb69FyhyUJJCrZMiaUE3w1clYBTseRMY0a3nxGDdiCbNJTT+0N0eo5eZI6DFHrCQjH1SI+2fs9jBmCInda3dgHR0myrqTPOX9Qga7iivxFLvwZWFdQDw9DZ7HxP4Z8J8omVPdXhe/+BfeSdvMnoLK4whxY40ge0+bDnFR5uyK+ZhRCRrBnD+n9V3ddaUBWhu0NW/p/HNqOvVhi7fVckblCa2BCzqmh/PFOhIgCJauAUkQ0SASQHr2xsNTOJdiiS6Ft6m7LzIDve+LFZlNiq8j+3P5gHtyHBaY5PwTLRbLMI8PbMWrVknG/O/DRWQxbQP4XBIVQDMxNMfXcL0toNS4Y1btSvbo6O/dFKesMdSWgcQWum9TxjZi5dsal4lIL+NRMgYGH4zfnNAKk7g/RymCLHEDj+xu0NWGNehoUgfOs6LzoBlCS8y0Ay4gQeysa/S5BDoTpJKtN1oBeM050zOwPVACd8cPqmToM0NKEqr7dZID9RUgtFprwKx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(966005)(6666004)(38100700002)(41300700001)(83380400001)(6512007)(2906002)(6506007)(26005)(9686003)(33716001)(85182001)(5660300002)(8936002)(86362001)(478600001)(110136005)(54906003)(6486002)(82960400001)(316002)(186003)(66476007)(66556008)(66946007)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW5iS1ZpZUZuN3pUSDRId2pmVkZvN2YyV1k1c20xMjBJWURxQ0pDL0J6OXAr?=
 =?utf-8?B?NThGeVlrT2VTZGJ1eTJVUUhGcVhDNFBoOGRNN3o5N3JwTFNha3ByKzhha2U5?=
 =?utf-8?B?eGVtdVlORlhzNnBEMXhhQjBuR0tBQkVwbS9DR2x0Mm4wYTJrcnBaR09tQUxo?=
 =?utf-8?B?UEdxVEpkTVZ3eHB2RmxpSndYQlhta3poOUlzSklkR3ByTlc3ZU1NQllEWUQ1?=
 =?utf-8?B?RFl3ZGdOSEw3dklNdFRTc2NUWGp6V1NtUFBVaDdObUNkTGkxY3VNeXU2Qmhx?=
 =?utf-8?B?SDFBVFJqdzR5L3N4WVV5SE9uem5HWFMwN1ZSQkFlRU12SENiU2d2WVNkbXZv?=
 =?utf-8?B?NXV3dHprT2xUSFZqMVU1N3FzSG5XejUrajVheUdWOXdqdVNiY0xlM3kzbTlC?=
 =?utf-8?B?TjUzS0h2UmJBaGN5SDRDeGhJMDExcWtoSXFZVVJpVS9XRjdicXJYTER0QW1o?=
 =?utf-8?B?elRiTlB1L0J1elBwRzZjK0JLSUV0SEdocE1yYnRPOGpUeGtIaGN6ZzRYajlz?=
 =?utf-8?B?UThCemh0eVZFSXp4WFdzK2pRZy83ZnAvc05sNERqeFBmM0plTVN4Mkl2Znhq?=
 =?utf-8?B?aWtoaFRSNG9RV3E3TWtwNjAvL1RuMmxLRXZab0NIbTA5SlhSZUZWY2tRazA2?=
 =?utf-8?B?Ykx2MEFjOWhsSnpIZngvV0o4U0xHckVpKzF1UUpZUTVKZURGcHFjNU5POXZn?=
 =?utf-8?B?M2tvMWlVKzFCTk94c3N6OUxLNkxiYlRhV0ZHcHhNOHFZSXhIOUhFYlVNUU5u?=
 =?utf-8?B?V0NkTlhBWXM3Q1lTbjR5S0xnbkl2bllIeWo1UURVRzhVeWZkUWcrMlZWL3RM?=
 =?utf-8?B?WEI5VG83aGZibWRYZ0owMzUxdENRMHJKM25KU29GdFMwcmdyYkx5LzZKZjVW?=
 =?utf-8?B?alBTa0ZTNTVFcnVRK29iZGVubGd4eVlxcmZZa1ZmbXpiTko1V3FlRStEdDRF?=
 =?utf-8?B?ZEUrZTlnMGdYSTczMlpqODNNaHVxZzlUandWOG1BS0pBRDB0L3VzY1ZVQzNT?=
 =?utf-8?B?TG9mZHJseXFSMENoVE12UEQ1M1FEeWhGdGJvMkxGTmtWbndONnA0Q29Oc1VG?=
 =?utf-8?B?dWc5QVdvS3B6a2lDYkFlQVBNK3p4Z1hqQTRBTUxwdFVZM1A2ZjJGWDNaNEFh?=
 =?utf-8?B?ZUdhWmU1WENKVkVEaHFoN1lqa2hTRDBocXZDNzc0MCt3bVVJWUVyWXRCNzcv?=
 =?utf-8?B?SEpBNXlFVWI4NjhaRkJMRG43WWVrMGVOVzJtZEl5aFZOQ1MvTm1vVnhtYUxo?=
 =?utf-8?B?S21qNUQ1djZkVEk0cHlhU0hENTJWM2p0ZjVXaC9DTnZ5TUI4Mzhmc25NTEJ3?=
 =?utf-8?B?ZWpJRkxzckxxcXJ1OHpsdHgvMFR4L1ozQ2ZFaVN2cVlDS3MvZ2ZuS0pPaVF5?=
 =?utf-8?B?Tk1JSnNacCswMDRzKzdYNjNKZis1Y1BBRXVCNVAwWHpkK3daeGtLN2dJQ2M0?=
 =?utf-8?B?RUJOUS9qZHJWbnRINnpLdStPL1FUOUZKS2RFWlpTdnU2RTJNOGtjZ3F4U1dO?=
 =?utf-8?B?SitFNm1qRlFJWXNtc0dUVlZjWnlvbWhzVWR5bmhScktxV3ZITmRLaFpVWUpa?=
 =?utf-8?B?UFBGVG9kdllpTVNLeTM0MEU5NDA5aUU4azk1QzhkNnBTRXh5eWh4Qk5kWEVG?=
 =?utf-8?B?NU1ObmRFd1ZEN1F6QnRaWEpkRVZsRjg0cEZyMllrb1ErOHVaaUd1YlFaSXpZ?=
 =?utf-8?B?d1dtZjVZVGFWcDVxMjRVMmNrYkZ0VG5Na3pBOE1MYzVlT2p5MnhSMzIvL21R?=
 =?utf-8?B?cjhQVHV3c1R3WUJIS1JKeXlKd2hzdG12Q0lpWFRtSEduMGZ4WjM1V29maUx3?=
 =?utf-8?B?eTZLY1RaN0MwclE2Q3d2V1NaS2JwdVFhTXJkWjZ0cHQyalMxYWJqSzJDYUFh?=
 =?utf-8?B?OWRZckFPY1M5bE9mazVVOEltVjhJL0M1dVhzUjVKR3psVkZISTZEV28zd01E?=
 =?utf-8?B?YzBMWWRkSnlMd2xlcHUyRFdIOUFBT1JUOFF3VTA5RzhqSlE4ZHFVbnNWS1FY?=
 =?utf-8?B?Z212eGtZN0FSZUJaZ3R2Qlp1ZkNHZ1BoT0sxM0ZiQlR6R3hTU3ZXa0h0VjFL?=
 =?utf-8?B?bXlsV3Q4TlI1amRVU0loSERQOTZId3E5ZzZZMnROVVdrQ0J1Wnovb0ZpS3hR?=
 =?utf-8?B?QUIwci81Z2MxK1FSMlRRNzN2WWJEYzNXdlBwOUZLNjdUUHgzZlFhZDRISkVo?=
 =?utf-8?B?MkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18533b92-3caa-4b06-227c-08da59af39d8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 09:10:35.2535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZwIRGDdWy/pOlpDHZHa8Mua6jEVM6NPO+lOoXmfyG7VtT5YJDLS4MChMLFnGagTkENIeBR3VIAo0ajaJohTkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6329

On Wed, Jun 29, 2022 at 08:41:43AM +0000, Tian, Kevin wrote:
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: Monday, June 27, 2022 6:01 PM
> > 
> > The current logic in epte_get_entry_emt() will split any page marked
> > as special with order greater than zero, without checking whether the
> > super page is all special.
> > 
> > Fix this by only splitting the page only if it's not all marked as
> > special, in order to prevent unneeded super page shuttering.
> > 
> > Fixes: ca24b2ffdb ('x86/hvm: set 'ipat' in EPT for special pages')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Paul Durrant <paul@xen.org>
> > ---
> > It would seem weird to me to have a super page entry in EPT with
> > ranges marked as special and not the full page.  I guess it's better
> > to be safe, but I don't see an scenario where we could end up in that
> > situation.
> > 
> > I've been trying to find a clarification in the original patch
> > submission about how it's possible to have such super page EPT entry,
> > but haven't been able to find any justification.
> > 
> > Might be nice to expand the commit message as to why it's possible to
> > have such mixed super page entries that would need splitting.
> 
> Here is what I dig out.
> 
> When reviewing v1 of adding special page check, Jan suggested
> that APIC access page was also covered hence the old logic for APIC
> access page can be removed. [1]

But the APIC access page is always added using set_mmio_p2m_entry(),
which will unconditionally create an entry for it in the EPT, hence
there's no explicit need to check for it's presence inside of higher
order pages.

> Then when reviewing v2 he found that the order check in removed
> logic was not carried to the new check on special page. [2] 
> 
> The original order check in old APIC access logic came from:
> 
> commit 126018f2acd5416434747423e61a4690108b9dc9
> Author: Jan Beulich <jbeulich@suse.com>
> Date:   Fri May 2 10:48:48 2014 +0200
> 
>     x86/EPT: consider page order when checking for APIC MFN
> 
>     This was overlooked in 3d90d6e6 ("x86/EPT: split super pages upon
>     mismatching memory types").
> 
>     Signed-off-by: Jan Beulich <jbeulich@suse.com>
>     Acked-by: Kevin Tian <kevin.tian@intel.com>
>     Reviewed-by: Tim Deegan <tim@xen.org>
> 
> I suppose Jan may actually find such mixed super page entry case
> to bring this fix in.

Hm, I guess theoretically it could be possible for contiguous entries
to be coalesced (if we ever implement that for p2m page tables), and
hence result in super pages being created from smaller entries.

It that case it would be less clear to assert that special pages
cannot be coalesced with other contiguous entries.

> Not sure whether Jan still remember the history.
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01648.html
> [2] https://lore.kernel.org/all/a4856c33-8bb0-4afa-cc71-3af4c229bc27@suse.com/
> 
> > ---
> >  xen/arch/x86/mm/p2m-ept.c | 20 +++++++++++---------
> >  1 file changed, 11 insertions(+), 9 deletions(-)
> > 
> > diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
> > index b04ca6dbe8..b4919bad51 100644
> > --- a/xen/arch/x86/mm/p2m-ept.c
> > +++ b/xen/arch/x86/mm/p2m-ept.c
> > @@ -491,7 +491,7 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn,
> > mfn_t mfn,
> >  {
> >      int gmtrr_mtype, hmtrr_mtype;
> >      struct vcpu *v = current;
> > -    unsigned long i;
> > +    unsigned long i, special_pgs;
> > 
> >      *ipat = false;
> > 
> > @@ -525,15 +525,17 @@ int epte_get_entry_emt(struct domain *d, gfn_t
> > gfn, mfn_t mfn,
> >          return MTRR_TYPE_WRBACK;
> >      }
> > 
> > -    for ( i = 0; i < (1ul << order); i++ )
> > -    {
> > +    for ( special_pgs = i = 0; i < (1ul << order); i++ )
> >          if ( is_special_page(mfn_to_page(mfn_add(mfn, i))) )
> > -        {
> > -            if ( order )
> > -                return -1;
> > -            *ipat = true;
> > -            return MTRR_TYPE_WRBACK;
> > -        }
> > +            special_pgs++;
> > +
> > +    if ( special_pgs )
> > +    {
> > +        if ( special_pgs != (1ul << order) )
> > +            return -1;
> > +
> > +        *ipat = true;
> > +        return MTRR_TYPE_WRBACK;
> 
> Did you actually observe an impact w/o this fix? 

Yes, the original change has caused a performance regression in some
GPU pass through workloads for XenServer.  I think it's reasonable to
avoid super page shattering if the resulting pages would all end up
using ipat and WRBACK cache attribute, as there's no reason for the
split in the first case.

Thanks, Roger.

