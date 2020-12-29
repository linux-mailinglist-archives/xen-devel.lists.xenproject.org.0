Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0802E700B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 12:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59835.104917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuDPG-0004Sd-Cs; Tue, 29 Dec 2020 11:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59835.104917; Tue, 29 Dec 2020 11:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuDPG-0004SE-9b; Tue, 29 Dec 2020 11:43:14 +0000
Received: by outflank-mailman (input) for mailman id 59835;
 Tue, 29 Dec 2020 11:43:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuDPF-0004S9-4E
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 11:43:13 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7b6efa7-d8a3-4950-b859-32128417ae2f;
 Tue, 29 Dec 2020 11:43:11 +0000 (UTC)
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
X-Inumbo-ID: a7b6efa7-d8a3-4950-b859-32128417ae2f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609242191;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KWPFtFxBXePA4cAG+03PfTXpNYIv2vY7JHqQyKx9W20=;
  b=Dvcz7HyQE9v2kEJM4RINu369+YocaUuAQL/BU14EqoZF5kTjZRe7USq9
   X5t2wbo+nDALuO9P/vRs27MY6++S58n/oNrGSdLa4JXWa+XKB+ZX+i9QS
   A/xlg8XYuPQREJmSooMMvUaBUGSHwe7KJdyj148cMD84RGtkV4pFWpgMf
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RsFMhJsbLLJXnyKrtM0SyOgVoLe39n9O3UQg8jPh1BZ8kXeiYnwaQmumw/ZgQCUjjTwqQx8UoH
 aadCuDPdF6nEQ0Xo4l42/MQtPIDoNoy86FFWQWvtozzBGPlXxipk4Y/KOvMbEqsrd11IW30pwa
 FySwOvJang5mnLUuRRfcxZxDF108Z6oLgzDkfZOZmEpSN4JfO1fG0OhLneZZWT6xyMZjzFXXP4
 mzQ69WrtYA2Z7llHHJVzyjEmuoAZy2ecOare5C4guz+JQBHJQctgIHqp5v+Kkmrm50ecCFD8MQ
 fgM=
X-SBRS: 5.2
X-MesageID: 34317885
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,457,1599537600"; 
   d="scan'208";a="34317885"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GU9tc0i8QasKwo2yBlgev/a1M6oCyAp6XTaJ1wXjbKOGPLMFDLZsmzkLDewd8zvXhXereifQLMb+EFAp3qpw3ycUb4Zqz5irMdUbgJibUsmgNXTv9U40UBBIxJqqXInqyBtiDbwkbU2x+rUI5fPy0V1fsuS4ywGmumj4c1RD2jfYHeDkwUW/BvkxN6R2Bv1EU2ufYceYgb0/UKCosozsO1k/xsKR9B879eNGaZk1AdMUcA+oRDcix72py0qJBJQjnxBsXNhcBDVQDAOvwLUqV9qn21aug/GVu04eBEGeikq1a6rtjsrDyCwrPks2dg6Zk8IES+hQSIFDCLIP6uoVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWPFtFxBXePA4cAG+03PfTXpNYIv2vY7JHqQyKx9W20=;
 b=LKqY7SnObjV9IKBpjX9cUNcIkjxnfmtG6nvxHZSlpAh/6aXm4u0cZ4Jj8Hn8V14vZdbNHRkcINIw/xJBjmAj5dVPND2RQaObCevC3xCvx1aRIuMv6IUazrbaaaLqsa+YKe50CUCVYwHaMXocIHrBp6ofTofE1O64hUjF2i9b4ePJ0kYzzKAb+RiLqrYCflyJeNVtwJTM5BP2W5BemUyiEex9+RU0Utt/K3eTSeBCZkgxcvjcqOiCG+EdFPaJUCokL+aUE6tDSQA9cpjXDDoZoxcl869UpevhsVLPTJYvBXusdOvMd/03FMNWx3eJXX8YLWDOaEoTBR5X3A2JFzNHCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWPFtFxBXePA4cAG+03PfTXpNYIv2vY7JHqQyKx9W20=;
 b=XE9sqbEkg7mLxU7uf/FhR+zrYMT+l1wwmZLfVITErYVeRSynF1LZ+0lYztsAuv9/9lt4GE8Ec6ZUARWCZrsAC37fAwOpgivKojjOG604Mq26Nk0z09iJrrlr+yhe3lYW+30KvLzk3JYiGusPqwrzEPH4sAWfaaYeokhq0zThlpQ=
Date: Tue, 29 Dec 2020 12:43:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 06/24] Handle the case where vifname is not present in
 xenstore.
Message-ID: <20201229114302.kqszcnb7ynk7enin@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-7-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-7-bouyer@netbsd.org>
X-ClientProxiedBy: MR2P264CA0158.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::21) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc041d90-1242-42ae-dca9-08d8abeee9b9
X-MS-TrafficTypeDiagnostic: SA0PR03MB5417:
X-Microsoft-Antispam-PRVS: <SA0PR03MB5417C1F2D6CF95A057A586488FD80@SA0PR03MB5417.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k85zy4EJOX5pxAAWtQNjailGb7AhJVXsfYYkJ1m6Js8spKbRDV2ia9+c5kNBryuU5VHPkuN8JmaNVpo0yJn5evbaISAUMq79XsfZeBC8HdC7N0BbKUUw2wE8to0PiMSXePh5NMh3t0l4A3hF+f0djC1JWEtSq+YT00ZSNGPDJAEGh7xrkFPtciOryAfZClMGfjrHpLQIUHiPB52HWGKubabP3BvLcpeG5mJcHtsfvT+lWEECe7QwBbECV15An6qMqeURx+S5rybUH15d/+VcYGSi30fLLYlrfgmcMFLytPTO3HQINBEKaSBztWiugLkDWe+abgre4ijBXMsqcHhgs4Htgdw7VuEI3SbiC9L9NsDxs5QAkRdVCOJYE808a49a95tPRb0r2ACWyDAulPKA9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(396003)(376002)(39860400002)(366004)(4326008)(956004)(9686003)(66946007)(86362001)(85182001)(16526019)(186003)(6496006)(26005)(6486002)(5660300002)(6666004)(33716001)(8936002)(1076003)(8676002)(316002)(66556008)(66476007)(558084003)(478600001)(6916009)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z3hvV3dvMFlEL3VZWWg2aTR6VnA1UVZFcDNCcW9YaUViVGd2UXZiT1dxTUZh?=
 =?utf-8?B?L1dyV1lFT0RuMGE0ZCtNMGlEZXRmYTQwL01iM21sOGJqWElIUy94MVlmbmpV?=
 =?utf-8?B?Vm84NFlKSGE0VDBxSERlczFsZ05oZG5XKzlDQXBmV29HNHNERTNRQ2NKTUZq?=
 =?utf-8?B?TDEvZGlINTQzc1k3M0NoNWxLVmtjaXhXK05UQzUyUjJhQWc3NUlsKytuUy9C?=
 =?utf-8?B?SC8vSXFMNlVVOGd1dDIyRE1VWC81MlhCQ1NpejdLc1hiaUJYZDNremluNjNh?=
 =?utf-8?B?blI0ZHBqakNCc2phdUF5TTEvQTlxTmZTZWMvdFNUbG9qVDREaW1hOXhGSjlu?=
 =?utf-8?B?VmR1SlNFbGx4RjgrNXBZTkdibkZlZDNIcmZjb244b2pGblZqZlhrYkVHaGtu?=
 =?utf-8?B?azNnV1hIN2JkKzR5ak5MUkhaYXFudmJ2WXJDcHQzV0JnYzh3cXZlWFAwcmZr?=
 =?utf-8?B?MXdRUEM3S2FQZkpvZlc0TE9pV3BkN3d5NWVqRk1QRWhmNGd5WGlrSlBURkti?=
 =?utf-8?B?Ymh4NnFXL3BJd1AxTC8zSm82emQ0QTBkV2FVR0JEWHB3Wit3bUFDaWVrYXR1?=
 =?utf-8?B?U0FHUnFTcWYxMUQxTjZFVkZtamdRd3lGNUZhazJTQmEvMm5UOUdlWjY2R3BH?=
 =?utf-8?B?TUF5a01aU1VSTzhTWlpPQ0NuaGpJSjlRTlFaMmFVc3dVMk12MGJGOHd2Snl5?=
 =?utf-8?B?dm52YkdtRjZqMVduS3ROWUM5eTF3RjlrK2VkQVRzOWRNZitNU0hIUkl3eEZm?=
 =?utf-8?B?NDQ2SnRSaysvd2V3WjJkQnk1bXVqdTcvSCtsYXdZd1FmUVR2akJkMUZoTGd0?=
 =?utf-8?B?VGd4UEV3TGFjc2w2L3BGKzQwR1JxWmM2RHNRWTN1ckh1S29BdWxCaTVDdEVY?=
 =?utf-8?B?cEp6YzdOaW1GS1UyS3JkQys1L2ZhaGFHUzUzUHJ3TGFPUWhNU05MOTNjMlly?=
 =?utf-8?B?dVkxWFpwcGNhbmx3UGVLOTN0dmxSVW9qaFl1em5tWEI0Wm9jaFBQdDdRb1Fp?=
 =?utf-8?B?MkFQZVp5c1hWSkR4MUdObVp5SzVIbVp6M2ZBeTB1c2QwUlhPb3o5UHk5d3hi?=
 =?utf-8?B?UlNFY1c5Z2VMRFpvb0p0ZFZwMmU4bE5qL09tdS9yQlAxcEdvWWVKMmNVVnZK?=
 =?utf-8?B?a3VJYUZDUUt1MUhaNTJNUlJ4U2d3N2hEbDFsQjlFNXZKYWd1OWhucUxLVWhS?=
 =?utf-8?B?ODJpdXl2dE5OQzJKcUlwZUExVitDNEV6WXJSTUZnUGlvSG4vYmpZN0xpS3Vw?=
 =?utf-8?B?WVJqUFVhUVh4OW0rWm9ENURJcW4rOTdkZWlIRHNoZitXRkRYdDA2YndJTkYz?=
 =?utf-8?Q?5PUBksyxlSmvgenp6DYjCTpkEbRbWhtQci?=
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 11:43:08.3787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: bc041d90-1242-42ae-dca9-08d8abeee9b9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Up05MB1eubOQtQzmHjIUdh3YHGFhsSWtGF5AM90Gxuhw4Kdf/sCrz8MaPdnN5u9TNx+cIV3zpRzNI43GlF4vKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5417
X-OriginatorOrg: citrix.com

Maybe it would be easier to just fix libxl to always set the vifname
in xenstore?

FWIW, on FreeBSD I'm passing the vifname as an environment parameter
to the script.

Thanks, Roger.

