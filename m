Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563F26D041A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516672.801186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqux-0000hm-74; Thu, 30 Mar 2023 11:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516672.801186; Thu, 30 Mar 2023 11:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqux-0000f8-3u; Thu, 30 Mar 2023 11:58:11 +0000
Received: by outflank-mailman (input) for mailman id 516672;
 Thu, 30 Mar 2023 11:58:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVKM=7W=citrix.com=prvs=44691dd15=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phquv-0000f2-P6
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:58:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21a4377d-cef2-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 13:58:07 +0200 (CEST)
Received: from mail-bn8nam04lp2046.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 07:57:44 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO6PR03MB6209.namprd03.prod.outlook.com (2603:10b6:5:355::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 11:57:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 11:57:41 +0000
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
X-Inumbo-ID: 21a4377d-cef2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680177487;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RIe60r++PhgH4eG1SHRNvAQkFD8BRzTqdeDz9ujf5EQ=;
  b=ZSQTdgy0RBR3JUnN8rFrfF2jl8K53zPyzHYEi8b2OaVvjzmmPktYlyxM
   IBA8YxaP9wPIKSFyL345JsaB5mhgM7cfjm11DJ4KT6KH/D8yabIfxrePa
   z+Sd6w14jN8WmHdFS3SyZuLQqETwd/rE6m+72Jj5/3EGNuAzsC4gbBLUY
   Q=;
X-IronPort-RemoteIP: 104.47.74.46
X-IronPort-MID: 103694869
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LZspZ61Ix77b6uX70PbD5fFwkn2cJEfYwER7XKvMYLTBsI5bp2YEn
 GJOUT/QOf/fYzH8f4slaIWwo0sG78OAztA1G1BopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdlPagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfAHNpq
 vY1MT83Nx2cgNCE/+OpbLlTv5F2RCXrFNt3VnBI6xj8Vapja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxovy6PkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHugBtNOROPpnhJsqHKS4CsBMjpGb3e+vsf6pEH9QtRTB
 lNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4P5YnlqYRr0hbXFI4/Tuiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAuDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:W3NtraHcBVuIDodypLqEGMeALOsnbusQ8zAXPiBKJCC9E/bo8/
 xG+c5w6faaslkssR0b9+xoW5PwJE80l6QFgrX5VI3KNGXbUQ2TTb2KhbGI/9SKIVydygcy78
 ddmtNFebrN5VgRt7eH3OG7eexQv+VuJsqT9JnjJ3QGd3AaV0l5hT0JbDpyiidNNXN77ZxSLu
 vk2uN34wCOVF4wdcqBCnwMT4H41qD2fMKPW29/O/Y/gjP+9g+V1A==
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="103694869"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gm6URKUKxQgvjZN8r+6Awcfff7+Oggk3eI2FbWcMcaMI90HxaPKLKp5XX6yVawweReLg+ToEbeyfmLTo4EmAGE33KK4kvBf2k5u4idT/L8M45LfHF+WUuPuWAGBkUPWcCf5aMBtFg/qemySLQt6pqQD5dKryeuXzxhbxwAFaHi38gLmMQzeWdFeMABXlDho4wmn7ROkMWWMqMdmtZ5C3ZaFKWm8KvIRXXdOZuEHuD7m4vv59TdWqMjlEgzr8cT/KI1JDBCit/yGsNfO0LqIkKNr+BVmXzy+OhqTGUgc0oA3ydC7uuZ9BYGzpHQM8m7W9lf0jBmWJAwtMvswP+v0nuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNtT79M0wU15ghgmZEdph8dNuTHCW12AL1Ql8JAOlFw=;
 b=Cda4RFMIxX1166EPdLP7PpvK61ltXNinXZLAdgUtdGqDc+4gBlK7pqZYgeDoL5dxhjaR3HW7iL3GJx7CxJv/b5ttM4XUSZGzWwJK9jTLQQ5cvXBY4v/uR7WNuwPxT1jTa/NhfvexUdVylc94TfNSh9aTeB6uxrz9elbzSe5FfrmEeTv2Iqcpupn47j5ahBYg6ZsdE8jorMdl84oMmOb4TKZK2mSg5MecqKeayRxTEI+++4/K2oPplfWZVngrmOMGjSW8wRQltsw9Im+e4nH2cmKv+UMc8UEVQ530Bpnt5V2HItA6QDBaR0zyykE61PieiwL7wA6GqVIh6HZAuU65qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNtT79M0wU15ghgmZEdph8dNuTHCW12AL1Ql8JAOlFw=;
 b=uv+XmUASvJmfkvxesK0YDTpv2+XOOyjKwU2apex4Dm/pVXaAWjX99Yp3y/dM6ZmjD7F1UDmRqh/c5suPcMc4WWv9N5RfSvnyuMzIWn2RCk/Rq56IA2PXnRxyCteZ+n6JqEF8iRtlZPAUT7KES7NrroapGj/Q6oZ2mspMY8BOSzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <85202e61-a5fd-e0a0-84be-2f56e5defe00@citrix.com>
Date: Thu, 30 Mar 2023 12:57:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 8/9] x86: Drop struct old_cpu_policy
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-9-andrew.cooper3@citrix.com>
 <03feb32e-4318-37cc-cb08-16402d4ea430@suse.com>
In-Reply-To: <03feb32e-4318-37cc-cb08-16402d4ea430@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0053.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO6PR03MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc56e76-f809-4d73-d9b0-08db3115f6c4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QL4q6eJySR1jlb0+rm9jxQ2+O6RStfd5dOp8rC6fEoV+6BuC6XkCXGcldPj2UuE4aBKTH+Cr6asOdOMpgDIWdcMA8jVCMgccPR2xm0rKodJsvzXApA0aFbd/xflp8HODRocaYr1HifPJyIn3OcMG96XnmerJydsLout3AYObG8BV9yluBhOE/IDSW25YIBJqu//PfisaGvTFrDOlVY231wadhSyu8W47g0mPi0mg3zK+3TnUEUzXsdohEuG635L+P9JASAidJhsvW7VQftqZwl4Miu/WqIM+tWYt0CIT8FRmDBhCdK8eAfpMBxrGLIe+TOix5hSK1fSy91Svs05EasxgHMaHYprQY+MPNpESd6O3ubyYkJq4Llbr834Lz8aUM658MVUC3xWe0cAxAjN/VSqKRb9xAOsRTKv6NQTE1nUy5xQQ5MmNVkUHG7dRqsErA2iF1he2YbgTDSs1ZQdSBSFCo297bgU0snJccsKsvJKMcMTmoLiDSUbmFRXBSe3F5zdIo4gjuJKj5OSQtjys3dYGDpZgUbZbq0h6eoGW5Xs9fYcp4SN1OKqXY4KiC0NH7fRHAn5wwKoRAOR5ny7cYGxjfqSVMXiepJVQjJ8GfMkg3j26I4NlOIRU9ZqmbMaSKv5wjoDnMNjwL/2tb1hPYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(31686004)(53546011)(31696002)(66556008)(6666004)(26005)(478600001)(316002)(36756003)(66946007)(54906003)(66476007)(6916009)(4326008)(41300700001)(86362001)(8676002)(6506007)(6512007)(2616005)(186003)(82960400001)(6486002)(38100700002)(2906002)(4744005)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHBUMzZMRFl4bnJqN0Vsc001bEtxVDBaeWt0ODhWVmxRWGx0N3VFam4yMmI2?=
 =?utf-8?B?aGtkZDZKeVVJMU5CdldMSUw3N1pkL2ZBUWpMOEtEdG4wZU1EWUdncFZZK3lz?=
 =?utf-8?B?RUM3SUsxd1phSkNRTmhuVzIvRXdHbHcvS0Z2SUlwRVo3UlNpRXVFdkZJc2Jq?=
 =?utf-8?B?aHBwK0tiYW5lb0hUb1Z1cHdUZ0VuQlp1dVVpQ0ZnS1M1V09yTVJpSUNXMis5?=
 =?utf-8?B?WGdxRlBjdWc2QUtXRlFwZGNuSmFyTm96dk1NNWUrY04weDRUTjJEY2hUM2lk?=
 =?utf-8?B?bVppYithQXdkcmVSbjB4U2g2WVBYQ05DRitLcG4rMzRBVXk5Qm93TGlCd0N5?=
 =?utf-8?B?Qis3ZE1BQTkraVlJcDRtaGRTeVAzeTFQR0JYdnVZSFRLOVBtWkgzWE9TdDNE?=
 =?utf-8?B?Ym9xdm9iQ3hxTjh5RDdsVzR5Z3NNblN5OFRnNXE0Yko5c1ZWdWREaFVLNVhZ?=
 =?utf-8?B?Q3ZBb2FYNDB0c1dBZjVrM3FvOE5ZT0VsUnZSbTRibXNSWDdWN0t1RVhNdmFP?=
 =?utf-8?B?eGRxYzlLYWkxT2NGaXhUbUhiV1lXNXhYdWI1dFZOREUzcjJMdHlGTDB4dmVB?=
 =?utf-8?B?ek1aTWtLUFdPeExyN3VBdk5aNE9jK2tjNmR0YjF1VkV0RkFuNmdFSWdlLzAx?=
 =?utf-8?B?T3dGdk40eksyd2tPS3QraSs1d2puZ3FSYkJnWDRYZVZsZ2s1eHRSeE45MGhH?=
 =?utf-8?B?eW5SbGtmSHRCUzRZRVQ3SjUzS0ZPeUZWRTlkejZPaS9KZkJFcTBUNUx4RXE4?=
 =?utf-8?B?bEpRNDlweW9SNC93WEk4SUttSUpSV3RCckRHdEUwcm9TZ2xKTldHN1VlMEc1?=
 =?utf-8?B?Nm5hVWF3OE9CbUlyQ2pXZTlWVFdvSzNqZlhjYURLd2dXRXFwWm4rV2NhSWUv?=
 =?utf-8?B?TGx5MnM4d3VDUXF1YXR3L0NhYlhKb0liRlc2a2JWMms0T1Y0SHk1d2FSaTFm?=
 =?utf-8?B?YktlM2p4UDAyYWZHS3RuYXpiT3NmNDVQSUI2c1FpbXhIUEJGT2JVTDRXZnp0?=
 =?utf-8?B?WmhkUXZWNjZ2clRJNXlubUk2UGswdWx0WGZUVjUvZ0ZJZ29rU21oS3BIM3BM?=
 =?utf-8?B?cGx4TFJ0UTliMXo3WGJKU1V6OFpXSHZKSnZLYlo4S25IdENFTVJKSVpMNmEx?=
 =?utf-8?B?YjNmMWdWOWYybWIxYW5xaFczbzlOZkQyditaT2tiL0swQlpYd2g1SkUwVERN?=
 =?utf-8?B?ZmZlZFovaXd1TC85ZlpGUjhBbS9BOEFUb0dIZTZwYm9rRk5XNTBWaXBWTG8y?=
 =?utf-8?B?REVBSDZhV2Z6RUNUaDJaYmg4NVRGb2x6N25ZSmpOWlpnZWNIQXNTZGJHT0ZU?=
 =?utf-8?B?WkRKZmhYb3ZydFhvTUFJcHFZSjR6NmR4TVJWVnFEVlZEcGgvMEVYYXErZitW?=
 =?utf-8?B?RDJMN3Ixb1VIRnpBYTJlZy9TbzZRdncwRWR3QmN3NkNySTFrZU9PajZTRzky?=
 =?utf-8?B?R0VZZHJjSGUrY3Rrc0lCNkdNTk04MUF6RDAzWTJyRTU2STJxYnA3bnhKNGJs?=
 =?utf-8?B?NFFLSXd0Vmt5SWN0d2w1dSs5Qkd0bm9Tb1g1TGtJQVJpVzJJeFAwZzBYdllj?=
 =?utf-8?B?VU9Hcmhvai9aejhVaVluSW8rSTU1bGcxeVN1aUVvdG01TlFpaFVrK01xK09C?=
 =?utf-8?B?cXV4UHZkb004NHBDTDZWaU41T1hNQ2E2Y2UwK21TVVM4RzF5WnV2WTFwVmMv?=
 =?utf-8?B?cXRaSUNzZXFiTWM1d2tuck1UOEJ4Q0lZZDhxbGc4QTNGK0pYaTlwYWtaWFhl?=
 =?utf-8?B?NURRY0VSNGtsZDVMeTVwU3JSUGdRQnFlNXhVVXJZZVNsaFFKb1NRcmthTGJQ?=
 =?utf-8?B?QlpiYm8zTDRKdXIzZnMvYnVyRFROc0JCZVhTcXo1Z24ybUtHdUhaVm1vdnNw?=
 =?utf-8?B?MEVBbThwOVREQWZDMzVVemhrK1c4YTFyMFZIbXF3bWk5SUpLZDBhbUU3YVZm?=
 =?utf-8?B?NG1CdzhqQThjM0h6akJUeWtrT0pLVTB5RDRHa0xOYzkzbXdXaW1lWVB2UU9Z?=
 =?utf-8?B?Rk5mT1hsYVk0c2pzUnBFRXd5bU82YWkxSnA4REoxUjZvbyswOUZZOGphaEk5?=
 =?utf-8?B?TXR5OW5zbnZmMmg0ang3KzRTVzJkSVU2c1p2cFE4TExjbytDZEVFdEtFRy9x?=
 =?utf-8?B?M0pZQmJNRlcvdGxDTWtETWlPaFJoVUNsMmZLMHVySjZWVUZlSk0wRktkZ0RQ?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7hvkPhS82MiDt2nrfaRGv6NnM9UnV46YoFzdKH50CYIpyVi22v8GO7y+SzZNuIDfyo8kjSEzVaDzDNI4nVTqWSceX5htOH6B6ocUufQBK0YZG3KLyAMNIDEzAsd8exkS55+PV6PoROo2fip7NVpz0WlJtbyYSNfL5leaLH/XV+U7Uunk3AJjMZvmEnxl02rO6tdgZIX4IbNLdgjSxvEPsaE3axIC9ZUqeZ+L1bhGEOTrC1GTf1fAOESkyx8yZ5rlUOArMt1wAdqwpwhi7AvKtvW6QwqcbSYf7LV8gjHDmVm8YJ9ydJSUbRl5GzfdcPeP/LLwYmholqtDzIKepJvRczK/hglEhIOv2otkvsmPOMdqeaIYFikkU4/9167aFOsw4f4qo7lVOG+XVAt7TuM4mH0IRuPSfYmnkpb3VZ6kS0sU1hFoY2j0Dmf0Qy2pJgUHvCeN9TkRa952NQjgOJ5YFVVEWydES9qnab5YNEqFD4cwoz9/vd0NWylCI5bqt2PoBFUsXsxpu6rZ70AW9kMD4JXd30zHUXOJgqeS/vdyPrm8KqB0JkLFVnjXYMsp4m3MkSy7orL71Qux+vLo+3FjTmd9PgEccsU4x1vi3qcIvhPmFSGxko9q976nZHw5WQknxXGOLpuovkpQTb8XRWUZBlz/MtQmerJoMfQv4wKmBYx69Pl731+U1+1TrvRfr1J0JWgSD/vPO2mzxKY4gMundFGJ+FJfjy+Gxwz/E1ZWNwUOIuQ/uE5vEM5RWFN2n+YI1fMlWkS41qGr/DiGQDDtwXKrfq92YOGDneJNyNEZ87Iqxvx/eolVGhTmkp4tUPjH34vfTBeByDTJ8A3AfbtwDw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc56e76-f809-4d73-d9b0-08db3115f6c4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:57:40.9938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clSgVEqOmRoo2NcgAZWPNfjcYta1C5B3umJiI5kZGfHHVh3oFXhlO77hWSlzsUFNNITCdYUXupdqyJYsRwViqhndJb0URJ/sF6XbhVh++IQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6209

On 30/03/2023 11:08 am, Jan Beulich wrote:
> On 29.03.2023 22:51, Andrew Cooper wrote:
>> --- a/tools/libs/guest/xg_cpuid_x86.c
>> +++ b/tools/libs/guest/xg_cpuid_x86.c
>> @@ -868,9 +868,7 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
>>                                   xc_cpu_policy_t *guest)
>>  {
>>      struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
>> -    struct old_cpu_policy h = { &host->policy, &host->policy };
>> -    struct old_cpu_policy g = { &guest->policy, &guest->policy };
>> -    int rc = x86_cpu_policies_are_compatible(&h, &g, &err);
>> +    int rc = x86_cpu_policies_are_compatible(&host->policy, &host->policy, &err);
> One of the two surely wants to be &guest->policy?

Ah, yes it does.  The second, specifically.

(One of the problems of having an API that's not used by anything
interesting yet.)

~Andrew

