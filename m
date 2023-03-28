Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677F36CC3D7
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 16:57:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515923.799292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAlS-0007tI-2e; Tue, 28 Mar 2023 14:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515923.799292; Tue, 28 Mar 2023 14:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAlR-0007qb-WB; Tue, 28 Mar 2023 14:57:33 +0000
Received: by outflank-mailman (input) for mailman id 515923;
 Tue, 28 Mar 2023 14:57:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0K3v=7U=citrix.com=prvs=4442f050c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phAlQ-0007qV-Uv
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 14:57:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc182f70-cd78-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 16:57:31 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 10:57:27 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS0PR03MB7251.namprd03.prod.outlook.com (2603:10b6:8:116::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 14:57:23 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Tue, 28 Mar 2023
 14:57:23 +0000
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
X-Inumbo-ID: dc182f70-cd78-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680015451;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Md+oQusXHQuKhOGF71sh3+DsEmo9+qF/sJdfObuv6Og=;
  b=UI7V7DAfWp0793xMHcnJonUBcsAXYUF9G+qL6NSCcFxzgqTID9IjIHlE
   0zxQHK5ZNGiER+8+xyCoya0c77Z8nFgcIAixj+bCamJJoOogCg5akagwD
   Zi9lFh1Vpgo42Gh6finuAqj+ufIN75tUwFOEQLScuBCkQNThHKXySeADs
   s=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 103284789
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Xze2R60LlPzOZITcL/bD5fRwkn2cJEfYwER7XKvMYLTBsI5bp2FSn
 WcaDz+POvrYNGf8LdwiboixpEoE7MfUzdQwT1FkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdkNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfEXpM0
 vw3D282awHch72m8qO/Sch2v5F2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6PkGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03bWfwXyrCer+EpWg9aNymWCv1lZJDQcQURikjtW+sECXDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8kN+pES0cLGtHYDBeSwIAuoPnuNtr0k6JSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNTNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:LM8YD6DDTgOV8AHlHemo55DYdb4zR+YMi2TDgXoBLSC9E/b5qy
 nApp8mPHPP4gr5O0tApTnjAsa9qCjnhPtICOAqVN+ftW/d1VdAR7sN0WKN+VHd84KVzJ876U
 /NGZIOa+EZrDJB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="103284789"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNgeFSVfTlIcV4D8MQuaq+dHnQ070Nly8MnxbBZncNxcPYfNjJQCCj9AFThQ/mGdBWznVqK0hfFmaegTQqOu96+QSTvGsrc5G1D7iurjzlcrkzyjL1pBzs3AWRrVnSx58N9HSVoKztJ2sku0f/rjbpYWnT2QcPDemPRIACvQd5ByuQCIOwKpgenP94E7lnWJpsT0gr8b2quzFf0I//nxhFSIYxfDCp6bfbneuIE02iY5yzfyAaiWAVy2Av1tO9rCNM3r2YvKr0mzeDNHXT6Kl3xgx3Gl0LZHRw3fo1HxqiAxZ5zEzawsVIHwrAvkIadgvBkmn+fqm7MUNzz0Akru7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ec8uG0wR72qhpTCf5BPrVMWzBpC9XXsWBL5rGI8uzjQ=;
 b=mJybmRl7VLPJsW0zmqHLJVxzZStUZoBw5CZbdfrc03cgcMYesEK/GherBqFm3YpDsP99PqIGZYFl5D10RFfQ2ScVNAm3KxBGQT082Kbv5lvB6Q/p8+UlQAtWmsDIkEXK8aCYW9ckBlXNOrYtZyktqojbUSE3ogkwwo/KKENbgVSJdS4XjB7UKzMceQWFMkFe8upVioCB+bgH9v8oliDs3W3LNaPM7qQpj0+PKfxRSbGHHNlXwC6IRBY/zXPdvy7s0tYdWZN2uLfIuudQ4sZXy6L055X28FPM9K5z1PzTSiBwCCuYy4GFp4xG1c0CJR7DTrWBEHda7C3mM2DzrZXIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ec8uG0wR72qhpTCf5BPrVMWzBpC9XXsWBL5rGI8uzjQ=;
 b=BRQhtfOpFhRvdx2kyRUqfi1lzKiuWpHdnk/0d1cxepyDv5eo3/6Knjz69BfKld2zliEV0rZW7VgyyEa2X7Hp8B1HI3DimydaZWOnAogqxHQoy5ZE/cC36PYSRjBiBOSfI6qR1Ig8cy03S20RKVLEpjZidplM1quOOLF6QzBbsis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Mar 2023 16:57:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/8] x86emul: split off opcode 0f01 handling
Message-ID: <ZCMAS1+pzlU2k6BF@Air-de-Roger>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
 <c8ecf582-2c1c-ca41-f289-b6a6a080061c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c8ecf582-2c1c-ca41-f289-b6a6a080061c@suse.com>
X-ClientProxiedBy: LO2P265CA0213.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::33) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS0PR03MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b4217a8-874b-4a1e-569f-08db2f9cbcaf
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IUg1rfrAILcVBo7OwAl+M/xpr7ltymxnfDyeTxnjPvS+PyVIx4DUlvutKSN73553w+eECY+tCHVQkVF4ngp3K0O2VyhF3ImE8mbDff3B/fl8BasRGai83lKCdHF6ghUE0mPFjIQvR6iT2HSWZHCobRaG+dD4XBuRWxhiDSFOekSR6yFjB4DpaBTypwtARL9AZPZp8Oha4jjJkSfK/6N580x9SxaG8p2tw1nOlCM+LpzSQc75H5c+bbEWjpao6wNz3rNimTPdLu3KoeTvvSrwGhcFusIm7AN75e7G3hPgfJeQTJgk0O8hYB1Dc/P86KNnHP9oSJ6A/GHU5VBJPTfLPZ62ei+JdzCoR7jsr3Ooy/3SjSClxLt/CdNdcD0CyaePbwTrdk9Skl663f9p5bKnSK2oRvOfIHJ0o4tyB3amM9O0x+cUmB2gHaWo+qQGOCrt8R16K33H6YEhcguLXhYAMR/IUrhOToQH4yZRFD0EpUUJtY/K4BABxMtJ7kwjurXtYBR/Gg3to7+tR1LbbJ+iOdyTWN5GFzqrCMpqbeGoQDwA73l2Iy6XuqIrisOKPPdxRiDMdfOyBT+dpxS9gyqv0AhfJyZvXXqyYsbSo3V4mXv6SSzcza2v1kgEboabOQs+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199021)(316002)(478600001)(54906003)(85182001)(33716001)(8936002)(82960400001)(86362001)(5660300002)(38100700002)(4326008)(66476007)(6916009)(8676002)(2906002)(66946007)(66556008)(41300700001)(6506007)(6666004)(186003)(9686003)(6512007)(26005)(6486002)(2004002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTBTL0xybTdjalNUQ0xGODN1QXRDZGNWYTJLRGdMTGRnL3pCNnRCc3V0ZC9z?=
 =?utf-8?B?WWZhZkZKaVhrVytlbllXUmxEZlphN2h6bUlnMlI1SGhzK3JNZ29UOHgreHBh?=
 =?utf-8?B?RFZWOS9WRE04d3JlYkxFQVYvNEkwTlNkVnk3ZXBkdFlVODQxL09uSjBBRGFW?=
 =?utf-8?B?WEc0Y3k4cVNlUEQvZFNCNTZOZ2NZcTFiYThUbE56aWRWeDRBZmhGeGw0T0kw?=
 =?utf-8?B?ZDJadTQ2VkZLeGYyVVFJdXU2eVpSYXdENWx2NzJZYlBwRy9uV0FMYWJCRy9Q?=
 =?utf-8?B?SjBhVlk0a1B5eno1ZDNXUEMraGNxQjI0dXZBOVRQdDBSb3V1MU9JZkhFTlJM?=
 =?utf-8?B?UkNxYlJQVGYzZE8xVE43bDB5WnJkemxHbEpNeXlVdmtUcVpVdS84eXZhdnRX?=
 =?utf-8?B?TUdyYTFjUWUwbmJuZ2JlK3pzWmlVU2syQ1l1Z3FRejJEcEx4dm5hSXhsR3Zs?=
 =?utf-8?B?bUhEbWswdDNqQTRNZy9DMjZybUYxTnZBZ3BRb0JxMmsrZncxL3RyYXNWcTFz?=
 =?utf-8?B?bGp3emRVTENkdEpDRUZPSlRCTWtuRjVGM2IzNWFqWnlMaVc3TTluTndWTWVK?=
 =?utf-8?B?aWp3K3VnTGcvbUlTUzJOekFUbDJkbEIxcmNPeDZscEh5Mk5nTUw0bkN0a0tR?=
 =?utf-8?B?YkhSWWgvZVUyWksrSXJlNEZ6dERYMm5KejR2eDV6b3NWVXQxclVveVA1TWNJ?=
 =?utf-8?B?VTM0c3dtMVI4aFo1eldEbjhyZ1dKYmxWbHhjU3BVdWRnTStGM01teWtJWUFp?=
 =?utf-8?B?VUFoSFVSOUE5dFJ0TlNSdUZYQVBUZzhmbGlZbW1LVzUyK2xVcmNYY24xdUhZ?=
 =?utf-8?B?YVRneW1peHUwN1crS05yV1dJMld6eUZHa0hNejFTbXhmZ1JVSllzZU9BcEFM?=
 =?utf-8?B?M0haRDQwYXl3d1ZqTEo4TUlDaFIycWRhNTNyQlVMOTdrbUI1QklTM29CYTMw?=
 =?utf-8?B?a3NRSTYydEVCUFk1SkFWcGFMTWJpYXVhV1U5QXliUENUeEVUNVRGNEdJcGkx?=
 =?utf-8?B?djJQWUN2emxqcGhqWkRsT3h5S1ZYMmFZblZoUUNKMW9sK1k2ejMrNnJjUzNG?=
 =?utf-8?B?TkxGWS9OZDhiOVlsUERNL1ljaitsV1lyUUxBSG8raWVrV1gzb3VhR0FmSjlG?=
 =?utf-8?B?cGxnaGxkTnp6cXdaV2JnbGRQdEFDYXVKUUVoMHZSYkdmelgrNUxSdjRXeGIr?=
 =?utf-8?B?ZEZKWmFBbGJQd3ZLREk3dmtHRXRZVFhiU3F4cUxZaVZqTUtON1pxaUNCY2x1?=
 =?utf-8?B?U3czdFV4R0hMZkNVQmlhTG42ZDUrSElOeUhUYjZleDJOOTBHN1VCcEN6U09R?=
 =?utf-8?B?RERtN3ZUNlBhM1crS0JnS1Y1bGN3Z2F4c05UNERRMW5kY0RxT1Vmd2ltdFZ6?=
 =?utf-8?B?Vjc0U2xYYXVLVWx3Z28wMDBLd0ZIYzhKcDJNZDhzRWlRRHUrVW93NXRMRFEx?=
 =?utf-8?B?SVFGSFpHUlg0ZHhHa0gvcmREZHA2Yzd4bEVSVDFxVjZRdnBKUmt4MXE2Z2tx?=
 =?utf-8?B?Q1ZTNzFSdEl4Ny9ValJjajB3OGNmOW1XYkxDNlB5c05qcEo2QTJScFdCTFg1?=
 =?utf-8?B?YTBkOUw5ZDVxbDJVRjgzemhUUDYwWjM3anAydmR6S09SR3pkeWl1aFZ5YTMv?=
 =?utf-8?B?cjlaYjlweG8zMERqeUViWWxhcm1UZDFlaFhVaFVJY2FaN3E0RGZzZ2piaHlP?=
 =?utf-8?B?NWhjUjZnS0ZpMGpJUXE1V1VwRnc2VlNsVDR2dW9KaDhyR0NPMFZqYTJuV3Nn?=
 =?utf-8?B?b2pnSDZBWkFFK1dLUXB1cFVnZG1WU2xERWw5QXFicFgrTUxRZFpuM3E2azhl?=
 =?utf-8?B?T0Fkb0xzRHpyTGtIYkpZUTlZK0JpNFpVaGh5SEtqSWxqVVU0Nm5EaTlRM2NG?=
 =?utf-8?B?eHRhMXp5Mndtd0ZaWlhseC9HUlVXZ0hWVWZHazhObHYwYzMydENrdU9YT2kw?=
 =?utf-8?B?VS9jbGp2Y1NyQUxEaWNvcmNIRDFmVlVid2dJOUNMZnpibjgwNUVBaDNRQ0E4?=
 =?utf-8?B?MzRzUnFxWFhLaGEvNnJxbFNDNDR3b09adE5jUHZzcnFybS9McG9WZmxJeGFO?=
 =?utf-8?B?Z21OUzMyUzIwc2hQaTRJSXRXZnZ5OTJSTDZTTUs1bGdGRisvWGt2Tm1KVURJ?=
 =?utf-8?Q?05Em+8WL6Kfw42tW2R5dIukvu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gGLP0bh47SloO/OV7S6hzH+26kUUJGt18tMdsrWfwpvM1+835DCT9KdjrOTcp/tt5Fn5ZkJuZu4VVb0Cp89KFSZStX1H2j0WELecjNUChqLcAjyHdnCNopXqUpxzXXTdP/DncXr3hLYOsOdaGT+VbHfwFsRsFsLbCAVRXzUq3rSXAwtebR9P3+P/4MDMRA4CjwXJGF8QOfEVcYFn/97R646wMnpScPSLk9vJxviMJnd9ZQzcAkPwcTeX1nHM/R5HaRdkt94Ez7lsJIC3wUiY7kk2p0n2iG6MXodrwTehPhoCpwL7Pt29ZCzlrwM/DoCVAyU14gFc+DkYaUr9s60wK4aFAh+PJWm8fRP9/CKyzazw7b6gSgVx6lSGoL9PrWd9IPBkYS0QYAmfHFdLEkh/zuyY3ZNARkl+OJASMkGh6d6iuwWGLnpjfDQbwAS3GpMMyWayxEwglAcBHgbJD8twFPcOCKAC4VPkNXU9+xI3/nf4TgGK6m4YBLhd+OSpn3hKMDcXy7deuoshHey7egh5KauddhVYgqCpAlE29AZXEgcpvmXzJrukG0ScFv6s1vS4Pn4zjoc4rHlzbMmQhtLllHezW0izUAIEFfeRhpaA7zAaEKwXMb8ZGZLYTSRAaTSR/+C3QnmZGTIXTA526aFIbttPFKh2G7VTOzKzWzJdR5M1QJvyCUb8EXieh/XnI32GUc6GZyAcVm3dFhJyOOSZtXuVVLyroPPCWqCbm1DaY25HFcLSIwnFnMObtnklRnvZACiGcwOJuVnNxmgJ+Fb/692TByZGisUPTroQAu0ubLDVAliZrOHE7/be6P9atQXR
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4217a8-874b-4a1e-569f-08db2f9cbcaf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 14:57:23.3036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToLbRlLY51+vE4vbO/mE3M+fFdA+HdHG7tn6oe3Lhwxq3ygD5KuYQhQE/CaT+S6mbeWRawQwhNaYFcSCVk+G0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7251

On Wed, Jun 15, 2022 at 11:58:46AM +0200, Jan Beulich wrote:

> --- /dev/null
> +++ b/xen/arch/x86/x86_emulate/private.h
> @@ -0,0 +1,531 @@
> +/******************************************************************************
> + * private.h - interface between x86_emulate.c and its helpers
> + *
> + * Copyright (c) 2005-2007 Keir Fraser
> + * Copyright (c) 2005-2007 XenSource Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifdef __XEN__
> +
> +# include <xen/kernel.h>
> +# include <asm/msr-index.h>
> +# include <asm/x86_emulate.h>
> +
> +# ifndef CONFIG_HVM
> +#  define X86EMUL_NO_FPU
> +#  define X86EMUL_NO_MMX
> +#  define X86EMUL_NO_SIMD
> +# endif
> +
> +#else /* !__XEN__ */
> +# include "x86-emulate.h"
> +#endif
> +
> +#ifdef __i386__

Do we ever build this code in 32bit mode?

Thanks, Roger.

