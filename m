Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D526E6B80
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 19:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523032.812776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1popXm-0000bA-MZ; Tue, 18 Apr 2023 17:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523032.812776; Tue, 18 Apr 2023 17:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1popXm-0000YT-HY; Tue, 18 Apr 2023 17:55:06 +0000
Received: by outflank-mailman (input) for mailman id 523032;
 Tue, 18 Apr 2023 17:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTWx=AJ=citrix.com=prvs=4659928b3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1popXk-0000YF-Ov
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 17:55:04 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24756fc8-de12-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 19:55:03 +0200 (CEST)
Received: from mail-sn1nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 13:54:52 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6185.namprd03.prod.outlook.com (2603:10b6:408:11e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 17:54:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 17:54:49 +0000
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
X-Inumbo-ID: 24756fc8-de12-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681840503;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=v103pMdYteJa04aSmRITptQsuiqiS8CgqKPSeDkkQ+0=;
  b=Sq0wSn4YPZ7U8NV6EY8uDUWHbm06Ce1ljjeWMYFNUohqOHZ9H5bHslKs
   t1mDGH66d+nZj1iDQJ9oKwtcJrzYTsHIEz8V+dbda57LQJjVr12d4mRmC
   vxqhS1TB0O+9MBlkhlAudn9dtOPG5DnkIHXNpaGulLuRhU7ywkgyKeuPb
   Q=;
X-IronPort-RemoteIP: 104.47.57.40
X-IronPort-MID: 104773415
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:A9VNaqBa4LpfcBVW/xPiw5YqxClBgxIJ4kV8jS/XYbTApDsh3z0Ax
 2EbUG7VM6rZYmfwed9xaoXg9BlSsZHWzYdhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9B7gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw089pKm5L5
 8IhM3M8QRuO3Nm73JPic7w57igjBJGD0II3nFhFlWucNtB/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxruwA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37eTwnygBNtPfFG+3uAtgFivn2BNMk09XgWwq9DjqmGbAc0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHr7m9WX+bsLCOoluaOi8TN2YOIzAFSQgt5MPqq4U+yBnIS75e/LWdi9T0HXTrx
 WmMpS1m3bEL15ZXj+O84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComVPlhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:/49/zKwqmbP/K/Yyc0FcKrPx/uskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9xYgBHpTnkAsW9qBznhPpICOUqTNWftWrdyQiVxeNZnPLfKlTbckWQmI5gPM
 9bAtBD4bbLfD9HZKjBkWyF+uIbsaK6Ge2T9JTj5kYoaTsvR7Br7g9/BAreOkpqRDNeDZ58MJ
 aH/MJIqxepZHxSN62Adww4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9n22
 nYlA7S4LmlrpiAu23h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtX4hlU63qhkFKnAn6gmxKrP
 D85zMbe+hj4XLYeW+45TH33RP77Too43j+jXeFnHrKu6XCNXgHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5uLPSwphmiOP0DEfeNYo/jFiuLYlGfZsRM0kjTVo+a47bVXHAVUcYa
 FT5MK13ocoTbrVVQGUgoBV+q3RYp0CJGb6fqE8gL3u79F3pgEJ86JK/r1uop5HzuNId6V5
X-Talos-CUID: =?us-ascii?q?9a23=3A5RZzSGsjVEZKxy8M3ABgQOqX6IsMW2P2w3LCHXa?=
 =?us-ascii?q?jSldGQ7DOclKM2fpdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AvP6zcgw6LE4dnsIi18ItjjfHTCGaqLrpCEUxyJl?=
 =?us-ascii?q?YgZmvPnJ7MR7HrBuSGJByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="104773415"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahICyN+yYc44t61JGv9S0VCnpvEqk17oxH8UKPKyKkLJNVh9ywDILxhVvXKvM000JiSbYZEb+fH/NY9sr6C1ovWVc4DwATG6bcz28t4PeT948ZqM/r9wHDxNmt/0qQ90CqY+N7mKYSTuQ2HKQDaJQdPu25hnO5U9NR36LxNC+trJCbNkoe56IX/RQdDC60LuH/4COh//C/rQdCri/TW0d01gaWDiE70+sAP3MP+Fcp9yYQhUpbmJrEny3ZRI0IbSUjQFV/5y/CHnK4WKDDnQ3kQu3DNUL3qKl9mUUUXVmo1x8RtonrsaxZ9x208NKRWsSm8BGEFMVw/+7b/0O2ZG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVcOGkqVAfHnxEW6KpN88v8nvWMqLX9ErkEbpJwWj6U=;
 b=KQ/0xz9hNhYFtsO1H8JOCIuSiJYm7vyAiXS+GKhcPIvTX4ktSEg3CPqN7XNAPGPr0UWtCVbdYbUySZm12qudqau62fwnjErmDK95C0hrsNbOtKtxBBf2cC9yNZA2dnsP39JefD+zCAN2ucfgTfJMY2bXWAsqsvcOuxhrmi93VqvYSXNBRrBWCrEvu+nkfCMzSQALywLhqxC+eLaIBjTmw2mSO2Xy//m1y8EVvNfOBcOrqjbSRKFTCdBEdxZfkOJG19eSJ1QDkFgVO9H6KO1VV13Ypaa5YAO3/oYd/nnvUqPWtIF0Vefs1eWY+2o//5H+PUfHHbYOgNXGMCYXfAtJvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVcOGkqVAfHnxEW6KpN88v8nvWMqLX9ErkEbpJwWj6U=;
 b=cU/aDEdXzPXxReaY8Gy/jAk3IT8h2ce8QYzMx1t0PLC2K2gXVDBumQiE/1mY6lRZPNVuRXElE/5uTqKKJa/qSkggPlBeXU9D9+KLAbylCBf1NbBWBpZJr0is1DzXOLanvwbPsjK451z5pFdqSZYdWx2kAA/mMjPG2oKHFVIddlQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <226fba6c-aeca-d38b-7d47-07b2f8d6b403@citrix.com>
Date: Tue, 18 Apr 2023 18:54:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] x86/livepatch: Fix livepatch application when CET is
 active
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20230418111032.487587-1-andrew.cooper3@citrix.com>
 <c2693ac0-4f6a-83ae-c477-75b3f05b938a@citrix.com>
In-Reply-To: <c2693ac0-4f6a-83ae-c477-75b3f05b938a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: 75690730-7c52-4001-77e5-08db403600da
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ckrIVyf7+QUvs1j9GtyzTbjSBRhqifzoaUOtXitaQgXgJvuq8VMO+doDlnk9jU9hSJAatRqePm+ZoFnyiwnQMiP4AnogfAD51vE9pjxvzqqiQNVCr+WzEbBnMapZD/RNs1B+I41pHONdM7NHbbfor9BcsMNxQJ8PcNftvuXoMN4t30QWiuO+R61b1kbfkPAohnu+rpAdb64sMmnYurQjvHPgdQvNGBgEWsXHFkAdbpX/E0oOwuFy7ZjvlVl+LK6159vaDw5zpK98rvlrco4VwJTboscnNOlBmvtgz9SYTu7/nuC+SAhXxBTams2uuZpWg26lbH7eLdiq/fLEr9ie4JErCJOarNxUX24aNmOfFyGLdQ2dpnLtfmiscbIkjbV6OA1XNzPiBdpy7bVi+CGZBOdMBpvZIbExZb+4zbrCLcRifM+Y6kvhHCqfwRWZMYcBrGAZjau5hTrcHiAW654mgJrLjXPsiR7XjIa7A93XRUVanSFBVcatHFDjQXn8uMZntmGTlEJAs/msdEvVLbFA7m+u6Qs5Ro6+riZCeXwTj8jF7Fms9uinJ6LNwQOmNJpGAxH7YPYVQpuVXA/GCQDHl9ovAyA7qoMypDuo3SvuHMFkpGCFYY/6jZK78wYEcxV2U1Db+rroVBe0q3awxT2Ccw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(8676002)(5660300002)(8936002)(6916009)(41300700001)(31686004)(316002)(66556008)(66476007)(66946007)(4326008)(2906002)(54906003)(31696002)(478600001)(86362001)(6486002)(6666004)(38100700002)(186003)(6512007)(6506007)(53546011)(82960400001)(26005)(107886003)(83380400001)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MElHV2NRZ1ZVaVZJcThralBkSjdkQUFkb3paeE1hMXNCbXFKalVRTWt3bUg0?=
 =?utf-8?B?Yk5oZlBDNHYxQ0FaVzI2aWJEUTQrcGFKdjRwRnlRR0xJbzlKck9obDVKRDFa?=
 =?utf-8?B?ZGdZRkl2VFNtL3R1T2hOaEdibnlFL1FIcVdUbytqbzBEL09MdVJJQ3lyQXJk?=
 =?utf-8?B?TWFUbUxIZGNJQTh2U0hFN2pESmJoNHp0eEZINEI3SjE0UjZ2YzRWRVdVL0Zh?=
 =?utf-8?B?TytDUjNnS0NFWXFjbFRwZDlFb1VvTjZtYlgrdkpxalI3QW84S2NpditJVEV3?=
 =?utf-8?B?R1VKSFEwdlVTOCsxTi9JbGE0VTlSM0RtdmppQUw5OFVud3FGQmE3V3dTTmRN?=
 =?utf-8?B?MW8rTnZPMlN3eXlhaE1CeEY2dlBJTVZXSjV4MmJWQ0wydjJUTS9jTWpnWS95?=
 =?utf-8?B?bUx5WVVvQlFGTXZWczZGM1hHazFOdWF5MSt6WUZVbzU0L3ZIM2JQQVZnOGgy?=
 =?utf-8?B?VHFodlhWcjd0Ui93NHNURnZIMEJlVUpPVGNCbHZvcEtlLzhadlFQdHVVdHpH?=
 =?utf-8?B?aE5LK2hGWG1VK0JFOG13eG5iSXJ1VTR6WHdTVWhZMWpybFNwZy9lQ0hwSUtZ?=
 =?utf-8?B?ZFc4cDRjU0pkKytUM3k3ZnY4Wngzcnh0cHhrTnhobGJvb1hzcmp3SFRsNjFx?=
 =?utf-8?B?anUyQzRvSWdITC80d0VJQzNBZldvZi9GYzZxbndPRGpIcnZCTWpwZ2FLTWNI?=
 =?utf-8?B?aXNSeUNHSU1rMHJ3ZmYzM0ZtQ2Foa3JlUmUwMTdIdVM5SVl5Mk1SMW1HNlZq?=
 =?utf-8?B?SDBxQ21IbytFaWRMTUU3VDViL3NLNFVSQUQ2RndIL0lHaUdMbWlnaFdFRnJh?=
 =?utf-8?B?cmVYdDRxWlZzcStNNVZuZWVxby8xbEQzRUp5ejhoM1UvYitVZWM3YzFZaTIx?=
 =?utf-8?B?c3p3Unk3VXNROGFBZXJ3dHppcHplejBzd0NxN1VBWWFBeTVIZnRtcTNQT2t3?=
 =?utf-8?B?WHNFdUFxNEE4V1pxMVllSlZGcGhnWnNDeDJvZXgra08rZVNqWkl6VjEybU9u?=
 =?utf-8?B?R3FRVHNaaElSYXkvUGoyUitMYnE1ZHB1a2dEdEFrQWRPckJWMDAyRXEzZGU3?=
 =?utf-8?B?bnBNRFQ5cVJ3RjlOQ0FVRVRLL29SZ0hvUnpkeGdBbFFXb1JucHhYSitVbFJh?=
 =?utf-8?B?amRyMXZCbEZCS29Td2V5Q3l1c0MwMWRZUlVnS3h3Z3FUTGN2V1IvTUpTQ01k?=
 =?utf-8?B?MUhiQ00rQjhBcUFaQityUUZOODJVcjhjSlh2eXdWMWl1MWVEN1dNUG5ZbnFo?=
 =?utf-8?B?YXpWK25KSXo2SDg3bVdlYzVneHFxOS9DUEV2UTk4cGxqeHNTVU9zMUZQWk1E?=
 =?utf-8?B?VmlBMkNsWTFEUEx3SlplQlNiQ3Bmdk5CbkZDTkR5NVh3dDNKeWdhVmFzUTJJ?=
 =?utf-8?B?SGFYU0RSTmFtb0RQUFpvcVo2N2NKZnIwNGJVa0tWNDRhdkRYaHRlRFE5VFZs?=
 =?utf-8?B?U2JpYm1XTHlVVVhlV0h5VWE1dFIxY01WTEsyZHFEdHhGbkxxVmVpT2tEeFZw?=
 =?utf-8?B?UHJ3WmhtaXRSaUM0ODBrQUt4cmNWTm1zVkhaRklVTnQzOENydm5Mc04rTkNU?=
 =?utf-8?B?bmc4U08vZ2tDdVhwVkNBMjRuelQyVHMzWE9oNXRSc3ZaakpEUHpyY0l6MEdt?=
 =?utf-8?B?b08rdTg4R25TRVVxb1AvWXFmSm5jSDV5M0dja09HNWlwR3BpMzVIQUNqVDNK?=
 =?utf-8?B?cUVkODhQeDRQVE5JTTBaV2tuaU1tYVg2bGd1em54bDVqK0JOeHdXN0U4b2Y5?=
 =?utf-8?B?SER6SXhaWGhuNWNJeFZOT09pWU1QRzhUbGxYdDVHdE5FSWwwQVo3WjJKQzBu?=
 =?utf-8?B?bWVVUkZEZFBuU284Nlh1S1pHb2luNVhFUE5BcFJRN1ptOUIxMVEvOFdRbHl2?=
 =?utf-8?B?UEhhZjVzNEl2WlN1UmV5K0VzR1l0NFdzd1ZkUG84bzdudzRmckxiUmk1Z3Ra?=
 =?utf-8?B?UUN0OUZJZ1ZubkhsK1NDekpTUG5SWEhGTlVCT09idkRuYkdCVmF1VG13VXlH?=
 =?utf-8?B?ZUdJWlhSYkxFTUJLZ0E5Myt6ajlkaWo1UTNYbTZZNUVvZW0yOS9VUm56ODNq?=
 =?utf-8?B?SUFQK0p6ZmpES2pVaWFUbDcvVCs0VExrTm8rMmtIZ1kreTFZazdaRlIzVVRP?=
 =?utf-8?B?S3VtYWwvWTkzTWtpd2dhbEN2Ky8rUWJOYWVtaG9Nang0NWQzdGRMVWlXM2FQ?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tjz9CM+ngbVgSBmmwEK6A3v8QeBV6r/s9Baw2p9b5hS8YMiqNEAraUtT9PlShw+V+jKz8tGN8GI5pFd9z/mxnfq4WiobeqRPRzqH5meyC2nl3fECQ4hG3XboejufYxIXSvrt/mPmBEoDy1QT7VSN5kgOtMUNyAGj+//JBpLQx7elJ6sXY/ZLK3lhF21zqCyF3LO50B80FhsCHRdMYfBiR6f+RzZJL6T9xEb7dIikqKzt5euqR8uKPPpZRiW+TxJtlxhP50dFaZWmJgA5ePKfiB/K6BJDrtPhvjWm8aDNRrkg9tnq5mtJegW3G3fwKKpFZRf4vaeYIz7nDmGGz3wJWvKpFXpCkgp3uQIBbv55DFJ2pJiXNoBmnfS5pIpi15zii9re19x5dGZ/EshCx9rhjavx3M68Cd5GWNpuswPgrXHI2gIgrke7cn9dyH1qO2I7VmlA63/35QPbmg29HHQbAcGf+NYxiWXdGIYpcc4vm3VIZxHXsehKg6LdXDQsQNx/mi7Ta3MiqVpMh+vj8lVoyLybdlOjEJTHI9lt2itaNSLz/zExz+5OV7VZtnptUIzJqAdj/DQhfwRC1Ei2vILLaYW8jtlmIf2lqMijHEz86IAX70TnGUJEqI3KGlquWvAyYkCo2VMufnNdiXTkf4VsXgPGUbGydbcG1ZpIsIDAjQfY24p2XYslB71uw7R6Xyhv6X6VtNf+Rxw2fe8LYT97nHUogumwMxefsl0Rwkm6WPlu1vfK43+caVV5CtU/fvTxIax/cBPzENdELcd80KDRvm+TDBdvQa8/QZKg5332BvQE5NJe2xfiZMnBNh207KeV++Y2rtDQk4a7eGreaiZB7wpU8owvfbHABo4C+Pmg3VQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75690730-7c52-4001-77e5-08db403600da
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 17:54:49.3338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lR7pXNC5gaVajTy1vagIenBO+cLqV7xHjVSjDMH7Tz6J06IUkFXFeNm+tfVrYtU2w2z247dYHjmdXxitqks67qHtMtr1uFpOHEyvuJswdlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6185

On 18/04/2023 6:30 pm, Andrew Cooper wrote:
> On 18/04/2023 12:10 pm, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>> index 36a07ef77eae..98529215ddec 100644
>> @@ -5879,6 +5880,75 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>      return modify_xen_mappings(s, e, _PAGE_NONE);
>>  }
>>  
>> +/*
>> + * Similar to modify_xen_mappings(), but used by the alternatives and
>> + * livepatch in weird contexts.  All synchronization, TLB flushing, etc is the
>> + * responsibility of the caller, and *MUST* not be introduced here.
>> + *
>> + * Must be limited to XEN_VIRT_{START,END}, i.e. over l2_xenmap[].
>> + * Must be called with present flags, and over present mappings.
>> + * Must be called on leaf page boundaries, i.e. s and e must not be in the
>> + * middle of a superpage.
>> + */
>> +void init_or_livepatch modify_xen_mappings_lite(
>> +    unsigned long s, unsigned long e, unsigned int _nf)
>> +{
>> +    unsigned long v = s, fm, nf;
>> +
>> +    /* Set of valid PTE bits which may be altered. */
>> +#define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
>> +    fm = put_pte_flags(FLAGS_MASK);
>> +    nf = put_pte_flags(_nf & FLAGS_MASK);
>> +#undef FLAGS_MASK
>> +
>> +    ASSERT(nf & _PAGE_PRESENT);
>> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE) && s >= XEN_VIRT_START);
>> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE) && e <= XEN_VIRT_END);
>> +
>> +    while ( v < e )
>> +    {
>> +        l2_pgentry_t *pl2e = &l2_xenmap[l2_table_offset(v)];
>> +        l2_pgentry_t l2e = l2e_read_atomic(pl2e);
>> +        unsigned int l2f = l2e_get_flags(l2e);
>> +
>> +        ASSERT(l2f & _PAGE_PRESENT);
>> +
>> +        if ( l2e_get_flags(l2e) & _PAGE_PSE )
>> +        {
>> +            ASSERT(l1_table_offset(v) == 0);
>> +            ASSERT(e - v >= (1UL << L2_PAGETABLE_SHIFT));
> On second thoughts, no.  This has just triggered in my final sanity
> testing before pushing.
>
> Currently debugging.

(XEN) livepatch: lp: Applying 1 functions
(XEN) *** ML (ffff82d040200000, ffff82d0403b4000, 0x163)
(XEN)   l2t[001] SP: 000000009f4001a1->000000009f4001e3  (v
ffff82d040200000, e ffff82d0403b4000)
(XEN) hi_func: Hi! (called 1 times)
(XEN) Hook executing.
(XEN) *** ML (ffff82d040200000, ffff82d0403b4000, 0x121)
(XEN)   l2t[001] SP: 000000009f4001e3->000000009f4001a1  (v
ffff82d040200000, e ffff82d0403b4000)
(XEN) livepatch: module metadata:

When Xen is using forced 2M alignment, the virtual_region entry for
.text isn't aligned up to the end of the region.

So the final bullet point is actually wrong.  I'm going to relax it to
say that it is the callers responsibility to make sure that bad things
don't happen if s or e are in the middle of a superpage, because I'm not
changing how virtual_region works to satisfy this assert.

~Andrew

