Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0454508F00
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 20:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309544.525864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhEdu-0001sg-0y; Wed, 20 Apr 2022 18:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309544.525864; Wed, 20 Apr 2022 18:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhEdt-0001pe-TV; Wed, 20 Apr 2022 18:01:29 +0000
Received: by outflank-mailman (input) for mailman id 309544;
 Wed, 20 Apr 2022 18:01:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E3+=U6=citrix.com=prvs=10247635a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhEds-0001pY-8I
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 18:01:28 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3d79249-c0d3-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 20:01:25 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 14:01:21 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB5971.namprd03.prod.outlook.com (2603:10b6:610:e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 18:01:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 18:01:20 +0000
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
X-Inumbo-ID: e3d79249-c0d3-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650477685;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=V4eKRoYraXiZ5Xl7eXfR+PhSvzcIiRTT8tSAkFum5JU=;
  b=P9ekPfco1gbNPDhSuEmX4F3ah3+9P5OJAtYamE1uiTaks8RbxY8p4nH4
   XPcmxu2wOtnbsdiJ6sGKxWDOj2OONuPaiLAJa/wqYRpMB0hu+EFKTJHGA
   aJwva5MTbznHqLW2VHAivKb+mMasl9b0wMMhsJu+So/G2io8JcQEsfgv2
   8=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 69940169
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dcm9Fq91t2wvZktDQe7RDrUD73+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jYaDD2DOfeNNGujKoh2bYji9hxQ75XTytI1SARvrCg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw3YLhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnce9bD91NbTHo9UmTUBfLw9uA5Qe0qCSdBBTseTLp6HHW13F5qw0SW0TY8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvSMvIAGtNszrpkm8fL2T
 swVczdwKj/HZAVCIAw/A5Mihua4wHL4dlW0rXrL9PtruzGNnWSd1pDSK/3FK+etevxIm0zJi
 lKW2mDgUhoFYYn3JT2ttyjEavX0tSHxVZ8WFba43uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQnZKflhsVWt4VH+hk7giIk/DQ+1zAWTZCSSNdYts7ssNwXSYty
 lKCg9LuA3poraGRTnWesLyTqFteJBQoEIPLXgdcJSNt3jUpiNhbYs7nJjq7LJOIsw==
IronPort-HdrOrdr: A9a23:aAyrxq82DBYKUywpKkduk+DyI+orL9Y04lQ7vn2ZESYlFvBw5P
 re+8jztCWZtN9/YgBDpTntAsa9qBDnhOVICOsqTNKftWDd0QPCRuxfBOPZskfd8kbFl9K1oJ
 0QEJSWf+eRMbEVt6jHCNXRKadc/DDNytHPuQ6X9QYVcehFUdAZ0ztE
X-IronPort-AV: E=Sophos;i="5.90,276,1643691600"; 
   d="scan'208";a="69940169"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEC/P2exux22RuAbTBTUHRrhLSViev8kS6rh+9Wv+J2YOKS21uQ2fjM7/Z90+eB32UeQufgplfMuLFPG5gPIB5DOq928MMS4Mi9km/AalraxhusTHtp/WmqhApRzU25YlkAoBPMxGfbgd4QF4EgqDvE9GCiyZWX0BbUUOjs3VxOLHMi8/k74sdAA+/xwvwt2jtSOiy/BgdXGvvKmIZfzWA4wV2gDoFbeZD49MiriwUHBbwaieC1WoCd/woEKPQeisZaadWlaaXV6LReY0eLavN67lRaN8qSAKuKN3kgLG+hs5UaGlPYbk0hQ+tSNhIAZhQmJ5KlyybT8+wEAANgFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4eKRoYraXiZ5Xl7eXfR+PhSvzcIiRTT8tSAkFum5JU=;
 b=d9u2DWkRH+Rf9GyEMHJi6OAqCGOlfknpGMZevhVd0OdB5VXvmtYs7BVQevmcV4vcf6yw/XfurTxuka2HJoOuHnuOX5NBrgXxabqmKqh6qfor4DGeScUOuRtkLoDZbq9LY0Ht7W2cDW8zzfeywgyxRFWOIB6chwaOa0X6TDkHnWMcs366nMDDsnCuHt/ua/WdDbFbnOqyn3clFD3NL8qu2VguWdwPPGgi0dGpUKf9Yple1lJ4nKDrm1m+EUmCN+6WCnl2Xs7fhxYJO11yL3x1nfoFjOSV2c4cQIonm2r3TyvwqLn2TsqRhdyLzzKOL/gCceMyS0mr3c+vXPoxgLr2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4eKRoYraXiZ5Xl7eXfR+PhSvzcIiRTT8tSAkFum5JU=;
 b=AoMhb6u+cZB6fDrEKQEUH4YFVPF/TBCIQUNN2LqgdehzcHqtGSb92ueakjZadOkUaToB8KltW4R59ssxb96fumUQEXhGoE0mGCUp0zjdF8dEe7mb3cIHJfMJ5B42Pyz8CMtVQ0/4dX3pjR0+8BfCbZMCNhoIBCpuooq6UWhhYFQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Ranconfig failure between VT-d and HVM
Thread-Topic: Ranconfig failure between VT-d and HVM
Thread-Index: AQHYVN7zVpKNKLs79U2pM+0BQOt1bqz5F4eA
Date: Wed, 20 Apr 2022 18:01:20 +0000
Message-ID: <4095a567-86aa-8311-ed92-730348ab43d3@citrix.com>
References: <9537f2bf-981c-d4ac-d41d-ab59f7d7ab2c@citrix.com>
In-Reply-To: <9537f2bf-981c-d4ac-d41d-ab59f7d7ab2c@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e64fdbc-1d1f-4ea3-6719-08da22f7c629
x-ms-traffictypediagnostic: CH0PR03MB5971:EE_
x-microsoft-antispam-prvs:
 <CH0PR03MB5971C1122B70B1BBF13E8D0BBAF59@CH0PR03MB5971.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kH4ciVVINtOBuFexYXECvSDqE05/paeC2MykGOdegs2dvGWS6FHLQB0xzjlQfxzx23OfIllonVNMfGmB6C06EsN2tL/m9dYQMQ5UwwbzJ26kmzCR31HzACZqXs6HXE5hhomOkWXWx6UIinT9M8mUgTDvZwnhPahiA1YZCwR+I0uIbTtMTl7hd9Amg6ewLicBI6D4nrOyHOPB6+t7dILy7LfuPEXxRy2z3ENz7cZ+n9d0Ot41lyoh7+vra96BbbdCTXHSHMI/87I9nyrxxJBAVutGlZPo5KWhZjUKehT0OiCZ0GS+HXCfUhHqYiI8crpV7ucrLAGPbAXHFeKs/2MiABsFBqvRUMhl9sBsvA3pwMb+Xrh/IRSjEiO3wGtR+SNks3wk5kF4iLf18xifWrf+zkDrtnOHeNlMsNlGvvUkClBkmgWREV+xVBKXjdbpdoynBsbkrYc87JwZeFmjkpARtUhNFcnabvYZdy0biR4W0A0NZU3HM2SduzwmIMoCZ8NuVyEejmmLxxOe/F9o3/F7HISh8EOYkpqkMdQWkOxdH1iaXz6g4O9AmfrTltYcbJOgJtCJaMyN87x62EKvnRU5CppQx96iLiCcBgWR9/656235F3fUBpZGVGwQzBb0G3ytoZWGi+QUSbMFpG1p5YRNgx6oBFDce4CPqXkSlMDBax+GPojKrZxZSEgWGwEAvJVBVvSavOJxz33KLG2xvqS15alxtmZyIYRH2/JJoJvwvdSvU+fmMD6CWsNEjikAAyX7UhRnq04PgSmIQT7UbtlGpSE3k+/BgvIQJOb9MS9ZEyt7AsXEBKjt5gnXZVLO001m49Revmxekly4wJmRO77oIWTn5vGpvSIMUKCRWELOuzI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(38070700005)(122000001)(38100700002)(316002)(66946007)(82960400001)(64756008)(4326008)(31686004)(8676002)(91956017)(66446008)(6916009)(76116006)(66556008)(71200400001)(66476007)(2616005)(6512007)(5660300002)(53546011)(2906002)(6506007)(86362001)(6486002)(966005)(508600001)(186003)(31696002)(26005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a3dkdUNRd20xYTNwdXIxRjJhcTQxY0haVzhNTVZnUGsvVnRiRE5kblRFaXlT?=
 =?utf-8?B?VmppZnR5aHUwOXNXWitXai9URjMxZFhKRTIyaUw0Ulo3VFVIZ1pDQzluSlpN?=
 =?utf-8?B?RTVXMnkyekRlWmxqWHZtVXRIUGxLNzBOMjBtbjNKbkEyQlhOMEM4SExOTG9R?=
 =?utf-8?B?UGZkOGl0OGYrck03TmN0NUl5TVh1WUlXSGhoYlB4Z0J2eHVuditzQkU2MFhU?=
 =?utf-8?B?TkFEeE9CZk5Wb3dXRWxKS3NwSm1mMG10V1ZyYUx5bVREcTRLWVpINnBpci9k?=
 =?utf-8?B?SUYyMmtmNlgvTzV2Unh3bk8xVWh2RUtzUzZXUTBLSkNQMlVRRDczVkNiSEZM?=
 =?utf-8?B?blZ0cGw0MHB5eWJBZ3dXd2ljMitnRE5LcVpNb294TzNvVjhUQTJOSmhmOE1O?=
 =?utf-8?B?enkwWURmRmwrMlVocW11Z2lOaUJENFcyME4xdDQxVkVwWmtBSkk4ZnE1ZUJV?=
 =?utf-8?B?ZFhtYUtzcW8xcUwyTkZ4eDlkTE1VZ1laZjBmRDlabkRZcWtPVUlNYVJLYUR4?=
 =?utf-8?B?RFhqZmRHbGFmbGJZT3o1S3Z4MDhYd1I3R1ZnbTEzVTFOOU9JbWRza1IrTTR3?=
 =?utf-8?B?VVk0TTBCNWRRdGg0N3RSMnZKNGF6V1JxL05WV05NQzIvVWh1eXE1dmtwcmJG?=
 =?utf-8?B?VEg3ZGpBWWFNMmZ4U2xsbDB3czcyZjZmTGFBR0U4K0dFSTJRMzRmaldSajQ4?=
 =?utf-8?B?Q1dia3hBUU1aOXpLdWEza01YTHQ0MENPcUVEbUxQUk9oZWk0Zk91RFlWNXhh?=
 =?utf-8?B?aERlbVh4UHN2WVhzcGxhNnIxTmZ0SFJEZzNIcStqUVBlUUVGWGJrZ1NEUzM0?=
 =?utf-8?B?NEFBWnRoWTVSdGRuakFYUVZEbk85OEt5ZlhuWU9jdE1Lc3dFNWtqVnMrQXlC?=
 =?utf-8?B?WXBxYk1WYmg5bXJYSGIwcjlsR0pzRVdLbWlJQm0rTW50QzdVdXc1cEhuaERx?=
 =?utf-8?B?dERITjBOOFM4ZmRBZlJIRnY5RUQzWlB5cXhvRWdPNVp1Sm9PajlpRDByU3I5?=
 =?utf-8?B?L25JNVBDVFV0ZmxWdnRyQXNBQkhzVm1jRlYvMFhZZlhCM1FaeG85c2pqbndR?=
 =?utf-8?B?TnYrblhiUlJ6SG8zeU9XOStiVmU4ZkVSOWp1cDd5WS9XNTl6UHlERWpYMEJE?=
 =?utf-8?B?TlY5djZENHl5Q3pKOE0zdEpGaDZ3QXdRWlRrQUdNa2RYN2xTYldEc1hSTmQ1?=
 =?utf-8?B?YjYyYUlRRlJKK2ZHaklleVRDY2xIcVJ6N3poVkRHZDIxcDJoYXlSeGVGVjFh?=
 =?utf-8?B?ZmJtRnVHOTY2VnMvczBVYXE2Szc4RWUyVStBcGVVTVZBa2FybURNMVdxdk1a?=
 =?utf-8?B?REFwQWxxV21peTQrNWhKbWpMSGJGVFFGdFJwV1BWbVVJREtTVlpkZDc5SjNJ?=
 =?utf-8?B?TldHRi8zK1JjaStsck0xVkZHWnM3MzU3MXNGVkdoYVEzT3NQWjluc00rdkJH?=
 =?utf-8?B?REJiTTEvbFIrR2E2U29oeCs2UFlBMWdOY0xhVis5bGJzS2x5bFAwa3hnM0wz?=
 =?utf-8?B?dmJSNWU4eVBTbmVxdjdBVDgrZXV4K2xib3pkcTRFSTJXR05ETnQ2Ym5qbkhD?=
 =?utf-8?B?cW5ueVVZeWRNbUR2SXR2VmdUKy8rdDZxYjgrQUYyMnkxZ0NZZWkxOU1mVUJk?=
 =?utf-8?B?Z25iWVJoWXlPd29NeXA4V2UyS1FwY0pzRUZXZDUyVE93dkoxcVRXeDczTG9m?=
 =?utf-8?B?ajJSY3Q1OVc0eEpRQW9ERWNWQ2ljcHlJSkRzVUdZUlFyVStVME1pcTRIcjRU?=
 =?utf-8?B?NndpRVhhZjdUUmwyUVF4RDBzM0dIa0p6SDVIVHNVbnlocWRZLy91RVVMZG5M?=
 =?utf-8?B?eTF6YTlOWmZYcS9HZjRPLzhMRHBENXhncE5WRzA5V2lQaUp0NGhBeVFGN294?=
 =?utf-8?B?N2hpejdxRGg1T0pHNlhuMVhGVmkwNmhuNjJQclV5YVlHRnZzMGNmaElCbllN?=
 =?utf-8?B?bmZOZXUwVVJLcHUvUldLN2lMNTJ4aFVDUUROVVNnUU41S3o3MHA2MjlpMGFp?=
 =?utf-8?B?ZWxqQ1VUT1pDdWloM2dFalFSN0c4ZEpmcGkyd3FING1Uc0x0bWw0R0xqeEFr?=
 =?utf-8?B?ZkZMdDNVQmtxUEF1VCt4Y2I3VUs1aGNibEUwMURMYUZXMjVQVzNkSExDTVBt?=
 =?utf-8?B?cXpTcld2NHRiaStRRURmc25qRG5wUlBYQjBxREZSQitHVlFLYSs0TTlRM0RT?=
 =?utf-8?B?T1JqYVpUQWRTRFFSM2FqOWkwRFNvUjJjZXdTUmk5S1h2Z25Pc2FqenBiVnUw?=
 =?utf-8?B?ZlQwUndHMWJ6eXE4ZGRvbkFRT0ZIcFoydUkwZGtjYk1jdmlQN1dZbFNsWjhH?=
 =?utf-8?B?NXR3OTJXZUo1bGRoV2V5QytTaDNVWWNlQTJpN2Y3U01KVkhxbkxoQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9184EA33AB1B341B6816161B278EC4E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e64fdbc-1d1f-4ea3-6719-08da22f7c629
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 18:01:20.2590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Zg9lskYRAN65nJa7/SoZRS1/ypsqBIeqBcYoUacJsFPkzoiQS8Ob++oF14T2CDzX4XYDVoK4cG2dL9Kq3nuUQly4nW2Qxby5yzBGKzXhiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5971

T24gMjAvMDQvMjAyMiAxODo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gaHR0cHM6Ly9naXRs
YWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9hbmR5aGhwL3hlbi8tL2pvYnMvMjM1NTU2MjExOQ0K
Pg0KPiBsZDogcHJlbGluay5vOiBpbiBmdW5jdGlvbiBgdnRkX3NldHVwJzoNCj4gZHJpdmVycy9w
YXNzdGhyb3VnaC92dGQvaW9tbXUuYzooLmluaXQudGV4dCsweDIxOWY2KTogdW5kZWZpbmVkDQo+
IHJlZmVyZW5jZSB0byBgb3B0X2hhcF8ybWInDQo+IGRyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lv
bW11LmM6KC5pbml0LnRleHQrMHgyMTlmNik6IHJlbG9jYXRpb24NCj4gdHJ1bmNhdGVkIHRvIGZp
dDogUl9YODZfNjRfUEMzMiBhZ2FpbnN0IHVuZGVmaW5lZCBzeW1ib2wgYG9wdF9oYXBfMm1iJw0K
PiBsZDogZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYzooLmluaXQudGV4dCsweDIxYTIz
KTogdW5kZWZpbmVkDQo+IHJlZmVyZW5jZSB0byBgb3B0X2hhcF8xZ2InDQo+IGRyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2lvbW11LmM6KC5pbml0LnRleHQrMHgyMWEyMyk6IHJlbG9jYXRpb24NCj4g
dHJ1bmNhdGVkIHRvIGZpdDogUl9YODZfNjRfUEMzMiBhZ2FpbnN0IHVuZGVmaW5lZCBzeW1ib2wg
YG9wdF9oYXBfMWdiJw0KPiBsZDogLi8ueGVuLXN5bXMuMDogaGlkZGVuIHN5bWJvbCBgb3B0X2hh
cF8ybWInIGlzbid0IGRlZmluZWQNCj4gbGQ6IGZpbmFsIGxpbmsgZmFpbGVkOiBiYWQgdmFsdWUN
Cj4gbWFrZVszXTogKioqIFthcmNoL3g4Ni9NYWtlZmlsZToxMzc6IHhlbi1zeW1zXSBFcnJvciAx
DQo+DQo+IEl0J3MgcmVhbGx5IG5vdCBjbGVhciB3aHkgdGhpcyBoYXMgZmlyc3Qgc2hvdyB1cCBu
b3cuwqAgVGhlcmUgaGFzIGJlZW4gYQ0KPiBodWdlIHF1YW50aXR5IG9mIG5vaXNlIGluIEdpdGxh
YiBDSSBmb3IgdGhlIHBhc3QgMyB3ZWVrcyB3aXRoIEFSTSBiZWluZw0KPiBvZmZsaW5lLCBidXQg
SSBjYW4ndCBzZWUgYW55dGhpbmcgcmVsZXZhbnQgaW4gdGhlIGxhcmdlIG51bWJlciBvZiBJT01N
VQ0KPiBjaGFuZ2VzIGluIHRoYXQgcGVyaW9kLg0KPg0KPiBBbnl3YXksIHRoZSBpc3N1ZSBpcyBz
aW1wbGUuwqAgSXQncyB2dGRfZXB0X3BhZ2VfY29tcGF0aWJsZSgpIGluIGENCj4gIUNPTkZJR19I
Vk0gYnVpbGQuDQoNCkFuZCBqdXN0IGFmdGVyIHNlbmRpbmcsIEkgcmVhbGlzZWQgaXQncyBub3Qg
YW4gSU9NTVUgY2hhbmdlLg0KDQpjb21taXQgYzQ3OTQxNTYxMGYwNDQ4YmIwN2QzOTE4NWU3MmVm
MzZlMDhlYmVjMA0KQXV0aG9yOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpEYXRl
OsKgwqAgRnJpIEFwciA4IDEzOjUwOjI5IDIwMjINCg0KwqDCoMKgIHg4Ni9QMk06IHAybS5jIGlz
IEhWTS1vbmx5DQoNCg0KQ0kgZGlzcHV0ZXMgdGhlIGNsYWltLg0KDQp+QW5kcmV3DQo=

