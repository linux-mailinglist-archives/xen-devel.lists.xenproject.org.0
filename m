Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8F343CD34
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 17:12:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217049.376880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfkaH-00064i-RU; Wed, 27 Oct 2021 15:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217049.376880; Wed, 27 Oct 2021 15:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfkaH-00061r-Nr; Wed, 27 Oct 2021 15:11:21 +0000
Received: by outflank-mailman (input) for mailman id 217049;
 Wed, 27 Oct 2021 15:11:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMsA=PP=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mfkaG-00061l-6v
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 15:11:20 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22885f0c-3738-11ec-8474-12813bfff9fa;
 Wed, 27 Oct 2021 15:11:18 +0000 (UTC)
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
X-Inumbo-ID: 22885f0c-3738-11ec-8474-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635347478;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d+zYVzVzpCvYkJ9HsTezrHeiK+Jj4ut/Tkule/dGkvQ=;
  b=GGsxbsVQyrKTd6HTgxhqkDk8Dx+mF/ZPhmJsHnwKzV8SqDxdfLOZCtY2
   cU/+tMQlFY19F4oDVU3LN/4mJ4CQ4ulGm7UDUeKV9NsJdyAGTfW0qKMwM
   ZIaId0ag+xDSW24oZnP7eDETpcwqfMWxDoRtTBarw5GEJUxneFzst4m5d
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vIBzT9eAxsPzK4Sb0DGFee0i9i7uKaISFbcLtD0mQD1cKOp5CBNFWLIo6WsLJEIyD8GTjwVqC6
 L+n7PaItzjbq90gkOqq7zhQbgHXso8Mik+NiDxnIwJ9GJI9rJnMwrht3uilgoQ7WJwXfqcUtKT
 UFkc2rSuhvf9Dmugz1h6RmWzpVRkvVuD+FYaHW+R75V9MB+v8C9/64dL94m9RV7z6fJG5qmtuB
 UVnSs19bID2nYgjav7BZ5RhLEthQYpsgcFOV5g0U6GUkEGuP5rm2PHY7pGA9r/vx/zDRcLJXVP
 yH02xRE7/AJocOBk1lhK3SCS
X-SBRS: 5.1
X-MesageID: 56398759
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kCFxaKo6P53idgIJ0l7K2U8CWnVeBmLlYhIvgKrLsJaIsI4StFCzt
 garIBnUO6vfN2Ghe9sla4XipEtUvpSAyt8ySgM+rSlnFH8Q95uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2YLmW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncagVx1qI/bJo+QUciVHPgFVPLwb8bCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 pRCOGowMUWojxtnCwwdJIozzM6UuyP7VBBm60CKmKU97D2GpOB2+Oe0a4eEEjCQfu1XlEuFo
 mPN/0ziHwoXcteYzFKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ydG4lUyWS99ZM
 1YT+Cclse417kPDZsb5dw21pjiDpBF0ZjZLO7RkskfXkPOSulvHQDhfJtJcVDA4nJUmWyZpy
 wSMpNPgJABwnZ2+SGPA/7jB+FteJhMpBWMFYCYFSy4M7N/ivJw/g3rzczpzLEKmpoaqQW+ok
 lhmuAB73u9J1ZdaiM1X6Hie22r0zqUlWDLZ8ek+soiN1Qh+eJK+L7Kh7VzW/J6sx67IEwHf4
 hDodyWYhd3i7K1hdgTRH43h/5nzvp5p1QEwZ3Y1R/HNEBz2ohaekXh4um0WGauQGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZ93l/e7RY69D6iJBjarXnSXXFXflM2JTRXJt10BbWB2yf1vU
 XtlWZ/0ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePitKjiIquYe5dajOmN7lhhIvd+Vm92
 4sPZqOilkQEOMWjM3a/zGLmBQ1TRZTNLcut8JI/my/qClcOJVzN/NeLnux4K90/xv0E/goKl
 1nkMnJlJJPErSSvAS2Ba2x5aaOpWpB6rHkhOjcrM0ru0H8mCbtDJo9CH3fuVbV4puFl09BuS
 PwJJ5eJDvhVE2yV8DUBd5jt6odlcU3z1w6JOiOkZhk5foJhGFOVqoO1IFO3+XlcFDezuOs/v
 6akilHRT60cSlkwF83Rcv+ukQ+85CBPhOJoUkLUCdBPY0GwopNyIin8g6ZvccEBIBnO3BWA0
 AOSDUtKrOXBudZtotLImbqFv8GiFO4nRhhWGGzS7LCXMyjG/zX8nd8cAbjQJT2EDTH64qSvY
 +lR3srQCvxfkQYYqZd4HpZq0bk6u4nlqYhFw1k2B37MdVmqVO9teyHUwclVu6RR7bZFog/qC
 FmX89xXNLjVasPoFFkdeFgsYuiZjKxGnzDT6bI+IVng5T8x972CCB0AMx6JgS1bDb10LIJ6n
 rtx5J9Is1Sy2kgwL9KLriFI7GDdfHUPXpIuuoweHIK22BEgzUtPYMCEByL7iH1Vhw6g7qX+z
 ueouZf/
IronPort-HdrOrdr: A9a23:fjX11K4thez/8JrAkQPXwViBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXJVoMkmsiqKdhrNhQYtKPTOWxVdASbsN0WKM+UyZJ8STzJ866U
 4kSdkFNDSSNykLsS+Z2njALz9I+rDum8rJ9ISuvEuFDzsaDJ2Ihz0JezpzeXcGJjWua6BJca
 Z0qvA33AZJLh8sH7qG7zQ+LqX+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+qemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lsdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNzN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wqJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABKnhkjizytSKeGXLzEO9k/seDlHhiXV6UkZoJlB9Tpa+CRF9U1ws67USPF/lq
 352+pT5fdzp/QtHNdA7dE6ML2K41z2MGDx2V2pUCDa/YE8SjnwQs3Mkf8IDN/DQu1+8HJ1ou
 WZbG9l
X-IronPort-AV: E=Sophos;i="5.87,187,1631592000"; 
   d="scan'208";a="56398759"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1imqS5mt4yI9d7ZUzmYBElUvAofxUQDErwE5k8NdNmeeCLlmZo+tF0NIOWqQB9RJCzmSc+/MJfYGKVOcpuHZvaJMFCOLf2voNh1OUpKmHN68gKrHo7g4s8+quAzypw84z5Mz/goxQAOAr5nUPoRrK4dl1Y+3c0ntr18Cmgs90F5h1V9QuEfsAXOGatsz9rOq08wMUVf2L058gJWSjI+uSirUIgcDGN1YEpCtGP/ZvT8XKdy/JjGik8o4lth9BeRkv3cotesMxISgfNBFiP8b1vw5LOZ9Vgt3OS45Qq/aT06m9mQ0vk1qw1u79gbsVCv20udZO6bEp83JWD8dVt7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ia2GqD4k/yLn9puVehXGjmi3W3/nGkAK14/JGRToq4g=;
 b=egv/Et2je9KDXBZLrItOr/Q8sH9B19Ma40QbkSuJqUhLhOEB+GhEUriVRytxdcP7rD3K88B0q9qv/an9/JKBfjFTv3xzIEXu4mN+RsrP6JPpZaP/pw3eMVVVZRfsMQWziNaafuXa7MtP/jUm68Hybt8YowxVWqdDMhuUeZYxK2C6vbjVgSSqxAZcK3W/PE6fTODVOtaYMAXEsiMVipIfMpHUPwyouqXX6Uu7bWl57zbVfEwcZzzubg1XAaDGY+TCeP/tKsar8XktidCM7NtlMh3pOkFxAL8dzyg1flb/Vjfhxh/94AT9yd+txIkdqhHrp2ZAqhyF8HM+WrZXhys8IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ia2GqD4k/yLn9puVehXGjmi3W3/nGkAK14/JGRToq4g=;
 b=rQoN6iRSusuD005f1YMmTUMGvl/UXJXW5samftI9sYaHXW28pVOu1CyYctyu0q0eop4LPyvoqntxQTW7lUqVWDXb3rL+uFolNezT3Wg9y5SvytP1IU/1AzwSaf7Tis9TOzHgHxVM37pis2nnISmqJrtSuUdZ2MHM3hZbWpoPpfM=
Subject: Re: [PATCH] x86/cpuid: prevent decreasing of hypervisor max leaf on
 migration
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
References: <20211027140050.67509-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <43570e20-d8c7-9bb3-1a98-594ca7b528d1@citrix.com>
Date: Wed, 27 Oct 2021 16:11:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211027140050.67509-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0119.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca3ab3cd-1711-42b5-30c4-08d9995c01ea
X-MS-TrafficTypeDiagnostic: BY5PR03MB5345:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5345A91551CC681A449E01F3BA859@BY5PR03MB5345.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I4noxWwz4ppv5MhmVxKHjxibsY71p54OaafnelLm3QsqwcwjMiIEDf/BI+UFMudxSVkDfWuvcauxm8AJSUsgzFjMi8jV1peLxgtOLnHPQBAvkX7NJdr18e5QbH3Uk/pey7fib5UBgngY3tTyK0gDKxE0wmQpPijit9O7NdnDgyG0PIbS5X2Fy1qeGRCo0H9S77WpCeT8/2LZhXB7c32pjwAfm3LfT2o5k9i+qmpUw/qNajdXlBMxy8uo24CQ/xAvu+NTCLmHYPsrMBu0ouiP7Ybw8wilYdDs8GSwX5MhQIzEBVIo1lPeDWVR+bIkcc7qg1u/AkptWqmIqhWyogvh5G5SxLOuVXIGHyrnLRJ+Pt/4n3LTmrly7vOWyw5Pe+DYB0/PbT1NBbXLxaShKsqbXxfFa7uynzwJ4RGBQvDAUs40hbFwVBxdfMPI6nQq/vpBwvzAm7lS3hFmJ9Cf2CXpHiuvEKE277QvRmMWJype2U+1/rt5c91YO2nnv3ppvbsSHMXOQ1ecpZ2VanQi6uYt/XbKSDjyfAR1WGkKpkJE9y27TNW36Ie3y0sO53Iv+JmmyW8UMQ24hWlFJu1aEKD18ttR5XyGecwpzH4LQcDp4sQ4lLDtGaPSgQsaPB1v1FZY9s/mf0LGDqqxlLRRgbxDaWrj0viKjMqZH21SAS+eX1N9BT58g6V7vhHHiIiiGwLZpE9UPBQoacUDMnuZhJ6c1V9xCROLLGSVTUB0sah6Zih2HVrwgTjT7Q7Gl+PKtqoX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(316002)(26005)(31686004)(66946007)(66556008)(36756003)(66476007)(508600001)(6486002)(86362001)(5660300002)(16576012)(8676002)(8936002)(54906003)(4326008)(956004)(83380400001)(186003)(31696002)(2906002)(2616005)(82960400001)(38100700002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW9xTS84YkI0Nk5mSG8yVXFSNitHalp4Snh6YmJ2NVlwc2p2dWk3K1lYQlA2?=
 =?utf-8?B?aE8xTEVHeGxPaWh1ZThwejhGcDY3UnBON2I2bDBlUnlSajM3cVhjRlVaOG9m?=
 =?utf-8?B?SDdLWEdyN2RpakVua2dZdGZvWWJvVlFadGNPb2o2dWdVamJxKzF3Wko1QzBU?=
 =?utf-8?B?c015cmJqUjYrdDlocWtkZUtUSE56anFnZzQzOUNqNXZ4TDlyeVh6OVJ6ZDVT?=
 =?utf-8?B?OWhNVWlkdnRyMG94U3doWFFOME5TWTVZcjRhbFVJTlJJZ3o3Yi9xb0hDWG5P?=
 =?utf-8?B?OTcrOG5SVHRzVmZCZ0E4TXpNWFlGaDVVODVIWGpkMHdBRWNtWGxPRk1xTGp3?=
 =?utf-8?B?SFViQUw5ZG40M1pGMDJkakQzekhZd1JEMnlVVmJja2ZXUU10R0F4UGRVZWJq?=
 =?utf-8?B?Qk5OWFhWVkptRDNBa0NFNjhJb0VRNStwWVNRZzI2YVFQUHNDbEdHazdHOTZt?=
 =?utf-8?B?Rk93UWNwNDhLczFHTENGVktLOFJkSWVwb2R1QjBMc0NBTmpTaGt1STM5R3Fq?=
 =?utf-8?B?L2ZXc1lDR0Jnd3RmbjRIRTAyWm80T0xJNjA4blVPVTNCUGVwVlovM2d3eGpx?=
 =?utf-8?B?R0VRTXNhYThxUTdseUxyeTlRUk1mNWx0SVBpeFU0cFk5Wjh6R0JxU0FBU1pE?=
 =?utf-8?B?cnJMWkRMY1dFYnkxOG1vdFptWE9aaEJmMGc5ZnBXSnZEZWsxL2xwcXYzaGxY?=
 =?utf-8?B?RXJ4S2N3Ti9qaklzQTRrcG5LS3ozdnk0WVRYdjRwMk84a3RXZTZ6Qm02LzdT?=
 =?utf-8?B?YjJlVlRrTWp1Ly80VWIxdk1yVUx2UHRpbnFodW54TGszVjVUZUNnbG1kTWtC?=
 =?utf-8?B?SGQ5MCtSSUlzdjNUZEZGLzJyZzI3S3djY08wVkpRV2NPcUQvbm1MQXRmREFM?=
 =?utf-8?B?OUJzOUp2SUxwdVN5MWhDUW9VQzNNMWtuNlh2bmtHbk4xWUFmMHlEelJjSlJL?=
 =?utf-8?B?OS96NkxOQW5HWUZRaHg1YU9PTmRwN25leFhjQTAwVFdkY3BTN05wNUtCQWlC?=
 =?utf-8?B?QjF3R2tmT1crb3FBcnNJT3FuaTNCT3UwTERCZDhzSTVoVHl4LzVPMlFaekt3?=
 =?utf-8?B?TXhreVAyMGhUZitmSXRaQUdSdS90YVpOTm9wVmNZU1M2eFk4M2NzeWRZcExm?=
 =?utf-8?B?cnkzK0RXZHZKVmIySUpQVGI2ZEt2OTcwSGZwR3p2TGtkOEttQVh0WnhxRllW?=
 =?utf-8?B?QjBwaUFzWmtqaDFOZXcwanZ0TDVFWVFHbHkzNkx0YmdkWmkyUmxBcUdwQmsy?=
 =?utf-8?B?Snh1VHRPT3RQa3dnbmc5L0RXa3VXR0NCMURiYi9JZGhiUC9ZclJGNGVpcU5J?=
 =?utf-8?B?K2xNblJ0MGVTMjRPWDFYdllvMndpM3FqMTluK3dQWmwyV2twNTlJRVllNy9i?=
 =?utf-8?B?TFlnam8rSW94dDdDTGFUTkNtYUJQMUhXQ3hzVGtLa0FlZnpuM1ZEOTZiUUhr?=
 =?utf-8?B?VnJqWEpkT2tabEJSdnlxa05qUkg2NE50SGIvbm00MHIxOE5rK0FCbnRDYlBS?=
 =?utf-8?B?bWNjc1dWZ0ZzbWQraEZmaSt3TVpJVDVPREtZS3RiZityM2plUldiVWFoMm53?=
 =?utf-8?B?ck55MU01MG9NU3VyNWxjdGEvQ2xQS1hlc2JKZzlLUGNzOVBkNjd3TGFxNm04?=
 =?utf-8?B?WXhBQng5NjU2ZTByNjlkU0xDS3AyRGhjT1lrbnRNVGNDTzVzQWNVWTRkWUxP?=
 =?utf-8?B?TG8waDFQQXlQcnFDS0JZcWp4a3R1SExaNDBlOThUMFJWZzQ0M3NJVlpUbUlN?=
 =?utf-8?B?THNtODVWamF3d3JuS0dxTHRVZWdHbGhhUXhNNUpheXlHUXU1RWNiOU5hUFdF?=
 =?utf-8?B?QzRrYXo1VThxeGVwZ1dqbEkveEdRSmhaME1la3lhMnYrdmNUM21WWnkvbHNo?=
 =?utf-8?B?bDQ0REV2VVdtS3NOczd0aC80ckdCcW1jVGV2b3lrbDI3Z1JnWWJvRmZLSDBO?=
 =?utf-8?B?dTZKK3JsMUJEb2s4aktuZEdZanRVdTh4VGJ4MC9ucU0yRXk1TWhuUklnakEw?=
 =?utf-8?B?NW8wMFdycy9sNUdoTlJQM0JmZTV6WWpZQTkrMDUyNmg4cEtnOHFaMjg4c1hS?=
 =?utf-8?B?VklzQmc2YXo5ZlNUZlUvWG9ZVGF3bmVBZTZxak8xeVEwVTArT0ZSQzEzQmR5?=
 =?utf-8?B?VXBRWXN6THF3VGk0aTBDdTdpUFZhY3Zua081ZUo2ZmFLc2wzZE9FcE43Q2Fw?=
 =?utf-8?B?U3J5bmpVZithVUdoaGppUDFrZGlzc3hTaTEyUnlYdm9PKzlvSWpEa0xtTWxa?=
 =?utf-8?B?Szc5dWQ4bDExMDg3Nk1jUjBFeXlRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3ab3cd-1711-42b5-30c4-08d9995c01ea
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 15:11:10.1169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2V0t8h6oF1bykGS+B+fLfMz623713o6AEj0+zODzzseeQIGUCJa2mlUyY2nPCn9dKoKaeoHCgAktStWDgivdMQDMXXljT1QtO6XlNYV4zPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5345
X-OriginatorOrg: citrix.com

On 27/10/2021 15:00, Roger Pau Monne wrote:
> In order to be compatible with previous Xen versions, and not change
> max hypervisor leaf as a result of a migration, keep the clamping of
> the maximum leaf value provided to XEN_CPUID_MAX_NUM_LEAVES, instead
> of doing it based on the domain type. Also set the default maximum
> leaf without taking the domain type into account. The maximum
> hypervisor leaf is not migrated, so we need the default to not regress
> beyond what might already be reported to a guest by existing Xen
> versions.
>
> This is a partial revert of 540d911c28 and restores the previous
> behaviour and assures that HVM guests won't see it's maximum
> hypervisor leaf reduced from 5 to 4 as a result of a migration.
>
> Fixes: 540d911c28 ('x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> ---
> Regarding release risks:
>
> This is a partial revert of a commit.  The main issues could be that a
> partial revert could break the build or leave the remaining code in a
> non-working condition.
>
> Breaking the build will be easily discovered by our automated testing,
> while leaving the remaining code in a broken state is unlikely, as the
> chunks reverted are isolated from the rest of the change in
> 540d911c28.

This fixes a regression vs 4.15.  Furthermore, the changes to the
hypervisor leaves don't even interact with the rest of the patch.

Failure to compile is about the only risk, and this is easy to prove one
way or another.

~Andrew


