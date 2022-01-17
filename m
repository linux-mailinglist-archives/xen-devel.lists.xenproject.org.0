Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A5B490582
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:57:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258064.444001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ol1-0000EO-Pu; Mon, 17 Jan 2022 09:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258064.444001; Mon, 17 Jan 2022 09:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ol1-00006m-Da; Mon, 17 Jan 2022 09:56:59 +0000
Received: by outflank-mailman (input) for mailman id 258064;
 Mon, 17 Jan 2022 09:56:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAtW=SB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9OeK-0003a5-W7
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:50:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d65bf9bc-777a-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 10:50:02 +0100 (CET)
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
X-Inumbo-ID: d65bf9bc-777a-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642413002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=hkQ2AWUnU776/5v7x7o+GfYEYjuYGTJaTIjvyxCIHGk=;
  b=Wv7cXjPCll1xeGfqJc9CX1f+iYZBRljiO/1+rvP4KtSmA3yz9hNAZmiB
   6E5+jyKy2/+TQTm2TNdcUwzm0OBYeuE6sYqHBaXK4QheY06gRiBb5idUA
   YWJ28Bq7Lq3KjLiXujcZp8+siBeBeQHlOst/GN6008djGv7Y8bXG725Tz
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8nKOM2fLz4GgF6gh0go48lyr4jQ/s9FLLnaeltdEyjuGCWtBcNefo0vCmkZhBsg+UjniTAGpnn
 2UIThhsQElTmlhvA12M5CkIdIuv/0F0xjMhn7pZdI7UA/9/GdTVkfxTc1Dvl/NrKBC99cQMS8D
 h+haq6+1WAv/9kGvVcuPOXNqBCSbd7Ulk4ORxEVYJI1BBrxpS3WNf9XbmFtDckWmD2ZvQAsuiE
 97ztbd8LDgqMdpISV9jzMK6KCMuaLKJUDovZ4WGscjoSrVxyizooTUgHEG2DCYZ36H+9HyxnJ9
 yJdI6c5mcrOgN8RKg2Rapnv1
X-SBRS: 5.2
X-MesageID: 62138868
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0ZRm7a8BZFmFX9A4vwZPDrUDZ3mTJUtcMsCJ2f8bNWPcYEJGY0x3z
 TEaXm6GPKmCNjP3e4xxYYjnphxVusXQn4RmGQZurik8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dg3dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhJy
 tNJnpLuFjsmEYj1itsBQjljER9HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGhm5r1pAQTZ4yY
 eI5d2ZqQizsbCR0J3hMAZUVgNewhHfWJmgwRFW9+vNsvjm7IBZK+LriKt3OYfSRWN5Y2E2fo
 wru4GDREhwcctuFxlKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTWAoniAlRBCBOZfPMgD+j6R24rv4TigUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P82rsZHF9wXsqIHZdEFBbu4WLTJQb10qXFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tGuVh6b/PuREDGQ3C94adu51qXHb7
 RA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL5Jt0Au2EieBk5WirhRdMPS
 BWO0e+2zMUCVEZGkIctO97hYyjU5fWI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jOF3rghjmzK7bc2rnnyPjOvFDFbIGOhtDbd7Rr1jhE9yiF+Lo
 4832grj40g3bdASlQGMoNFDdg5bfCFrbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3TApy6QL+wD5t5s1whOikgYQSh13Q5ON7956YDbZonO7Ig8bU7n/JzS
 vAEfeSGA+hOFWubq2hMM8GlodwwbgmviCKPIzGhPGo1cal/SlGb4dTjZAbuqnUDV3Llqcskr
 rS8/QrHWp5fFR96BcPbZav3nVO8tHQQgsxoWE7MLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94rwSrlwBEtXGWXf/I2aDyiC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYln3WLNtJn6KgZtGuqFXn+ILvAK3X
 gSE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6rOidTEFfHxiQkygMfrJ6PbQsz
 folpMNLuRe0jQAnM4regy1Zn4hWwqfsj0nzWkkmPbLW
IronPort-HdrOrdr: A9a23:pLDbSK9c1sy4KeeGgbpuk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhOJICOgqTMqftWzd1ldAQ7sSi7cKrweQeREWs9Qtrp
 uIEJIOeeEYb2IK9PoSiTPQe71LoKjlzEnrv5al854Ed3AVV0gK1XYfNu/0KDwSeOEQbqBJa6
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0lN
 gsBJ4Y4I2mfvVmHZ6VO91xM/dfcla9OS4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="62138868"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhUXSSwaGlF2vMz2FYg86dHzCuLgWQKX43iLx8w/Q7IDeKe1jPrdyLYJ0uJYQmSth2vozFxuW4HerFufNIsIHAbD06n/0oeww7+Yg/Di1fpHG3GtUoBqKktQyEIcTut26DHvRHUaJO52h6aP6+Oown67XU3e8meQN6fL98FYyfnV/aXdCvgsSD8mrIIAkiwqg4zSkyPxdSt4oJWw5dFVZgGu8Ib/rwIEMEpc0pmGAvmdQUeK7MhfkzN4CmyHRhVo0e6N6gdt9YAhrfOS5Be2MmgpJn5iymXCFMA5uNTVAuUaezhQ2voVX1PqlKypR1PIaf+C4fJ6KOPCy2ubnO6kKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+CVOtJHKY5btvqsgPmIHyF5mBuPcqGVSNvPsYPwWz0=;
 b=b1K/H04hu4zHCgGo5r9AucvJDiibSCAFolEMHg5ZTQd2tmmd2O+iIOm+ShptoP8qaMZ+nJXSiQy9iNQszYm+siEUjP/eHrA6N0wTrgUM6DcVxpdp4kGrPrgX0KfP0XBkz5Y+9Up2Atf5iFBUW+18/WQuophHh6q7RfDjsn7XHjtCzociZRUiC1ILrjI0DfFz1BFoRD5ovQ1Uhdv8aZZM+IW3rzKCLcZyy4YSuwbAe1fS5W0BkdpnV7PF31fhC1dTj/Ds+CcwCM6GCg5xTJVCzKGoX+qbkQSoSrKOp5uEdLn/UXgIZsV95yfGD2gXhcX+fkxmSSPCezRZzrbaUxeLcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+CVOtJHKY5btvqsgPmIHyF5mBuPcqGVSNvPsYPwWz0=;
 b=g/gG4jW680+HU6UujuY8WRAn+1T9ycVdpxm+GyyNQxbqquXIzUko2u/wvKkLhCyksL74YuShuyU5weex0cCG6zqYSCcP3qh5iLEgy3Vnja/2Y/noqF7E65qfvhZW7T34qRyPKxjgjuEi+angXzoxTww9VCtrly3jRjhqvWwqiA4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 11/12] libs/guest: (re)move xc_cpu_policy_apply_cpuid
Date: Mon, 17 Jan 2022 10:48:26 +0100
Message-ID: <20220117094827.16756-12-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117094827.16756-1-roger.pau@citrix.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0170.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::9)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b791d97b-b104-44bb-dffb-08d9d99eb890
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB405907A50D3C111D2E0E28058F579@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:272;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L5cpUW3/mPcFULwZe3loqdlfNjA2vKyq3ejNy3R3S6b25fH3ewEIki3Wpz2lEibQdiYk7Lq6tFrjMpFiDDD7YjsHIYM5Ct9gW2cDn63n34ONnymyIlGjg89kEhgNRmfRTScGuk/P0tFYJ0YybZ9uaBktXKSTfwc77xhlk9Awabgrm6+5sjKCxoHQ0CnY7EUdXSM4UGl9tMd5OYzEFd0wH9CP3Cvfa5Eh6iRnf9/THzr0ufbokbSHBcks+AjTVhYChhywMYbXx5sYM0wJVk5D8bH+EMF2jlTGCFt0xPo1Pb65MizIGdm0SFVkqeDturPII1wZklb5EJcLGXuhB8u+Dbj93clEWX9jWCduA1mRzVLFWkpjcxowk0QL7P0j1U3LWwluYMfjhPG6/tJT3W9tcJhdCd3IkP717H4k1lI67lSUqK8OihxNnFPhtai5umIXvoaCuZBjwkYPH73N20n9HMZvrLGC2zc7/9qFa2OKAidakbB/am2fLzww2AllYjXM+4Bna5pYEIVnyNKDmzdmPaR/nFNKcObdfprev+8sw66WC7zdPT4nRry5PXSP68kwy7gyu3zhuy9fl2y/S6AaIo2avR7pbgdDSqVzm5MoDZ5l/2ecT2yswMmMXyDQDvxyAOYrK53PRKRoKKAuPTJqPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6512007)(8936002)(186003)(36756003)(6506007)(316002)(83380400001)(38100700002)(30864003)(6486002)(26005)(6916009)(86362001)(6666004)(8676002)(54906003)(2616005)(82960400001)(2906002)(5660300002)(66946007)(66556008)(66476007)(1076003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzZKbEV4clhvNEk1cUhIRitjTU5rcVBWR2tiYXNQL3NYVXB2RXhWVlBDdTB6?=
 =?utf-8?B?YVFFWGFuNjRrRm90bjhwWWZtVjk5UEYvdlVZb2NxVFFWT2oxSjFMb2xpVnRL?=
 =?utf-8?B?YUo5bS9UVkZ4SkVmVFI4MGJidjZnOWtqR1JtOWwwQ0ZqZFdoc1BGVGp6bEFI?=
 =?utf-8?B?TmcyTEkzZDc5N2xBeFh3Z2RXcUwvMjM3QzhzQ1FBamFHaDZXNWt6UDhMRERa?=
 =?utf-8?B?MjN3blMycXVpYUFFeWJwVVBFVWp4OEl1aXlLSElSRC9tQmxsaDJmQk5NQ2pq?=
 =?utf-8?B?QWExK082b1dUZmFzeC9MSlhCYklDaUZWUFFzNGhlbW5vTFdEWFdqbjhlT05p?=
 =?utf-8?B?ejZ4TmVBNWNKd3NycjZHK0ZZbDV0RHRTejdCL0V2UDQ3aVcxNDJudlJCdCto?=
 =?utf-8?B?Ny9maUdKRDBiSUN1MjZDME9LT2VCRFcvUFVXdkIwSS9mbzNvcXJNTUpOejNj?=
 =?utf-8?B?R1JDSzJ5cUZBbkRDSnVHbEJyR1k4dFFSd0p0KzYxdjJmUXhPSVVuSS9BaGJ5?=
 =?utf-8?B?MURLclJhZGJtVzltNmFwRS83a3NscjFSTVlYNGNlY2dWaXY3VUx1OUdwTFcw?=
 =?utf-8?B?eXlIS2NReERXOS9wMGlFUDV6ZzNhNVloeFpxRnUzYUx2cVptbUkyUVp3VSt0?=
 =?utf-8?B?VXFFRUt2L1o4cWN1a0Yya3VyWFlYL1JXaEZrS3pDNWwxZzFlbDMxNGZKNVpO?=
 =?utf-8?B?ZzhRL2w0U3RmM0hxRDZEUzRpS245aGt5WGs5NHhRL3E3MXp5cFRud0lGRnEr?=
 =?utf-8?B?Mm5RdThEZ0ZmblR2elZScmJjTzE5QVdNQ2tCSmV5T3cxMTlhK0JtcTFjNDZ0?=
 =?utf-8?B?VlJndmU3TE1wdEpNWDNQb3pWWUFUQXdHSFhUQlgwM3ZlWnlTanB3OEJxZldm?=
 =?utf-8?B?MjIxV1ZJekFCcmxJRUVKajZ1Y1VQVWdOZVlDdmpFTW1EZW5iZnRRYWdwR1hP?=
 =?utf-8?B?MWNKVVphVDVLc2k0eE9WNVFadFNZTURZcXNTdnpyOExZVlBzS1RFYWdNRzBW?=
 =?utf-8?B?NGs2MDlGdHdCaG9SeWJKOTZnaC9Rcm40eTMrZjQ1VFoxVmU0SVlWWHlRN0cz?=
 =?utf-8?B?YUFwS0dIYUJhd3NWUnJKbHFhR055S254VlpKcXN3Qm9xYlNzQWVVOWF1Rml0?=
 =?utf-8?B?UU5SN2NiRmJxTGdaUkJYZVJqZHVSdVMzeldEeHVreTczY0R6cEhWSVlrRXlO?=
 =?utf-8?B?UW9kUUdEdEtXUEVMUXpNOEE2R3piQ1RMOUFoVFUwaFd6VkVRdlMzNkt1SWJv?=
 =?utf-8?B?RWlGdllyYjRxdDFsb1RBeU9iQ2hHNnB6SXRBTFBNdks3c29oQWVPME9od3Q4?=
 =?utf-8?B?N0RuWVFucFUraWUzT2hUcmlRTXlYRWYxdmFaanRmQlhSK3B1d2VEN0dhYmtL?=
 =?utf-8?B?SmY3SUxtUTN5R3lNMTJVcDk3QnlLcThlenk4cGJmZkN1WnVmV1BLYjJXVXNs?=
 =?utf-8?B?VUh4eW1iYi9QbWpYK0lKM291WnVuaytVR2RiUnlxWnhiWi9IcGI3QlMvK2Ry?=
 =?utf-8?B?SmFsQ2hNL1JsNm1ZeVp3RHY1MWc5OVhES242bElYM09jSSs1aGJseEZnbGNQ?=
 =?utf-8?B?eUgxaGprY1pKcWhsL3R0eFE2RDY0WVIyZHRBbEJOVG9HRlVab0M4QTJqM3ZV?=
 =?utf-8?B?cjRYeGtFUUFOaW1JU2ordzRBTDc2RjNwWjdhM2JHZDBtQnFBVlh1VktwWUll?=
 =?utf-8?B?bzRxOTFZUkhDeFdUSmJNR2pyN0MvTlBmRi8yTzJibndVS3RpRENrMStiWFk3?=
 =?utf-8?B?OEFNQzVLSjUrVVZpamlZUjVTSnRmblR6Rm1oRTZXL1FHYXRhZFZCWXhET2dW?=
 =?utf-8?B?ZER0cEJnZEU2TUNiMFdFREJDWkNzVUZnZDFmYjdqMTFMSkN1dEJJeWZ3Y01p?=
 =?utf-8?B?Q2h5eEo0cFRrNnlIRTVSTk4ycFZ1aHpyVnFZWmNWa2pTRVhyZnNRTVgwYUhX?=
 =?utf-8?B?dzhFVkVFTlpLTGRuVWgvanpuNjROa3lrZGNjS0FVVDArRzhXWHBVZ1g3UHNa?=
 =?utf-8?B?SVlLTng5S2xHMzZRUlRsYnYwSzZ0b081bWZKT3hMTGVpcVREdDkrU0NQMzBF?=
 =?utf-8?B?MXFuZmYwa0Fmc1pITTA0NEh0end2SjE1bG9VWGcrS2htNmg5SHBKWGtpVUpi?=
 =?utf-8?B?WU80Mm01UVJNUHoxejROSU1rNS9hdURvSUxPRXRTN1dFTlU2QS9CK0x6N0R3?=
 =?utf-8?Q?mFQWCSb9XHasU9hSYZ9fZAU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b791d97b-b104-44bb-dffb-08d9d99eb890
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:49:57.6072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQRy/r/4bSoqHZZnECeOQfScu8WabuUz9WdIVvzGEvK20qMUpF/pe6Rcv77IUrchonB8oZdcXUYafdwrM4HCqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

Move the logic from xc_cpu_policy_apply_cpuid into libxl, now that the
xc_cpu_policy_* helpers allow modifying a cpu policy. By moving such
parsing into libxl directly we can get rid of xc_xend_cpuid, as libxl
will now implement it's own private type for storing CPUID
information, which currently matches xc_xend_cpuid.

Note the function logic is moved as-is, but requires adapting to the
libxl coding style.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v2:
 - Use LOG*D.
 - Pass a gc to apply_policy.
 - Use 'r' for libxc return values.
---
 tools/include/libxl.h             |   6 +-
 tools/include/xenctrl.h           |  26 ------
 tools/include/xenguest.h          |   4 -
 tools/libs/guest/xg_cpuid_x86.c   | 125 --------------------------
 tools/libs/light/libxl_cpuid.c    | 142 ++++++++++++++++++++++++++++--
 tools/libs/light/libxl_internal.h |  26 ++++++
 6 files changed, 165 insertions(+), 164 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2bbbd21f0b..8a8032ba25 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1420,10 +1420,10 @@ void libxl_bitmap_init(libxl_bitmap *map);
 void libxl_bitmap_dispose(libxl_bitmap *map);
 
 /*
- * libxl_cpuid_policy is opaque in the libxl ABI.  Users of both libxl and
- * libxc may not make assumptions about xc_xend_cpuid.
+ * libxl_cpuid_policy is opaque in the libxl ABI. Users of libxl may not make
+ * assumptions about libxl__cpuid_policy.
  */
-typedef struct xc_xend_cpuid libxl_cpuid_policy;
+typedef struct libxl__cpuid_policy libxl_cpuid_policy;
 typedef libxl_cpuid_policy * libxl_cpuid_policy_list;
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *cpuid_list);
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *l);
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 745d67c970..79169f8ace 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1803,32 +1803,6 @@ int xc_domain_debug_control(xc_interface *xch,
 
 #if defined(__i386__) || defined(__x86_64__)
 
-/*
- * CPUID policy data, expressed in the legacy XEND format.
- *
- * Policy is an array of strings, 32 chars long:
- *   policy[0] = eax
- *   policy[1] = ebx
- *   policy[2] = ecx
- *   policy[3] = edx
- *
- * The format of the string is the following:
- *   '1' -> force to 1
- *   '0' -> force to 0
- *   'x' -> we don't care (use default)
- *   'k' -> pass through host value
- *   's' -> legacy alias for 'k'
- */
-struct xc_xend_cpuid {
-    union {
-        struct {
-            uint32_t leaf, subleaf;
-        };
-        uint32_t input[2];
-    };
-    char *policy[4];
-};
-
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 8f05d8aa66..3462d27516 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -825,10 +825,6 @@ int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
                                   bool hvm);
 
-/* Apply an xc_xend_cpuid object to the policy. */
-int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
-                              const struct xc_xend_cpuid *cpuid, bool hvm);
-
 /* Apply a featureset to the policy. */
 int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
                                    const uint32_t *featureset,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 974549c0db..8bc7bd7224 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -254,131 +254,6 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
-int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
-                              const struct xc_xend_cpuid *cpuid, bool hvm)
-{
-    int rc;
-    xc_cpu_policy_t *host = NULL, *def = NULL;
-
-    host = xc_cpu_policy_init();
-    def = xc_cpu_policy_init();
-    if ( !host || !def )
-    {
-        PERROR("Failed to init policies");
-        rc = -ENOMEM;
-        goto out;
-    }
-
-    /* Get the domain type's default policy. */
-    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                           : XEN_SYSCTL_cpu_policy_pv_default,
-                                  def);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
-        goto out;
-    }
-
-    /* Get the host policy. */
-    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
-    if ( rc )
-    {
-        PERROR("Failed to obtain host policy");
-        goto out;
-    }
-
-    rc = -EINVAL;
-    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
-    {
-        xen_cpuid_leaf_t cur_leaf;
-        xen_cpuid_leaf_t def_leaf;
-        xen_cpuid_leaf_t host_leaf;
-
-        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
-                                     &cur_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get current policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-        rc = xc_cpu_policy_get_cpuid(xch, def, cpuid->leaf, cpuid->subleaf,
-                                     &def_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get def policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-        rc = xc_cpu_policy_get_cpuid(xch, host, cpuid->leaf, cpuid->subleaf,
-                                     &host_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get host policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-
-        for ( unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++ )
-        {
-            uint32_t *cur_reg = &cur_leaf.a + i;
-            const uint32_t *def_reg = &def_leaf.a + i;
-            const uint32_t *host_reg = &host_leaf.a + i;
-
-            if ( cpuid->policy[i] == NULL )
-                continue;
-
-            for ( unsigned int j = 0; j < 32; j++ )
-            {
-                bool val;
-
-                switch ( cpuid->policy[i][j] )
-                {
-                case '1':
-                    val = true;
-                    break;
-
-                case '0':
-                    val = false;
-                    break;
-
-                case 'x':
-                    val = test_bit(31 - j, def_reg);
-                    break;
-
-                case 'k':
-                case 's':
-                    val = test_bit(31 - j, host_reg);
-                    break;
-
-                default:
-                    ERROR("Bad character '%c' in policy[%d] string '%s'",
-                          cpuid->policy[i][j], i, cpuid->policy[i]);
-                    goto out;
-                }
-
-                clear_bit(31 - j, cur_reg);
-                if ( val )
-                    set_bit(31 - j, cur_reg);
-            }
-        }
-
-        rc = xc_cpu_policy_update_cpuid(xch, policy, &cur_leaf, 1);
-        if ( rc )
-        {
-            PERROR("Failed to set policy leaf %#x subleaf %#x",
-                   cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-    }
-
- out:
-    xc_cpu_policy_destroy(def);
-    xc_cpu_policy_destroy(host);
-
-    return rc;
-}
-
 xc_cpu_policy_t *xc_cpu_policy_init(void)
 {
     return calloc(1, sizeof(struct xc_cpu_policy));
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 7dcdb35a4c..556e8f41a7 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -309,7 +309,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
     char *sep, *val, *endptr;
     int i;
     const struct cpuid_flags *flag;
-    struct xc_xend_cpuid *entry;
+    struct libxl__cpuid_policy *entry;
     unsigned long num;
     char flags[33], *resstr;
 
@@ -387,7 +387,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     char *endptr;
     unsigned long value;
     uint32_t leaf, subleaf = XEN_CPUID_INPUT_UNUSED;
-    struct xc_xend_cpuid *entry;
+    struct libxl__cpuid_policy *entry;
 
     /* parse the leaf number */
     value = strtoul(str, &endptr, 0);
@@ -437,6 +437,137 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
+static int apply_cpuid(libxl__gc *gc, xc_cpu_policy_t *policy,
+                       libxl_cpuid_policy_list cpuid, bool hvm, domid_t domid)
+{
+    int r, rc = 0;
+    xc_cpu_policy_t *host = NULL, *def = NULL;
+
+    host = xc_cpu_policy_init();
+    def = xc_cpu_policy_init();
+    if (!host || !def) {
+        LOGD(ERROR, domid, "Failed to init policies");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Get the domain type's default policy. */
+    r = xc_cpu_policy_get_system(CTX->xch,
+                                 hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                     : XEN_SYSCTL_cpu_policy_pv_default,
+                                 def);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to obtain %s def policy",
+              hvm ? "hvm" : "pv");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Get the host policy. */
+    r = xc_cpu_policy_get_system(CTX->xch, XEN_SYSCTL_cpu_policy_host, host);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to obtain host policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    for (; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid) {
+        xen_cpuid_leaf_t cur_leaf;
+        xen_cpuid_leaf_t def_leaf;
+        xen_cpuid_leaf_t host_leaf;
+
+        r = xc_cpu_policy_get_cpuid(CTX->xch, policy, cpuid->leaf,
+                                    cpuid->subleaf, &cur_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get current policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            r = ERROR_FAIL;
+            goto out;
+        }
+        r = xc_cpu_policy_get_cpuid(CTX->xch, def, cpuid->leaf, cpuid->subleaf,
+                                    &def_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get def policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+        r = xc_cpu_policy_get_cpuid(CTX->xch, host, cpuid->leaf,
+                                    cpuid->subleaf, &host_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get host policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        for (unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++) {
+            uint32_t *cur_reg = &cur_leaf.a + i;
+            const uint32_t *def_reg = &def_leaf.a + i;
+            const uint32_t *host_reg = &host_leaf.a + i;
+
+            if (cpuid->policy[i] == NULL)
+                continue;
+
+#define test_bit(i, r) !!(*(r) & (1u << (i)))
+#define set_bit(i, r) (*(r) |= (1u << (i)))
+#define clear_bit(i, r)  (*(r) &= ~(1u << (i)))
+            for (unsigned int j = 0; j < 32; j++) {
+                bool val;
+
+                switch (cpuid->policy[i][j]) {
+                case '1':
+                    val = true;
+                    break;
+
+                case '0':
+                    val = false;
+                    break;
+
+                case 'x':
+                    val = test_bit(31 - j, def_reg);
+                    break;
+
+                case 'k':
+                case 's':
+                    val = test_bit(31 - j, host_reg);
+                    break;
+
+                default:
+                    LOGD(ERROR, domid,
+                         "Bad character '%c' in policy[%d] string '%s'",
+                         cpuid->policy[i][j], i, cpuid->policy[i]);
+                    rc = ERROR_FAIL;
+                    goto out;
+                }
+
+                clear_bit(31 - j, cur_reg);
+                if (val)
+                    set_bit(31 - j, cur_reg);
+            }
+#undef clear_bit
+#undef set_bit
+#undef test_bit
+        }
+
+        r = xc_cpu_policy_update_cpuid(CTX->xch, policy, &cur_leaf, 1);
+        if (r) {
+            LOGED(ERROR, domid, "Failed to set policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+ out:
+    xc_cpu_policy_destroy(def);
+    xc_cpu_policy_destroy(host);
+    return rc;
+}
+
 int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                         libxl_domain_build_info *info)
 {
@@ -552,10 +683,9 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
     }
 
     /* Apply the bits from info->cpuid if any. */
-    r = xc_cpu_policy_apply_cpuid(ctx->xch, policy, info->cpuid, hvm);
-    if (r) {
-        LOGEVD(ERROR, domid, -r, "Failed to apply CPUID changes");
-        rc = ERROR_FAIL;
+    rc = apply_cpuid(gc, policy, info->cpuid, hvm, domid);
+    if (rc) {
+        LOGD(ERROR, domid, "Failed to apply CPUID changes");
         goto out;
     }
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 37d5c27756..c99b271f9c 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2059,6 +2059,32 @@ typedef yajl_gen_status (*libxl__gen_json_callback)(yajl_gen hand, void *);
 _hidden char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
                                     libxl__gen_json_callback gen, void *p);
 
+/*
+ * CPUID policy data, expressed in the internal libxl format.
+ *
+ * Policy is an array of strings, 32 chars long:
+ *   policy[0] = eax
+ *   policy[1] = ebx
+ *   policy[2] = ecx
+ *   policy[3] = edx
+ *
+ * The format of the string is the following:
+ *   '1' -> force to 1
+ *   '0' -> force to 0
+ *   'x' -> we don't care (use default)
+ *   'k' -> pass through host value
+ *   's' -> legacy alias for 'k'
+ */
+struct libxl__cpuid_policy {
+    union {
+        struct {
+            uint32_t leaf, subleaf;
+        };
+        uint32_t input[2];
+    };
+    char *policy[4];
+};
+
 _hidden int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
                                 libxl_domain_build_info *info);
 
-- 
2.34.1


