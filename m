Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5BA5F43AC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 14:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415519.660117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofhRS-0001rp-6Y; Tue, 04 Oct 2022 12:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415519.660117; Tue, 04 Oct 2022 12:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofhRS-0001oz-2X; Tue, 04 Oct 2022 12:54:34 +0000
Received: by outflank-mailman (input) for mailman id 415519;
 Tue, 04 Oct 2022 12:54:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AV+7=2F=citrix.com=prvs=269045312=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ofhRQ-0001ot-F4
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 12:54:32 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aea03a1a-43e3-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 14:54:30 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 08:53:10 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6267.namprd03.prod.outlook.com (2603:10b6:510:e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Tue, 4 Oct
 2022 12:53:06 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 12:53:06 +0000
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
X-Inumbo-ID: aea03a1a-43e3-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664888070;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1Mz5ZMkqxeOY7LWmeUUf+jITWQ9tHF2CeVbA8zgO9IE=;
  b=XCtVSJwO3eoKF49KHJjn1N3hM0RcZnpUy/rFggQ2lReOC+1RbvI5MOCz
   fre9nqEbSVKk62eNcc5sw+LhfM+DRXZB8tWS15HOcrf4UPWFXOg8xKIwD
   BfewDwK0Wctv0CUv8psjn7QyyLXjUExMxJ615H7aZYC7nEMG0Bw6itxna
   4=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 81059908
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ra0FZq0e/iUWWS9GrPbD5UZwkn2cJEfYwER7XKvMYLTBsI5bp2dVz
 zAbD23UM/uJNmKjLot1aYi3/R4HsJOHn4BiHgZvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6r4GtE5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqU8+elaImIf6
 cY6IWgSVQKHiOG5maO0H7wEasQLdKEHPas5k1Q5lHTyKq9jRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/L4/NovgA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4Wrcqi/917ef9c/9cL9DT/7h3M5jvEWOmVIdVUYWX37iisDs3yZSXPoac
 ST44BEGr6I/6UiqRdnVRACjrTiPuRt0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 TehgNfBFTFp9rqPRhq19KqQrD60ETgYKykFfyBsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y6
 y6NqC8ylrACl/kB3q+w/U3Eqz+0r52PRQkwji3dU3i59Ap/aMigbpax9FnAxf9aKcCSSVzpl
 FgJndKPqt8HC56lnTaIBu4KGdmUC+2tNTTdhRtkGMAn/jH0onq7J9kPvXd5OVtjNdsCdXnxe
 kjPtAhN5ZhVeny3catwZIH3AMMvpUT9KenYujnvRoImSvBMmMWvpkmCuWb4M7jRrXUR
IronPort-HdrOrdr: A9a23:Ua+8lKsNObR0dBy2x4IZ1hjr7skC7YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVgUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZrzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDn1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9EfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWw2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 giMCjl3ocZTbqmVQGZgoE2q+bcHkjbXy32CHTqg/blnAS/xxtCvgglLM92pAZzyHtycegH2w
 3+CNUZqFh/dL5pUUtDPpZxfSKWMB24ffueChPkHX3XUIc6Blnql7nbpJ0I2cDCQu168HJ1ou
 WLbG9l
X-IronPort-AV: E=Sophos;i="5.93,157,1654574400"; 
   d="scan'208";a="81059908"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AumjX0i71oO/B4LPHbLugLzrJ3m6JuMOguqfjtkxiN++op9ls5f1wpzVqFj5979KlLq0g+1lG7/esio1/HtIPW962gJkxIXRF5meWMFTOfwhcve3gVkZUy3unsHuzcUhub3Tqx+sKlwDJwLX8/my77+ZmIqSAO9aTFAf6r6xsBaHWVvYGU8uj8wahPjstRuNRHe19GNfMc0jrQmrj9VTpGpyV7DjHwyN1FBGicCNV7b1mRS3fYmWf0V9ioAjhaKmLrLqzvp7Q9CF6s0pfr9e7vyVDcdgpCua+7r+WuaOAdmRO6VkMcEbfKPrvxRtmZb1uNu/VxaZ8LSGxfX1pF5SCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/TcYOnQB+B4LfX/EKZFFhVW8q230A8TlPcO8afUaj0=;
 b=ewK6Zk5wwRbYcU0XHyvSyATkIfxh2YfvLTkGsHUwuO7rvPeM2xCct2DIVIcQdixmcxyY56nxPjHj3DVIBUo9kwaalOFxPEzmq/9FRJ1iMwi+emnlRD5Be4F2wcRUtQRQ1RdtQxi00+WQ+4h2BzNhZHu4WbE6IKayrpKvdScicrfmTfDHzyb1Yz9QgsYbMcj0FVFCQdEuwPmKSU/ezBACClnH/j8gLiICLvK/nvz4TDAykd/abZUsPfOIavZwJAZcm4dRp6WdrHu/nHVB4YL2CDzkyOzivDjNPmpYWeB82Tl/zG6lroNcZzn6RTapvIJE6/ni1q+AjALisZSQmUqBNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/TcYOnQB+B4LfX/EKZFFhVW8q230A8TlPcO8afUaj0=;
 b=myvdrgFjeyoEScReqPd8Y9RYHY2L4XC9RvTWUCDwud6TAur6GINZJmCFOD/S6b+RVRkLcDjgWOjrNu6WdIZItt7ifpHqv3EnPp0jiaDmezzk5RtLIpQGPI6/AxYTe4mYQpZoapaopE96xUwfAWtzCBBVpvNpFvsZ+OoVXMP7Gc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Oct 2022 14:52:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Message-ID: <Yzwsq/LL/i9ARxiJ@Air-de-Roger>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
 <df0dc3e1-da12-9d42-b652-e33419134d38@suse.com>
 <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
 <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
 <YzwNGd0wiAbhDR9e@MacBook-Air-de-Roger.local>
 <db9856f9-1777-8fe5-5b5a-ef3f132193dc@suse.com>
 <YzwQymW3jkfzUQrI@MacBook-Air-de-Roger.local>
 <9aa0569a-bc18-9480-c86a-817222d4fea1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9aa0569a-bc18-9480-c86a-817222d4fea1@suse.com>
X-ClientProxiedBy: LO4P123CA0457.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6267:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d219bc-c470-4db0-1a3f-08daa607618a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RXi8ad90e1fN1YJq93B4b3M44De32Jt26XBXIqoM3FvEjgAbjnWDDCCFXONNajfXHiuP7z/nl0jThJ0XgBUgJPYZY3T0eAAAFoEcbmMb84bhhxFmXs8qw6JjkutVdcHjZHjrjb6l5pX9AH4XqJJh7YLVZgAabv6QEF3QwKyvq+w1qnTQ7wwA6sgT863BjABlXnmDrH4Bxu2I8eCRh6CEeU3WQkVdH44pA9QWFBISC0QJhsEJsJhDxz0F92/ydsafDpabasfFoD55PB47yNR2+iOh3As1OmgyMRiL9lxhNQRN1cE47QrzoZR84eyMItqH+/lMNbxPQAYj787vv8oWvJD0pzGb17oxtBCMHX98iyjhRVNeTSZXO2vNtifITFOAODLTdRD9xV9w751Pl08oy4sUweSPc/v5TZUbnbHm3f00Irb2XYSvrbaHSUYowTbjmXdg18a5YKuciyggSPk9NG36K6EuvUtUel0fMN/mMpItXSOqNm07qOHtjfKWjmr2TGgb9b7z8Sz9+Qn13n7w2JUI25gRkd9Uc5uTbxgqwPKOI6zsyo5Uuqa4CogmJmIqetMGsMIVFuigZ1f2ldIAxMJrEPxaRiDNO9zTGlGcuQ6PYADGEjysjNUM16e39pIoqSUjea566VUlPaxTfUu+m2g9n/m7q2bldH7GxhH9rqkXl/NZy9BC6kp/iaUtg3sGCTKitBYzHdy5kEl4FCQiMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(8676002)(4326008)(66476007)(66946007)(6666004)(66556008)(316002)(6506007)(53546011)(26005)(54906003)(6916009)(6512007)(9686003)(186003)(33716001)(5660300002)(2906002)(8936002)(85182001)(82960400001)(38100700002)(41300700001)(86362001)(83380400001)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3M3NXlRVm8zNlJaTmhtSCtCVU1KTDFreURRVU80dTdQSE1hRUU1MXBxN2Ri?=
 =?utf-8?B?RTViS3pyTHFoK24vZW0vNEQ0L3U2ZVNHTHZad2drbHZKS1AwNFAxMnd5SXBY?=
 =?utf-8?B?c1FaY0IzTDFuMzRVYWRBMkRsWnJXUVdqR0F5azJYUU5OSXd4T3prWkd6ZldY?=
 =?utf-8?B?NVdLSlR4RG9sRmlJWnJSbFczeU5Ydys3YXlLNENrOCtIOWdMN0hTRHlZaDhn?=
 =?utf-8?B?VzRjRHVaWFVteE53NWsyc3crZldEcFZTM1hFZm4wZU1UQmNzcTFiNUtISTNK?=
 =?utf-8?B?cFgyVmxYVVg0MmZEYnU0ZXdzUUJiMnA1NWRjTzlFVEZKQzBNYWU3WGpVcXJv?=
 =?utf-8?B?Zlp2anJsdzNyaUtzZVg2NXVRaUJ4ai84T0VMZm00WHZsenRaTG1OcGNLblZt?=
 =?utf-8?B?RHZ6OUV5V0pPRlFhVmI2SGlSMWVyaHJJU3BTSVZ6azJiUG50Z3Nab1B2eVBl?=
 =?utf-8?B?bFVmejF4RkZmVFdTL2JrbXREaFp0L1d2NFZIbUttSitpRUVNN1lOUFZYZkZi?=
 =?utf-8?B?VzV6eDZEQ2xTRUZ3Yllqdlp3WklxazBmbFlzZ2lvRzNGNGJBbUNJcWtZRE9k?=
 =?utf-8?B?OUJheTcwcUs1TjVaR3lSYXJiaDRhWXk0ZlYyRm4vTzZFMk5IZW9jblBud01k?=
 =?utf-8?B?R3Z3b2VmNXluOFFIcUxxa21YV0VJMnNkd3QyMWVOZTVOS0FlRnMyMStRZ1dn?=
 =?utf-8?B?bHJzMTA1MTY4bGpyT2dYbzdxTTZMcEliL0RyQUNHam5ZTnR3YUN1ZVlOOGMx?=
 =?utf-8?B?ajFJQ2NMRDdhUEMrUzJzMmVmNG1sRHJYNm5pWUVLcVV5a0dLTS9xaEJrOEhC?=
 =?utf-8?B?VDR0Nm9Qb3RzRy9CajRZdzBZRndlZCtlZTNZYkZ3aUl2Umc3SUREdVo4VXEw?=
 =?utf-8?B?TXVPQVBQNHZiTU5VNmhBdnZ4NVhnU0ZQamMzV0dWRGo4VEw2YjlVRko5RDNi?=
 =?utf-8?B?Wkl2UmZjMlYzaXIzZWNSRzNwVDRham1qTTZRdDhiaVBXVDMyMVJFSWpqdXRs?=
 =?utf-8?B?UjZNZ25oSkZQZWFsL2V3R2VKU1JyMWJoQllLK3pEdVRycmJJczJNQUlNNjhw?=
 =?utf-8?B?aGt5bStGNTFScE5Zem9LVFFNUkMxVTQvd0QvbnF4WlhPTFlzY0h2Ym1MR2ZN?=
 =?utf-8?B?MERJT0xETVVSb3d0dXhWSE5aMDVPTmZDdE1PWWo3TzlTS0NrUEhDTFNhK3V6?=
 =?utf-8?B?T2tLL2xQcHFoQVl6RkJIRENTZkozQlVkbVQydWxVaUpOTXhTNzQ5YmFmTnp4?=
 =?utf-8?B?UUQxR0tGMmJaOHB3UkRYQjljeGI2L3dCNFBFTksxVjNZM0RaekZrMlU2QVhr?=
 =?utf-8?B?MzV3VDZ2bFpMbURGWkNMcXhIMTBlZVhDdEwrQUIzcmtwTUxyUmc4YjFMV1Np?=
 =?utf-8?B?amp2L3VNQlR5QXhQcmttd1RnR0VrSjdpUjVDbzhaR1oyNjhUbi9sMVc5YTZp?=
 =?utf-8?B?bjZwbGdGaDdlS2grSkpYUWNnb3BlN0FFa21zcVdxclVXZGhuamxEMi93dENQ?=
 =?utf-8?B?N2JQalkrakQrZ1YxRWxpaW5PSERrcGZnSVh3eGlLTlQzYmM2K3hLWjRkYkRN?=
 =?utf-8?B?WFgyQjBVQjEvOE5lTkVJWTRiTGtxWkhMSkkrb1VWWitzbDcvTTlUZjhPK2to?=
 =?utf-8?B?MTVsVmJ4eTNlSVRRVWM4SWV1YW40eFpUZEVWSGRDdzNOSGNseTY5dXNac0pV?=
 =?utf-8?B?SzdJUlhyejhJNU1CWmFIaW95djhqQVBKeFM0WXBTRW1KVmRKUUZPZUljdzZV?=
 =?utf-8?B?SFU5S3NtdVM2bmx3a21Md1JqMUpNTFBhNDZ4bklnNXJrMGRUNVdGTEc2byt1?=
 =?utf-8?B?RWhYQ0NOanQzdThQWmkzWHMyVm9KcStjbU9tYnYyUFBHRy9MWU51S09hRG1h?=
 =?utf-8?B?S2wvQzVweEVENUFUSGVhalUxSWtuRFZuNi9rUmx3SUp5YWJmSFVXZW5GOE9T?=
 =?utf-8?B?NzdXelJ5VnNVVXBHbnlZamJpTWtQVUh2UjQ1bVFCZVU4dVU4U0hyNGxwZHBi?=
 =?utf-8?B?eWxDZ2pmWFdpTm5oUTFsMFVIZ3BQR0EyZVcyOWpjT21mTEt4MTM1Z252NjJN?=
 =?utf-8?B?WTdNUlRraXRIYUpuUi94ZFBJSnhBRFU0OGdFdFYxdkN5ZTBHcFk4SGI3ZE0r?=
 =?utf-8?B?c0pWMVIyOEhaOWlRVnRyWHIwRnZPWTRDSGgrSjlTL0tQY1VkazZjOXFObGlh?=
 =?utf-8?B?T2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d219bc-c470-4db0-1a3f-08daa607618a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 12:53:06.0737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7guYKuDA4J6LaGDnoLRy7/n/Aur0kyTWhQMOWSKi9zUWAs8bjqRqCQlvjSYX+pFalu6tigYWE657XDsIj1GyMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6267

On Tue, Oct 04, 2022 at 02:18:31PM +0200, Jan Beulich wrote:
> On 04.10.2022 12:54, Roger Pau Monné wrote:
> > On Tue, Oct 04, 2022 at 12:44:16PM +0200, Jan Beulich wrote:
> >> On 04.10.2022 12:38, Roger Pau Monné wrote:
> >>> On Tue, Oct 04, 2022 at 12:23:23PM +0200, Jan Beulich wrote:
> >>>> On 04.10.2022 11:33, Roger Pau Monné wrote:
> >>>>> On Tue, Oct 04, 2022 at 10:06:36AM +0200, Jan Beulich wrote:
> >>>>>> On 30.09.2022 16:28, Roger Pau Monné wrote:
> >>>>>>> On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
> >>>>>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
> >>>>>>>> higher priority than the type of the range. To avoid accessing memory at
> >>>>>>>> runtime which was re-used for other purposes, make
> >>>>>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
> >>>>>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
> >>>>>>>> E820_ACPI memory there and hence that type's handling can be left alone.
> >>>>>>>
> >>>>>>> What about dom0?  Should it be translated to E820_RESERVED so that
> >>>>>>> dom0 doesn't try to use it either?
> >>>>>>
> >>>>>> I'm afraid I don't understand the questions. Not the least because I
> >>>>>> think "it" can't really mean "dom0" from the earlier sentence.
> >>>>>
> >>>>> Sorry, let me try again:
> >>>>>
> >>>>> The memory map provided to dom0 will contain E820_ACPI entries for
> >>>>> memory ranges with the EFI_MEMORY_RUNTIME attributes in the EFI memory
> >>>>> map.  Is there a risk from dom0 reclaiming such E820_ACPI ranges,
> >>>>> overwriting the data needed for runtime services?
> >>>>
> >>>> How would Dom0 go about doing so? It has no control over what we hand
> >>>> to the page allocator - it can only free pages which were actually
> >>>> allocated to it. E820_ACPI and E820_RESERVED pages are assigned to
> >>>> DomIO - Dom0 can map and access them, but it cannot free them.
> >>>
> >>> Maybe I'm very confused, but what about dom0 overwriting the data
> >>> there, won't it cause issues to runtime services?
> >>
> >> If it overwrites it, of course there are going to be issues. Just like
> >> there are going to be problems from anything else Dom0 does wrong.
> > 
> > But would dom0 know it's doing something wrong?
> 
> Yes. Please also see my reply to Andrew.
> 
> > The region is just marked as E820_ACPI from dom0 PoV, so it doesn't
> > know it's required by EFI runtime services, and dom0 could
> > legitimately overwrite the region once it considers all ACPI parsing
> > done from it's side.
> 
> PV Dom0 won't ever see E820_ACPI in the relevant E820 map; this type can
> only appear in the machine E820. In how far PVH Dom0 might need to take
> special care I can't tell right now (but at least for kexec purposes I
> expect Linux isn't going to recycle E820_ACPI regions even going forward).

Even if unlikely, couldn't some dom0 OS look at the machine map after
processing ACPI and just decide to overwrite the ACPI regions?

Not that it's useful from an OS PoV, but also we have no statement
saying that E820_ACPI in the machine memory map shouldn't be
overwritten.

Thanks, Roger.

