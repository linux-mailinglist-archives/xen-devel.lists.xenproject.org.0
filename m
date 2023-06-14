Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C431F72F7ED
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 10:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548580.856560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9LwK-0001zk-1j; Wed, 14 Jun 2023 08:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548580.856560; Wed, 14 Jun 2023 08:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9LwJ-0001xA-VA; Wed, 14 Jun 2023 08:33:15 +0000
Received: by outflank-mailman (input) for mailman id 548580;
 Wed, 14 Jun 2023 08:33:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0CzZ=CC=citrix.com=prvs=522257c86=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q9LwJ-0001x4-6p
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 08:33:15 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 188ed01d-0a8e-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 10:33:12 +0200 (CEST)
Received: from mail-dm3nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jun 2023 04:33:09 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO6PR03MB6209.namprd03.prod.outlook.com (2603:10b6:5:355::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 08:33:06 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::3474:a81:a100:1529]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::3474:a81:a100:1529%6]) with mapi id 15.20.6455.043; Wed, 14 Jun 2023
 08:33:06 +0000
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
X-Inumbo-ID: 188ed01d-0a8e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686731592;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=/xn8fq+AKaIrxDtZkEtLdFl4caVItXXRSkpaK2LuiB8=;
  b=DUClowCq12iBZga5c1uK4IZ+tOOfnpeKwvpzHOVRGJqJHBh1zEgeskpi
   nD4lqR7JXIAkChf5mJBoCbW3eJC0tsNtqZyRmgI5u+7knwJFbG2GgVIS2
   aw2XAZkVGu1/Bs9+7F6roawbvf+pZbCypvxc1yMS0IhOgH6NsGCzz3nYp
   4=;
X-IronPort-RemoteIP: 104.47.56.40
X-IronPort-MID: 112610657
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:I1U13qIP6DYHmoeoFE+RwpQlxSXFcZb7ZxGr2PjKsXjdYENS1mACy
 zcYDWrTO/qLYjHyfoslatzk/EJSu5OByNJqGwVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4AViPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5XK0Vs8
 f80IQsqTUmEuaGG2uLlQdhj05FLwMnDZOvzu1lG5BSBV7MKZMuGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTSLpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyv22LaXw36kMG4UPKaWzOFQok2z/0ACGjE6TVi5pOG9kVHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvU6SdHtbSUTTeR8+ySpDbqYywNdzdePWkDUBcP5MTlrMcrlBXTQ91/EamzyNroBTX3x
 DPMpy8771kOsfM2O2yA1Qivq1qRSlLhFGbZOi2/srqZ0z5E
IronPort-HdrOrdr: A9a23:RP9yOK6xe4siU9d2igPXwPfXdLJyesId70hD6qm+c20tTiX4rb
 HXoB1/73XJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIHZIObuEYzmIXsS852mSF+hobr+VvOZrHudvj
X-Talos-CUID: 9a23:MEn6p22flX5DNosrF209ErxfOuoBUHne4H7rBGzhDlgqeKfFF1Sh9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3ATdynNQzDc2yn9ynNdbM+22OqTKCaqL+AMl83s4U?=
 =?us-ascii?q?mguWVJwBcIzSfiSyzWZByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,242,1681185600"; 
   d="scan'208";a="112610657"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQsLkLqXprTAI/hQ3O/gXE656Z5P3vdGyxxVRSmp/6JGzsm6VC1hPwOHTe8rIpw0135zinzPS7Zd2US3hSZU5WoTFb4TTv5VwAOqFlwOVJlnZDahtVqb/56oPqU9O3JO3bOjqMvNOfw8Fr5EmyjRbuaqfXWkcbvGbiTDnLH8xHB0is8pcvxNfP8utpk0cpR/Q1Lg7zBePpbDWfVo4wibHhK+gz79hGdRHT5/uhCg/y/tVuCf0GPG/h9z2yhqiG7Ld81xA7aicibwN0Amon2kJjUw7ISYNaqXeQCC1XKlCtOslb/hg//MqxK92XgU8147rl+gTMu8qb9n+fktCrN9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4fx4wdfNya9VC8KWAVjl+h9vA569LUbD9ne2sHLE7Q=;
 b=ej/HGCx4mGZvve2TjpPwY9U1XCtB/ltZ44Q2Uk0VSh5uXHA2jWn3HqSXB2IsIIQW0ePtenO04oGoFo6Ol3nkD60dz/lt27txDGB09JgZK0A75fj3ab5jTZGnhrNB6EPSRgOztzytKKYKXi38D+IhlOD5hR4kyUljd3v7w0tlNHtlIXnqgqFrL3VQ9d3BaxnR8sVcRXWy48oq/UwFxXPEjCV2+on+s1wEKNsIqSnXOgAR8NsnL1GpKIDoyFXYvu+g646rNuldXF0T0eewO/qrs4YjwzQ9VK2HzcnwJVtVA2V/5OzQxj0y9WrHV7tUOvHlitOx8JdCbdrHoyg32vtE9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4fx4wdfNya9VC8KWAVjl+h9vA569LUbD9ne2sHLE7Q=;
 b=TlPui/biJ2qaXASwyOxujMRDPaeJTXl888ZPlcLgrxhP7rferWSj5Yk6KHFGV4O1iyKhz4H8A+52dGSJ5RGS9vTMAno7C7XjJYBZ6iya9Ch2/fPP5Nq5ZL9/WJRElA2Fr34Jndf0tCcGdQjSsKG+9w7OPUSp11P6qr5AXh7RrKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] iommu/amd-vi: adjust _amd_iommu_flush_pages() to handle pseudo-domids
Date: Wed, 14 Jun 2023 10:32:36 +0200
Message-Id: <20230614083236.64574-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO6PR03MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: a0022eaa-7e6a-49d8-5fc5-08db6cb1f9fe
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bGaWrXiecgxc1QOUNQTEqFjXkh+FDboxaw0X6+pWJCGyY1w8AOg8HO3hrpI0gqisEhBFxY7EEsv9099if/nCQgNV7sOKEaQZ2WHeXbtzx5vZbfYIU3RYY5SzQr+sF+pfIhZULzDQzEPOAUwXHFj9TKJCBWvwkaThXZwXfNE2qIaZQG/NTjQqrPq+AvpJq/9AVHKmticX+YMCVIAWhVvNR1ntviiw3MjmH0AsTFcwYB6pT3uBX+R7n/w8OO9FBgPrxUtCbtFr+xzwmAncs+mv8v82LnTY9JfvsIz00mLNoqhg4HD8ugedA/Uj6ibJG2B18NFAARDXB+fPfl8rR2Bx1z/9VKT/7c/cN0tLFyJKUXpJbyPaz54BsVT/o3VJ5Enibr1097goQzwzXszJjpAWK3QHHt50J8GYma7GBcYTowzC1gx/fIY/D7c6LsL6sBm5FHfMCVn8w3DMNIjztQlnISUcUL2wE/I0/NzPvcpaCv5hu5BG07DD4anOBkD7zTbLSHBljp90tfyaVmA5rju1Au0HyPnWyitdSlwhzPg6bfgLUVq7Kk+ZMluc5GMFuntK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199021)(83380400001)(5660300002)(186003)(6506007)(2906002)(2616005)(107886003)(41300700001)(6512007)(8936002)(26005)(8676002)(6486002)(316002)(54906003)(6666004)(82960400001)(36756003)(478600001)(38100700002)(86362001)(4326008)(66476007)(66556008)(66946007)(6916009)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWtFVFhtMkdhNUFYdkl6V1NTZkZjUno3eTEyUmdRQ21NT1YrVUZGRW5uaGxT?=
 =?utf-8?B?dzNUY1dLTDIxdXVENU9HblE0K0wwYVRFNUN3Z0FqQlljUzF3OGJiS2lQQzRN?=
 =?utf-8?B?RWZNK1laZGgrcmsvUGk5NXFDWnVNQXBwQ2FJbjkrSjNZTTZybXFtb0pMaWVa?=
 =?utf-8?B?cVMvVk4xQUF3Zy8rcGVsSU9HVjQwN25SNGhDNEY0OStwZGNERU1pOXhvODUv?=
 =?utf-8?B?RFZZQWpTckVNRVlQUWI0RldCNFN1NnlUYlo5Uk14eVd1RUo1bTRjYTFqMlAv?=
 =?utf-8?B?MERGN2dSSzgzZWs3aEhFbzdmNnB3ejBiY3IyM3o5KzFTZEJtTU5GaER3a3BJ?=
 =?utf-8?B?VGxXZDhGbHI5T293bFNNTUgxaThmRGNQcThHY2ZWNjZhenRXd3JtUzJBZGRX?=
 =?utf-8?B?aWV5L0pOeE1Pay9Pb3ZMTzU5bXZyMjBrV1dLTGJnUHNDZ3k3VjlLYldSakpq?=
 =?utf-8?B?NGNwVUxvTVFHbDdPaDhsUDVoaWdLSDR4eHJRWlBGUW05c3JHTnNqMWZxMGkx?=
 =?utf-8?B?czZ2V1cxNG1WN0g5WThxSlIrZU95bjJKRVdpaTVLNml5T1AzT045Mmk4MkJK?=
 =?utf-8?B?RlZnVVZ6elJIR0FyVWJ2ZnJGMFhmR2Z0RzVzMEtxMnZuUDdmdXdVRE9TNVdV?=
 =?utf-8?B?SmNaZXNsT1AzVDZiNk5IS21BZXRzb2Q5VkorWWJBRG9sVUR4ZXFCL1N5SlBP?=
 =?utf-8?B?SHM3QWJIVFhWRFVNZXNwR29SeWwrRitKUDY4MWNzQjlpelFZeDhLemZJNTAv?=
 =?utf-8?B?RkZTSzJKWGU4dUhBSjlnMUhVOVpNNUVNWGZadzc5N2dtUXByZFRFNVR3cW1t?=
 =?utf-8?B?dnNyMXNwemtpNC9FeWt6dlZyOXhJaTRJYW90M0dPOThUNk92U3F6S0Z4ZUZ2?=
 =?utf-8?B?bEFrSkxwRk9JcHVxK3JHVk9vV3hHL2JmQ1lBaTByT1kyNmxROGg1ZXoxclF5?=
 =?utf-8?B?NzE4QkRhMUJ1QXZhT0tCQnd2enR1cHk5V09LM3ZWOVYrQVhPbER1VU1zamhZ?=
 =?utf-8?B?VXpudFJ6cllsQ0NNVmlJYmNlQ0lub0FWdmNueFcwTVMrczMyUFlKM1FaU2hs?=
 =?utf-8?B?cExoRWVCM3dLQ2wwNlFaTGp6Z1I3eUNkci9kMExLajdGYjQ0VmxnS0J2TXpr?=
 =?utf-8?B?RUNwdzBybXJ6Q0xvbnAvcXV2eVZvWmNkT0RLdHI2UFFDSkFjWUorOU80d3Av?=
 =?utf-8?B?YTF5YjV2ckpsR0Q5Y2ZsQTFSVGZjdmM1bktUMnQxSG9ZTjF2NTg3SjdIUkJP?=
 =?utf-8?B?dFdhcVpyWTJERG9FRFlBOUNCcFZoOXVGeXg3dlpsT1pEelJKNEs1UWJkRzRz?=
 =?utf-8?B?T3RibDdtTVZIaW9jRW1SUmZEQURGVnVYc0JUa1JtY1JYcmNjalhUUFN2ZTl0?=
 =?utf-8?B?UU9qVzN1RmxlM0JNSGU1M3FRY082T3BaNTZkYXIycGkrNGQ0R1Y5dVc0T3FY?=
 =?utf-8?B?VytadjQrUlV5L01OOHJwSDhLUndWMW5NaHppUTlQTHZLRmMvQ2VjUlF6OFZB?=
 =?utf-8?B?TVc0dGpBbGZQYUhVcWVmSUg4amN6ZFViN0txZis3NHFUVnBqbU1TVTlEOVdz?=
 =?utf-8?B?REpLWDNwUU9yamhlWGZ0Ykh5M2c4dGp0WXdwaVJLTCs1SFhDTVBQenFvbmJF?=
 =?utf-8?B?YTZXd1FIYk5mR2orMjFEWllKdFZySlh0ZVVoZHh3cCtvWWtOUitHWncwTXN5?=
 =?utf-8?B?T09CUUgxVWkvUFFLTkN1cDZZK1VDbTU0OFJTTWNhVTcydXVtSzI5dGFSdTVY?=
 =?utf-8?B?SUJsSE9wY1duNitHeGIvRE13Ukp3RmgvaEdhZ0tZTjNSTmdreWxBK1N4M0xZ?=
 =?utf-8?B?RGlpb3ErYUxJcEZ0elBIOWd3eGpMU2VLRlJpbkFMUTF2MHZpeDJMTFZNQTdQ?=
 =?utf-8?B?SkxJdE1XaFV1WnhlMExHbllBajg3ZlRTeWVGSmJJNnBSRjRNTWtyRHl6Mlpy?=
 =?utf-8?B?UmU0cUpCZ0MrRWdldExKRHcrVGFMeCtLcmZTOGpsQU1sSThiUUF4QUlBc1I5?=
 =?utf-8?B?TlZPZW1oUXl2RVhFWlA1VFFjSzBnaDdINU5McDRoUE1Gc2IzK0JhYmozZHB0?=
 =?utf-8?B?RXVnZllLOHRqWGJRTHdsZEpzTEdGaGMxbXo0dFlERDF2cTJkSUQrRlRaM2w4?=
 =?utf-8?Q?h5wgAPJW6GFYAzzF2Mh0B/5FP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uhkUPn1O2LtpCr50mZEzaEsL2JsEUAlGIkycRaUIZb0VbZQENRtkZxcqQKrdmlNAcacACa98xqb+O0v8aULxuktkuOwWqTpXJdPKJy+EbQvThIucGLP5Ldpe0Vcdo6Y486foonnUIqIqRBuNvRx9rDZU00lkKLVXYWgMnZkt/PzopeRrTx0t+Cm3Mu1s2asz5Zh8Mx4r7J55H1+IvhKaWZjMH5e4E5W6kouDPXZS72rlRxUj6MjS68mwvqYsqFw1DQ3cyUjUnKFyCG6Ds9Gca08UROTU1Aea5SDUQZ9lb0rUr/q1t/IjjmooB3e+MwywMkSrfrDExQpj4zwUrxdYoReKEBiIbdsMPXWhIULKVnBkXrZ6JDpxPs7ZekGE3WAdxiLxLpvkUe0oKlOIgInKjDK6rQjdg4QDFj/mYYiAhDSKnYUJ70nuzq4wRTp3an5unDkCHaI3GNxgHbzBsuJSI5zY+46gdwkVqMoP8Zltld0t2JSVbNkWYcB1OqJRsCctU7BrK6yaBEY8Wa4CmdfooF85I+Ov9HeND5NEfTsfrSyFF8kKtJCd/m+cVXc7jRbl06z4qGDF7PnjyPFQpcrnGnuRxq2i51xYt7QJuubQFMa/FR/6Oiwcyob3VcGFlifwCkUJS5qxRMxceAXCJkzGJW1sD1U0XEBoi+lt4sZl+1TX4niHBNS73tWbROiHsMiWLLWhbURKEM+S9VHdBKA/MQcPhjXkAfR+qXIyXnFJGqZSPsTdT70iIIMLvEHzigEYcewtqyPs13PBbZDA+e14tcdJeOoiKkiDZ87ICzQpjw4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0022eaa-7e6a-49d8-5fc5-08db6cb1f9fe
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 08:33:06.4860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMez8cFLhFJe9CNZgYEp1vhmnsmKnw7W2sWDaKb60PHpLZ4CIkEZ6vURIXd0hl3MFM6NN9FvKaoSNA1qHjVdBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6209

When the passed domain is DomIO iterate over the list of DomIO
assigned devices and flush each pseudo-domid found.

invalidate_all_domain_pages() does call amd_iommu_flush_all_pages()
with DomIO as a parameter, and hence the underlying
_amd_iommu_flush_pages() implementation must be capable of flushing
all pseudo-domids used by the quarantine domain logic.

While there fix invalidate_all_domain_pages() to only attempt to flush
the domains that have IOMMU enabled, otherwise the flush is pointless.

Fixes: 14dd241aad8a ('IOMMU/x86: use per-device page tables for quarantining')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Only build tested, as I don't have an AMD system that I can do
suspend/resume on.
---
 xen/drivers/passthrough/amd/iommu_cmd.c  | 29 ++++++++++++++++++++----
 xen/drivers/passthrough/amd/iommu_init.c |  4 +++-
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
index 40ddf366bb4d..ff55e3b88ae6 100644
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -330,13 +330,34 @@ static void _amd_iommu_flush_pages(struct domain *d,
                                    daddr_t daddr, unsigned int order)
 {
     struct amd_iommu *iommu;
-    unsigned int dom_id = d->domain_id;
 
     /* send INVALIDATE_IOMMU_PAGES command */
-    for_each_amd_iommu ( iommu )
+    if ( d != dom_io )
     {
-        invalidate_iommu_pages(iommu, daddr, dom_id, order);
-        flush_command_buffer(iommu, 0);
+        for_each_amd_iommu ( iommu )
+        {
+            invalidate_iommu_pages(iommu, daddr, d->domain_id, order);
+            flush_command_buffer(iommu, 0);
+        }
+    }
+    else
+    {
+        const struct pci_dev *pdev;
+
+        for_each_pdev(dom_io, pdev)
+            if ( pdev->arch.pseudo_domid != DOMID_INVALID )
+            {
+                iommu = find_iommu_for_device(pdev->sbdf.seg, pdev->sbdf.bdf);
+                if ( !iommu )
+                {
+                    ASSERT_UNREACHABLE();
+                    continue;
+                }
+
+                invalidate_iommu_pages(iommu, daddr, pdev->arch.pseudo_domid,
+                                       order);
+                flush_command_buffer(iommu, 0);
+            }
     }
 
     if ( ats_enabled )
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 7dbd7e7d094a..af6713d2fc02 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1532,8 +1532,10 @@ int __init amd_iommu_init_late(void)
 static void invalidate_all_domain_pages(void)
 {
     struct domain *d;
+
     for_each_domain( d )
-        amd_iommu_flush_all_pages(d);
+        if ( is_iommu_enabled(d) )
+            amd_iommu_flush_all_pages(d);
 }
 
 static int cf_check _invalidate_all_devices(
-- 
2.40.0


