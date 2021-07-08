Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6AE3C1531
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 16:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153163.282966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1V2l-0007ZF-Jf; Thu, 08 Jul 2021 14:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153163.282966; Thu, 08 Jul 2021 14:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1V2l-0007Wi-GW; Thu, 08 Jul 2021 14:30:23 +0000
Received: by outflank-mailman (input) for mailman id 153163;
 Thu, 08 Jul 2021 14:30:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qibP=MA=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1V2i-0007Wc-ST
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 14:30:21 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa27d53c-e3db-45db-a7fe-56386e0518f8;
 Thu, 08 Jul 2021 14:30:19 +0000 (UTC)
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
X-Inumbo-ID: fa27d53c-e3db-45db-a7fe-56386e0518f8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625754619;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rTjQALzbrCnJJvrn3LSZIzsfY5FFImyYsa5npi49v+M=;
  b=AssUZgVfidBnjSdxDHuNltibY/nV3+N+CTGE7jd8E9psXomUi1+K9n8G
   AsotFuIc0orFQgHJVmeOtmiFN+58WAIo8Sxh5JEAbnqqva2EeRbZHuO0T
   LvkylBE3lDVhWdsStChMnxJ5C/6fsShzhVa009j0f5nDurOMDvDlwDLi9
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9czKw9DQ0JVk4v3p/m+Ccp4GmpQpFwILCGJET7E0PkXau+JUyOiHp5TcVBGH/5uy6wMT1L2VDK
 YtA7bIR14mbceK4EC0Xq7uO9uHRWEVKAjMRtsnMciLyJPnWNKtWJSsyjQdgW1eROs3dkjGNnim
 n0ODI9WtFXGmHDEgHnRC/imrDYBkSPpBeCwXE66r06BvDBSo1QJFl0iVGQXVxFvO98r5TGQYqr
 uWaVhctckmi/idC5UBwooUntBUjkR2E0RZEcFUg5BZNnG23ATIbGXiAVZ3TzfLLQNyYPpQOPFn
 P4A=
X-SBRS: 5.1
X-MesageID: 47838684
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VhX3qqu77DYoWVaG4E6f+GPm7skDrtV00zEX/kB9WHVpmwKj5q
 KTdZUgpFHJYVkqKQQdcLy7V5VoIkmsvaKdg7NhTotKNTOO0ADDEGgI1/qe/9SPIVyDygYlvp
 0QPJSWqeecYTYa7beYkWzId6dGsb/3idHR9JyutQYTPH8aGtARnnUJfnftYzsGDXgMdNBJWe
 vR2vZ6
X-IronPort-AV: E=Sophos;i="5.84,224,1620705600"; 
   d="scan'208";a="47838684"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9By2E2EHzXToh9OiL2jX09vMYpTimhqb31jNwTIHSYoYXjt9CfFH4bnXH2E/q1OZxkGQyCa6om3DxYiR61W8VDAdZxjrDOs5pgvvozUMrUporZr9ujGA1wfg0irghl5Tqk63j8xYMVYN7AsCmx1UbJNQKfyYH14nYQ2rs2YINsxUpVhVM5HrKU7fCdpubTyKa1Flot2PXAZH1cyDGmql1pWpLDJt2Xhamd0Z2BudG/iBx5aF97xZkdRmBwkojFbXNQfHQu8b2k1OVoe7VU6C7u+5dPHl/CenKpxFVoQcWrvmgtJf53nF4N6lgI8pB2Fr8G/mXdpXQjTLZ+3TexGgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTjQALzbrCnJJvrn3LSZIzsfY5FFImyYsa5npi49v+M=;
 b=WAKI3b8sN3bi9Im9Skp9c1N+0JnbAKsSWLvGBaYyZxXevuY6u2BvVzJARrabnZt39e4qLBiT18MwVIj9d9pL3OltHqo6O/ILyCpF1DUUFndjiJ630dvYQPMUEIyeBzua6kGXHM7lIzKf0qNIKG+awYaOs5htevadOAGJLIf1i++d6nnxL9SCz7hkcnkJiXhjM3Md+3qN3udY+lGCKhJh56FzhjoTM85l7SXcZxkyiXq+ldjGJ4XHI8XNK6TKh4JKI7eNttMm+vxI3qfZ9BLjPPnJtqkTNcR6XmYHSnEirOVVFAPBqeN4Pi3TBhGdIQ5duj6S1xfrQ53lsQU+mInqqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTjQALzbrCnJJvrn3LSZIzsfY5FFImyYsa5npi49v+M=;
 b=f0sL6Owdcz1t23ZfnLKGpbYE1mAwOgiDWDC7iF9SuVk47YpxjEi89WXKbG8BdUh7LQUNGEYnz0oSLPV38JjCoeunrboe0GDWIfX3/ZEEoXxjvAp2n53xWSIWouvls2u5YlXHAJo5G3vp7DZWzSLjhKcoPgo+zlyZANdh0x8Jfxg=
Subject: Re: [PATCH v1] automation: use zypper dup in tumbleweed dockerfile
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>
References: <20210708135704.25626-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0b16fc43-9b5b-1edb-0e21-024bd9cd9708@citrix.com>
Date: Thu, 8 Jul 2021 15:30:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708135704.25626-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0460.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13c43661-9434-4211-6300-08d9421ce712
X-MS-TrafficTypeDiagnostic: BYAPR03MB3559:
X-Microsoft-Antispam-PRVS: <BYAPR03MB35593A7B131C33A6BA0F025DBA199@BYAPR03MB3559.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o7vwkc3lYyZjiFiTgIzgbF34oNABIy+IgDOgyOAsJlZdq+IKWKLWKPEvLACbjboVVltENuMmFjgmi0RZ/4ReFxoiUE9SQNZZdZj8Jsqra9Uu6raR9kqEZmCx0oewnR+QRjUWQ082x4YLOrBBXPWkLaZEWUHaZj1HTLUfVwsrKgI37xi84XSR2Xff6VwNtL0RzOMRHae2Rj+25d1xv1B7LmRltKx+d4dTYA10r5uPItiCJ//2Y2N+omAjdznqoZU3iulTt1Y4rnEuctgmjOy9SV6B0kbOjCzx/JrFgTsyzoCOuiMRcp2WdewFHgdGiCyBRCVEuJpDrq0Ol17SdYNTyryTwnt6HDMAIpwkmCPNKuYFFBl/2v76fDzo/EzcSRsDQRCUTX4NGq1C8Byob21pbVERLzEfks4z7hDC8xJBz157uI6gp4nrYGCyX8UNl+rTW6vPKYSz2HdrSCKBuHupjC2AvCXwGaRMmq+8gNclI8qlD938VF1WLb92J75sDMFTExHm8EUUgqfHyp8U20UsC3DOWkH2FU7DIJIKZvUZBtSdSuAhs70LvuKiw5pjNzt/ckAFjUQkjI3taOGRnst/jWP+2gxjObcLdXSOd2CdPGqZWtFbOY6rj40cB6Dwi+uOZdWHZjdOvUocYl+oU9aEPbqvM7CqYQlG3SaFL7aQqq0k5CWDoCxP1rf2/FiJqKSCfUf3cTVwte4hgVBM9Qahivj/esAzRnWwOuGw3Lyk9S0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(366004)(346002)(376002)(66946007)(66476007)(31686004)(38100700002)(83380400001)(2906002)(478600001)(66556008)(6666004)(186003)(4326008)(26005)(6486002)(53546011)(956004)(31696002)(5660300002)(316002)(2616005)(16576012)(4744005)(36756003)(8936002)(86362001)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWg5VkFTZFlTUE5Zbm1qcnVEN0Q1WmlNWVFWcnVnb2tNblg0UE5aUFNoWHB2?=
 =?utf-8?B?TU1aNms1eUZtZFFnMTljdDNqOTR1cjJFWW9NS29QaHlrcFUySHRDWkNNbHVM?=
 =?utf-8?B?aW8rNG80NTNQTkRNeU0zWUR2OGFWWG91eE4yYUdvV1ZkT2NkZU03eGI1WjNS?=
 =?utf-8?B?NzNGa1ZiSE03cVQreWJraHJEWjdzUitpeDBIZXhSTy9YM3dLSUEwNXN3Q1Bs?=
 =?utf-8?B?ZURrLzVKb3poNnhrMzBoRFQ3ZHRxMTFBckdadTI5TlNuZnFSamNNUmZXcTB5?=
 =?utf-8?B?cndOMTh3T3dVcnRhNlduNDNMWEIrd3FjT1hoTWdKYkdDQjV0cE5neGpxUEE1?=
 =?utf-8?B?TFM3QzFBS3BYM1Bsa0lSQmxDSE1iNjJxbnd1RWViTTFHalFteXBRb0VCMWVz?=
 =?utf-8?B?T0JJbkNyQk5VQkNVN2NWM2Yxd291MXJWd3RqZFJFUGREaVE4SUhKbVJEZ1Ri?=
 =?utf-8?B?L3ROSXV1SzN0dGxsazhQUCtoSmlibStyeGNSQTVTUkZ3ek50NGhMMmR6WTNN?=
 =?utf-8?B?TnlSWkhiejZOckg1Z2EzOExBR1RJbG1uR3IrSWhjQ0lwQzJSZlZZckN0RzI1?=
 =?utf-8?B?QndLcURtQ3JIUCtaNGhSajViMy91VG05ZGVlaXUwZlpIT01XY0NaTWxEY1Qv?=
 =?utf-8?B?dEdydG1ZUFNLc2xyNmpXajFjWXN5S3B2TUlpelQ5YUxRSnFnOXJaVmhTRDF6?=
 =?utf-8?B?M1orOFkxOGdEV0M2a1lDSUtHOWlWZHVGOHkrdUtlZmpiSzhLQ0hmeFpRd0pO?=
 =?utf-8?B?YzNvYWlGQ2Uyb0ZsN3JZRWVLRElBSXNLZDFmYnpzemVMRmhWUzhKSFlVRlhS?=
 =?utf-8?B?S2JhWnU4ZXBWcHJrNmtQbXM4S0VKY1B0RGZnVjZvVGQ5ejJ6T0FBNkN6a2FL?=
 =?utf-8?B?RW9yb3lRNk1Ub2QxVCtnZThMWFBvZm51MTNXbWF1QVQxQ0dacFBkcGdsMHlR?=
 =?utf-8?B?Zk9WKzN6Tk91Q2dxL1RYTVptUTVGTEloVGt6M3JCVVdpNzBQdGJkM3JuTWQx?=
 =?utf-8?B?Mm1tSy9nc0o2YnpjV2pLQ2JUQk53S2dGSUFaTVhYS0dsekZrV0NCejcxQzU2?=
 =?utf-8?B?Rk5IUEtOenBaWW8wSlY3L3dSaUxaSWNhOG1lSTlQMVoyOU1vbVgwNFBpSFpv?=
 =?utf-8?B?MFZXQmpBdXlVaUk0czkwUi9GUUcvSURhaTZRcFpFTmY0OFo1Tkk2SXhWM254?=
 =?utf-8?B?SVh4TGlLNVB5c0VVbTB1TEhVUk84TW1zV0ZVdlVWMVVHSFFkdWFlbmNDV2lv?=
 =?utf-8?B?cEt2c0d1K0dpN0lROEI4eGVtY3N1WExwVWNISUhCTzNwNGYzMGUvYUpUUllB?=
 =?utf-8?B?K1doOStieUZtd2s1eW5kN0JGQkpiS1UzSFVESnVCYVhJUkdBczhma1lKMXZX?=
 =?utf-8?B?RUEyU29jYXlaQzJFQlN2UFZnV0R1OFhUcnBOYzVZRUlEckxYclZNVXo3U2Zs?=
 =?utf-8?B?UVhSUlV0dUZxNWhWU3cvWmIyUmJzanczNkNEcEwzSytBUGNGU2JDRk9OcXEv?=
 =?utf-8?B?VHcwZHd0bWtYanNsUSt1Ykh3R0VNZ25UOVBMUGVUUDJhSVN2ZmQ5Mm4vZmVl?=
 =?utf-8?B?akpWUGh0Y3VQY1dsM0RDL3JxZzRYRnRhalhIZ21oZkhrWDNORitJMjVLcjcv?=
 =?utf-8?B?RVIySVFUdTJBTEdLQmg3WkR0Tmd6THJzbVdDQzlBa3ZNdjlzRWRxcXM1QXdD?=
 =?utf-8?B?dldHRzl5UWVPL3RBdGVzTnBDcVdiTWJrY29tdk9JVW5YYWRzakR1WmNNKzkx?=
 =?utf-8?Q?DF9OLzEDGrtgwaXRZEfzVe0VtaKN4f8Ay+K5ATs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c43661-9434-4211-6300-08d9421ce712
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 14:30:15.5283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GxIMGa3s2u+McFeliS0PGfFzjPB51KCIKnER4IBsI7EGGHAwBzcN9nkftKOwFpL3oBY7XSvm0EfKOVku8vqefE0uYqtpOkb9G1bkN/K2yGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3559
X-OriginatorOrg: citrix.com

On 08/07/2021 14:57, Olaf Hering wrote:
> The 'dup' command aligns the installed packages with the packages
> found in the enabled repositories, taking the repository priorities
> into account. Using this command is generally a safe thing to do.
>
> In the context of Tumbleweed using 'dup' is essential, because package
> versions might be downgraded, and package names occasionally change.
> Only 'dup' will do the correct thing in such cases.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Have you rebuilt with this change in place, or shall I do that after
committing?

~Andrew

