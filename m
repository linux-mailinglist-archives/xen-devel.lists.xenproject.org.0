Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092DB60E2C4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 15:59:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430603.682489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongvT-00039Z-Mq; Wed, 26 Oct 2022 13:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430603.682489; Wed, 26 Oct 2022 13:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongvT-00036C-JH; Wed, 26 Oct 2022 13:58:35 +0000
Received: by outflank-mailman (input) for mailman id 430603;
 Wed, 26 Oct 2022 13:58:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Ky=23=citrix.com=prvs=291e24488=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ongvR-000366-C2
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 13:58:33 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45379bef-5536-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 15:58:31 +0200 (CEST)
Received: from mail-mw2nam04lp2173.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2022 09:58:20 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH7PR03MB6972.namprd03.prod.outlook.com (2603:10b6:510:12f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 26 Oct
 2022 13:58:16 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 13:58:16 +0000
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
X-Inumbo-ID: 45379bef-5536-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666792711;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=EP5UQJ08KDhkBYVopzuTynVIcU3wGlXQdgLq8Yv5nM4=;
  b=SFWOCsk5oZf9AmnYd+dF6ecDCXpLVpjyQml+DmNWyOnio9b9GRS5+Lwo
   HDTG71j84V6Fv230bbRAb5SNeqTUzWxc+BBOsQiD5fQVYtH7X2Ik88PkD
   BAJpDxBpdNOlRgiQajgnnccMp9/4AaPXuHrA63Iyp0NyLBTjPOSz4p+lu
   Y=;
X-IronPort-RemoteIP: 104.47.73.173
X-IronPort-MID: 82645052
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2kIBkK2CnIroyotbl/bD5fBwkn2cJEfYwER7XKvMYLTBsI5bp2RVy
 GJNDD+Ga/fZNjH8LYonPN6y/EME7JDQnNBiHAVupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GlG5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUa/vpVX28ey
 MciCzQdSyzcuPiskKmSH7wEasQLdKEHPas5k1Q4kXT8MqxjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g3O4/NouAA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WrfrC7x3rKV9c/9cNJRSLuV6eJLu1KC6WowNjZMZV7nj+bs3yZSXPoac
 ST44BEGr6I/6UiqRdnVRACjrTiPuRt0c/pdFfcrrj6EzKX86hycQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9URX5NkcHbC4ACA4aud/qpdlvigqVF4k4VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:yydNB61umPT5USDcFk9D6AqjBVdyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtrp
 uIEJIOdOEYb2IK6voSiTPQe7hA/DDEytHPuQ639QYRcegAUdAF0+4WMHf4LqUgLzM2f6bRWa
 DskfZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolys2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RLYGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUQTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+qZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wVh4S0LpXX9
 WGMfusqsq/KTihHjHkVyhUsZeRt00Ib1u7qhNogL3U79BU9EoJvHfwivZv3Uvoz6hNOqWs19
 60TZiAq4s+MPP+TZgNcdvpEvHHflDlcFbrDF+4B2jBOeUuB0/twqSHkIndotvaMKA18A==
X-IronPort-AV: E=Sophos;i="5.95,214,1661832000"; 
   d="scan'208";a="82645052"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nw2gOw/oKOhSTbMGB3p7ueCKOOH6+0EonapNKIi+YHTB95X7sZU7BNwL3cgpc6/vRwp4lqztjNZ+uXRzktoEpsCwG6PZuXe9Xh/qU0Eo/0cxg0x4w2Jv7fC8VzK+hB22lqTBcmxbX9C3f/oYnAK15jIYt977dahPPad8Pv2b4A35jbQUmNwR2s2Df0T/LhxSIcMLen0bvtum1nZHiiysmNE5bC3TroSvvUJmmzDCGN1+z8aGVKVrhN/Q+oBM+4zPbqg5vAoSPuugwtd9wQ9Gk5ZK4ro7k//I8XFY0jqO9xDqPH0UuBIHLCX/KFHi+vkLJ0MvxlQz7Az4U19K82wtSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qSp6mfsVSYJSkqhY8tIio+vVK4ih0bpe64V9TSGzyU=;
 b=cloopdE8EuhEjds2PkNnlt9gcY++qRWp9d9+ref3/IbrijDKh5Z9AETaqmTdRDraF/8qr4H9hPaEGAHjPd/+/gl5vU2hyWX7EABRj+bxt/8ppMjWzPr4PgKhMftdp+QaDK9Ae8l/3/a1Wo6yKJNtU+L82jDyopqBSAI2QC6TF/P6ljzN91rwKbcXM+oKHPhtEGK31G9e/AxcfukdQ4/ZY7fnNqFPzmBRvtxVzwB1z5qG1XoM4lnyknwTrfhS5KZFjviyyd7rVb5pck6/4YVoSOXkZd5SYGgkT+VO8TuWgFYXBzOvV4Rywb0424V8/1lDAEQtA09WE1KcSwyEkcWfPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qSp6mfsVSYJSkqhY8tIio+vVK4ih0bpe64V9TSGzyU=;
 b=NKFU03qnrH4ae1inMK+2CIVdSL/x9stt7udTGL4PG37eT4xhWlBVRtK/GDCpasWLGSQv8UD6PWExEA0q78jVS65E55IBYJN5tPvGG77fxtzlUpg4RciXh5tpX6XDunfARB2q1jy7biC6UQ2VR9XyjlyOSmA36rqjunhKCOXtIUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 26 Oct 2022 15:58:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 v2 5/5] vpci: refuse BAR writes only if the BAR
 is mapped
Message-ID: <Y1k88uhbSNdMvsa+@Air-de-Roger>
References: <20221025144418.66800-1-roger.pau@citrix.com>
 <20221025144418.66800-6-roger.pau@citrix.com>
 <666377e8-fe58-bc9f-70ff-2e21d93c691f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <666377e8-fe58-bc9f-70ff-2e21d93c691f@suse.com>
X-ClientProxiedBy: LO4P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH7PR03MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c5e006-0c5f-4746-b04f-08dab75a215a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NbM3KcksN/bhwzQUPS1TXahiv0b6UYf5bvoYR8vJv8E1RtptM6/VfXro8sNsn5aFD73pBFjPOWU/0lx8wvyX7XfWcGLaa+Fv/gEX0v7HPihKWvcPDJWLlOs5b7Wkilqq8JOL0TU9tBV+PSmodHHmj0vWgI86awLyvubIHXatMwH/VV2YIvAam1QPd6kEDmZZgFjnxtiYzL4omznCxrRqC/VJkUHAxNtOolNRJRho6y8M58cOehiy1KwSRaYnkOEeLBHx1QSLJUUXF/j20IDqsB/0foF1eArTALaGDe+SkXNmhr0qzxUtRksEFc8wNi+O9v4kRrGF1uvaL3fnQI/BdIo6ds/2BRLyKKt4dkE3/+8FuS+2FU/aVtgozDdRKWoFuTY/nMcAc/eLXKuryGvdPxnkiCxGZbrAOfJ2XkS4VEdH2bTZr9lZqFUmMcH3nKsqmMGV6Wq0sfrQ1llzOLOxq6bB127pkfskgUhnvyc6+kFJeDnyjAQ60/gjOrNwHsWyyFugGfI3w7I5HkYCWEYrR9bYkaoMQWfP2xuUmo3f8U3nsMNeoddC4V/iVOKUk7uy2zB6CGjE0qXgPuDrkcqXgLiQu/rhHA/4SkqMjXpAs6lSMCzCjEDJynxdTYQc/LfVvLQAiUfvx59ny7VHKZr0rGRjxc0Z4fgkXTCcZgP08ql4/CAcZzodq7Ydi7dciDfDiYWawLQCpHNKStjfdiy5lQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(33716001)(478600001)(38100700002)(186003)(66476007)(41300700001)(83380400001)(85182001)(6666004)(53546011)(6916009)(66946007)(8676002)(5660300002)(26005)(2906002)(6512007)(82960400001)(66556008)(86362001)(316002)(6486002)(6506007)(9686003)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3dxcUFMVUVqc3B6ODlocmhlQmpNZTZMK09tVnpoR3laM2VCeEcxaWh0VFJ4?=
 =?utf-8?B?cjFudXhrNytmWStRNFVyUjhGQ2hmRExBSFpSVCtFek1VcGVPNnk4SWxCUzVt?=
 =?utf-8?B?S2JDckkzdllOS1U5bjlSUEc1WUhFSk5MMVU3MzBuMzJwOVg2UWNkRHJ1MWgr?=
 =?utf-8?B?bWozNmN1dG5RSFU3blJqcWsrSFRTR3RkNUhSUjRwdGFWbWtjMm1QVnRjVFNE?=
 =?utf-8?B?TXVNejdBa1JpOHdCNVdEbTlMMTNseXFmeVlSdFpNbk9TbTlGTkd3WjRKSjJq?=
 =?utf-8?B?NytCRllhMVV5RjZBYVoyNmtDbFhDL1NyNkR0ZlIzT0hwakFUck1UM1pNbzUx?=
 =?utf-8?B?UzRSS3V6a0hmUzRVS0JTdDNLd0pQNmZoTVp6d21wWW1EWE52THJiaTBaQUFv?=
 =?utf-8?B?SXYwempjd1F2aFlpU0JpRUVGdmFFclRKai9lVk01SDNmdjhPRXlLSDlOaGR5?=
 =?utf-8?B?WTdTWTV5TkdKMGswQWdONXZqc0FNQWZSbTllYURKa1JwUWVqY21Nc3pmQlZ6?=
 =?utf-8?B?aElrNHIzaStybnJwMG1oaUJjc0cra3VHNDNNaWwwNEJzSHA4cW8wMEh4Wklx?=
 =?utf-8?B?VUFnSlIvTDF5eUhwaUN1d1I2THFsMmsxbS9yOEs5dlpveTM4bnErRk1qRHk1?=
 =?utf-8?B?V2l6cnJ0OTl3d252MlZDN3M1ZWVneFU3ODN5K2hnbUFGTFVubm1RQ1FBMVBy?=
 =?utf-8?B?aGlGU0FNMlJDRG91ZVA2K250bm5oM2VHUUV1eFRaSkl3L2NWb3NuaVNVYVQw?=
 =?utf-8?B?dVdnYms5VHVOdnpjWVhaV0pRdUNNbnI0TVVucFU2Mjh0SUdzdEVtRDdBZlBB?=
 =?utf-8?B?akE3NW1CUFE2ZjFFQUkyTEJLczZ1MEpiUUN4Z0hySUJqZE1Mc0lsS3hiclhB?=
 =?utf-8?B?dEhXaFc0SnRleHdqMWdzLzgrVnZCS3BuN1BFWTNjRFl2dkhGNG9XakI0bG1N?=
 =?utf-8?B?a2lLVk1FZW1nSDloeUpoa3hGcFM4RkRWRiszRFRxVnlTdElLQlI4WWNHTFpl?=
 =?utf-8?B?MUxJMUZOeHpOdGJOSnYvKythd2hLcjFwOFJ3L0NKVVR4ZmxVQ0M5elFiWTZC?=
 =?utf-8?B?bk5pSVYzSVo2VEtEd2s5MzhMb3dlazBoL0JmWUNPMmdEeEZqdU5wdy9vSDVK?=
 =?utf-8?B?eS9QYmU5Tk1kNGZOdFZSNHIwaGlGNG5qVm5KZnZLdmQ1WW9zYkFKb2E3VW5M?=
 =?utf-8?B?UHNWSjlzVGUxU29ZTUE2TjcwMzFsd1MxOUVLcTg4akZNenB0T2JNaHVCMXV5?=
 =?utf-8?B?OTVqOXltYWFPQ2dRWEpqU3phV3h5dlJlOWZ1SU9QVDdLU3liQzZITk45ekIv?=
 =?utf-8?B?eTdvckRuT0ZnMHYzVnNDeDJZbTZNcFdKdTVuUnpVM0d1MGtuYmMwZjUvS2lB?=
 =?utf-8?B?blBOMkhteDVzT1NDREVod2FDaUQ0WUlxZEVQZ1VzMi94dkF3RExDeWRjYmt1?=
 =?utf-8?B?UWdKMHk2bkdxSVU4Z3pFMFk5STF4a1FUYmJVbXc1WVF4d2xxRXNyZXJwZXBs?=
 =?utf-8?B?Q3c2ZWxSTGMvakczU3VoY3JwVjRIbE5sbno0U045NUZ1cWE0K3ZLMGNjbE1D?=
 =?utf-8?B?OTBuRUJ4cjRzK21jSGN3NzJXTGJ3NzUrQitCRjYxTDU4VkZjRFdQWUFaMlV2?=
 =?utf-8?B?T3UxWDBFUlVxcW1HQ1dnNUY0T0dEWFJjWlVtSmtwVXBPSVpkZXNpUkk1ZVdw?=
 =?utf-8?B?aVpVdldzSXdxMEgvbDE4WjFEQ0hWK3laNEwrclNmSG8vRXd0d0RKdlFMK0lz?=
 =?utf-8?B?YnFxSGNvZDlCT3pPaFJFOWtKa0d1S0tSWnlLUHI3dEFsVVVoZlFDZzRmeHNM?=
 =?utf-8?B?MW42NnlvYTFOV3VISHVxYXhuKzNiZHlsT3Fsb1l6M1lyYTdPRjhHcVAxSmxS?=
 =?utf-8?B?Snc0aEc0SFByemVPcEovL2VVNGxyaHFvVUZLRXRoZEFyQkErMDZ4a1VVQmFa?=
 =?utf-8?B?bnNWalVEejh3Y28wT3pnMkJkNnYwY3JZYjl1M3d5Q25BOHNCM0Z6SVZ6a1NW?=
 =?utf-8?B?VGh4SEw1UUhYZG1jckRQeVMwdkUrWVVoRlVMaW5uMmlmbnVYUW14Y25UTlNX?=
 =?utf-8?B?Z3VMMWlXaGtOOS9BZ3liM21FQnhIUzY5RzZZREdBaThFbmQ0Q2hjd0xFZHE2?=
 =?utf-8?Q?69iAzyOX/E8VgxVmhlB70eOrP?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c5e006-0c5f-4746-b04f-08dab75a215a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 13:58:16.3220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRjER1/TPVoj2VsXU+rQXxnFUytR5ISxMpgCu8akU9UwqFh6baOP1H/N3DtKUgaG7Ql8j0wMPkT1sMQeOtjeCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6972

On Wed, Oct 26, 2022 at 02:47:43PM +0200, Jan Beulich wrote:
> On 25.10.2022 16:44, Roger Pau Monne wrote:
> > Writes to the BARs are ignored if memory decoding is enabled for the
> > device, and the same happen with ROM BARs if the write is an attempt
> > to change the position of the BAR without disabling it first.
> > 
> > The reason of ignoring such writes is a limitation in Xen, as it would
> > need to unmap the BAR, change the address, and remap the BAR at the
> > new position, which the current logic doesn't support.
> > 
> > Some devices however seem to (wrongly) have the memory decoding bit
> > hardcoded to enabled, and attempts to disable it don't get reflected
> > on the command register.
> > 
> > This causes issues for well behaved guests that disable memory
> > decoding and then try to size the BARs, as vPCI will think memory
> > decoding is still enabled and ignore the write.
> 
> Just to avoid misunderstandings: "guests" here includes Dom0? In such
> cases we typically prefer to say "domains". This then also affects
> the next (final) paragraph.

Right, will adjust.

> > --- a/xen/drivers/vpci/header.c
> > +++ b/xen/drivers/vpci/header.c
> > @@ -128,7 +128,10 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
> >      }
> >  
> >      if ( !rom_only )
> > +    {
> >          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> > +        header->bars_mapped = map;
> > +    }
> >      else
> >          ASSERT_UNREACHABLE();
> >  }
> > @@ -355,13 +358,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >  static void cf_check cmd_write(
> >      const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data)
> >  {
> > -    uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
> > +    struct vpci_header *header = data;
> >  
> >      /*
> >       * Let Dom0 play with all the bits directly except for the memory
> >       * decoding one.
> >       */
> > -    if ( (cmd ^ current_cmd) & PCI_COMMAND_MEMORY )
> > +    if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) )
> >          /*
> >           * Ignore the error. No memory has been added or removed from the p2m
> >           * (because the actual p2m changes are deferred in defer_map) and the
> > @@ -388,12 +391,12 @@ static void cf_check bar_write(
> >      else
> >          val &= PCI_BASE_ADDRESS_MEM_MASK;
> >  
> > -    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> > +    if ( bar->enabled )
> 
> In 3 of the 4 cases you use header->bars_mapped as replacement. Since it's
> not clear to me why you don't here, could you explain this to me? (I'm
> therefore undecided whether this is merely a cosmetic [consistency] issue.)

No, it's intended to use bar->enabled here rather than
header->bars_mapped.

It's possible to have header->bars_mapped == true, but bar->enabled ==
false if memory decoding is enabled, but this BAR specifically has
failed to be mapped in the guest p2m, which means dom0 is safe to move
it for what Xen cares (ie: it won't mess with p2m mappings because
there are none for the BAR).

We could be more strict and use header->bars_mapped, but I don't think
there's a need for it.

What about adding a comment with:

/*
 * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
 * writes as long as the BAR is not mapped into the p2m.
 */

Otherwise I can switch to using header->bars_mapped if you think
that's clearer.

Thanks, Roger.

