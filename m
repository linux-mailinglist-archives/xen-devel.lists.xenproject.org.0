Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CFB6C17DE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 16:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511970.791449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peHFi-0004jh-Rz; Mon, 20 Mar 2023 15:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511970.791449; Mon, 20 Mar 2023 15:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peHFi-0004he-P7; Mon, 20 Mar 2023 15:16:50 +0000
Received: by outflank-mailman (input) for mailman id 511970;
 Mon, 20 Mar 2023 15:16:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxNw=7M=citrix.com=prvs=436835ee5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1peHFh-0004hY-Gz
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 15:16:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 376b6a47-c732-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 16:16:44 +0100 (CET)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Mar 2023 11:16:28 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6451.namprd03.prod.outlook.com (2603:10b6:806:1c2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 15:16:26 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 15:16:26 +0000
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
X-Inumbo-ID: 376b6a47-c732-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679325403;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=eV4EfQXY4uKQgBNEx45Sl7N5TxfsxuuenMedl/NPqUA=;
  b=ILF2ATZVlAfQqC/3ctHwtiBq8OW/06NtSxbCI+2g9y1rBwIuowOa3j8q
   VZslDQC/H3LWT+CezylCrw/HoGNyXHzRfzW0I+/wE8/AA1oCph5HZS4N1
   K52lJFAzNAiNg0hMtjhj+flP/m8OiXxCIomMNmyZNYzKkjwaS9F9GzTRd
   g=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 100360486
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:danonauosHiPFVLUHEdLFRqjo+fnVD9eMUV32f8akzHdYApBsoF/q
 tZmKWDTOKrfN2GmeI9+Pd7gpE4E6J/czdRnGQduryg3QXkU+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASHxiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwERYAS0y5rPCP5uzlY7lcq9UvcuDrFdZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4G9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiANpJSuXkpqACbFu7wW0OAjQHUxyHmdqUoUevWfJ/c
 GoN0397xUQ13AnxJjXnZDWju2KNtBMYX9tWEsU55RuLx66S5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvBHzV+9r2IQHSS3r6RoXW5Pi19BX8PY2oIQBUI5/HnoZovlVTfQ9B7Cqm3g9bpXzbqz
 FiipSwzl7wVgcMRkam24FvHjiiEr53FCAUy423/VWK/7xhlZYejIY+v5F7a4t5JKYrfRV6E1
 FA/h8WB5foSS7GMkCCASv8EGr2B7vOJdjbbhDZHFYQ75T2p/HKkYol47zR3JUMvOcEBERfpZ
 0ncvQ5QvdlTIXKsYod+Zo73AMMvpYDiCNDkX7bGbtNIbbB4cQPB9yZrDWay3nnsmU5quqEyP
 7+SdMrqBnEfYZmL1xKzTuYZlLQsnyY3wDqKQYihlkv8l72DeHSSVLEJdkOUafw057+FpwOT9
 MtDM8yNyFNUV+iWjjTrzLP/5GsidRATba0aYeQOHgJfCmKKwF0cNsI=
IronPort-HdrOrdr: A9a23:otjlWqperQITxtTZUSlgHicaV5u1L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXcH2/hqAV7CZnivhILMFu1fBOTZslrd8kHFl9K1kJ
 0QC5SWa+eARmSS7/yKhjVQeuxIqLbozEnrv5am854Hd3AJV0gU1XYcNu/tKDwSeOApP/oEPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+wA+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRhuerRfb8xfT9GA+cyzpAV74RG4FqiQpF7t1Hpmxa0+
 Uk6C1QQvibo0mhAl1d5yGdkTUImQxelEPK2BuWh2Durtf+Qy9/A81dhZhBeh+c8EY4uspguZ
 g7qF5xmqAneC8oph6Nk+TgRlVvjA65sHAimekcgzhWVpYfcqZYqcga8FlOGJkNESrm4MR/ed
 MeRf309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw8TxdAZnH0H6JUhIqM0kd
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbWPGebMT3cZdM60rL22u3KCZkOlZGXkcYzveUPcb
 z6ISJliVI=
X-IronPort-AV: E=Sophos;i="5.98,274,1673931600"; 
   d="scan'208";a="100360486"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9KkLJBoX6SPI4Orrq98w8J2DCpTA+8pQnHtac4P0Ay/f8z2RFCBsSLDMZTCw4pIT+TZ7fxc8OI3IGtego7Y0WQsy6Z4IIMjfKRhNXuiroIEeALKstHY1I70iwoFJiK424csH2191LwV+hBOBaU5I7V2rKtoEgcPhyVXSaaOGzbQ/vleE+eVN+jANZyGg58+oMM/IK/+aPvKkspMzepTTN8Ryc6YGVHKtv2eKkK8/kG+pYxaV2BC8JKaeXBjBFNOrWox314vx1LqUl1hMYwnoCE7gS3ieXQ0foTC3HLn3BmsSHbzNJDHnvv+pgqV+iZ6BCHNkTLhtYpef2RXck86BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOJPe8jia1WWPd+dfZ69rAAEZpsV7YEfpvQVOUWNEKo=;
 b=hqz8+Vxn3VbcGOE/S3V5XWVx6srFtHHSjXQV8P5R5+1/G9JZSck67GoOk5JosA9gYBo3e5LrK4tfPtFe7+PhHJw/CPL1O1KyOokJTpcB7xkpTmI/XsPdyNap60RDz+UbXJZJ6i2PsVKjIJO4k/s6QV8gpop8BXQEWdq8ATMpHpCsuai9bEKQXg6pfjDeAts9akP0PhRp8+M/zfHWOzdCekVvwy4qtc/Gw9l8/kzpzNrZuoyuayyRvvZD72Lwb7nz/4QaWVO2H/SjsqJ91yrexHXzfrqwQFoXOBezkukVuRviClaxxS7n7rloj9FOQ5IspVzfYT/s02x6Z68ZbFDuIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOJPe8jia1WWPd+dfZ69rAAEZpsV7YEfpvQVOUWNEKo=;
 b=h52CuwDDJl3i8KZZ69EawihOnnjFLurknSoQj/wUZSczW2FNI/oUJa6Z8WCDDTijTMuBpnUjp7MvGIIf7nvYEx+E6Ow+rst1mSu9Ss2mSzr0CqfpJkylJQrgznpnTJlWBdYtoYXZeBlrtQCtNjetydLc6EuU0lISZFfBC5PUnJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 20 Mar 2023 16:16:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Huang Rui <ray.huang@amd.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Honglei Huang <honglei1.huang@amd.com>,
	Julia Zhang <julia.zhang@amd.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to gsi
Message-ID: <ZBh4w+hDajq06BU6@Air-de-Roger>
References: <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop>
 <e8843d7a-eecc-373c-a6b3-6a893bc0eb2a@suse.com>
 <ZBLg8WB8HCoZvwz5@Air-de-Roger>
 <df607690-0bfb-94a3-fac6-5e20f183dc20@suse.com>
 <alpine.DEB.2.22.394.2303161611220.3359@ubuntu-linux-20-04-desktop>
 <4edb59db-d2b8-122a-fc10-59001857bee0@suse.com>
 <ZBQ4DKJ8ZAroyPIQ@Air-de-Roger>
 <alpine.DEB.2.22.394.2303171115320.3359@ubuntu-linux-20-04-desktop>
 <ZBTEBkaI8q/mrJmv@Air-de-Roger>
 <alpine.DEB.2.22.394.2303171346410.3359@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2303171346410.3359@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: BN0PR04CA0169.namprd04.prod.outlook.com
 (2603:10b6:408:eb::24) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df87878-e276-4ce4-6b38-08db29561275
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aJzssWwLsz0ndj2+SCC6h2AUvM1dPY/k3yRiJf24sIizkayTcw5uI8bBCRFpKPZ1ZqdoKdr93zHNmvt/rdPpcyIovsa3PcNz0wZmTtJrm6EGmPjV1zEuot19MZykvhZKsZ26EUNoPHzS7SK5W+JwjqYHPm8eBOZ7jtV8CQMfm/C1JbGYOccqrYyd89hM7rSzbUXxSO3BXyL4lS7he+ueok/wvxrs86XijIKOeMzs2dzpW13IHDB3jddsCXy0KOZ4/doSI08fuMVLpYGN5qCgROT33QIY7sKui/Ipz46m2jZZM6s/W0Ouco6DcDeRT+MlfOSmOJET7Oo0P3Y0cuOemBNrwtkAgd2yPmVYqJg0oGdQ8JRDi822SBi0n2OnAYU3g50L+gWdyP9VJ3ArbC8/bo5dSHja+0ZVCzDQ0AuhwY+RLU8FWQr+R9ZAZkzXA+UZCzEeQcF+q76C06ymX79flqSbS3SMtHt5e4BCL00w1QJX7OI/SXwt/6jBGiQCxc0nkhElR2XWCOXKNqrH+qQBQrMB2AMNoYkkFNpCUjUBPmHTAuwUZVEZaFsK3jH9m/eDVxnrhXv7Yj8xdrUh9LXE+Ewchd9VpbB1+4M/iTo8J11ZKUKNzrpaVLF+oHOCGczqf0GlQN4FTQnkL8sYFOhCrsaoj+BC2R0uAG84jwIZn7/W+MJZzFKH0eP1GS2hPcmA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199018)(38100700002)(33716001)(30864003)(316002)(54906003)(8676002)(66476007)(85182001)(66556008)(66946007)(4326008)(6916009)(8936002)(7416002)(41300700001)(5660300002)(478600001)(86362001)(2906002)(83380400001)(82960400001)(6666004)(26005)(6512007)(6506007)(186003)(53546011)(9686003)(6486002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3RBdVhHS2h6ZkpSeEt4VTc3ZVpHaWhGN2RwZEROOG9xT00veTRQQmtBMFVN?=
 =?utf-8?B?M1ltckZxdFoxVHh6Rk5mRW0xc0VGUExDRDZ1d3lqd0p6Y28xTjkwR2NsQzRM?=
 =?utf-8?B?Y0hHb0JTdEtZQ1NkNjdqbDVpSEEyT25jK1FXSWYrbXFJcVFJZi9jWmhIall4?=
 =?utf-8?B?MXFDRjFudUVXREM4dnJBMS9xemNRZjZzaXpPbW5pdXArQlA3K0xJaHN1Q3F1?=
 =?utf-8?B?MWJLUzYzTm53V1ZCNTFSRlRtRUpmNW1UM0hFNWFreE5TZnRBM1c4QnBZRzcw?=
 =?utf-8?B?Z25leW8wdGMvN0JaeWFyRTdMajE4UzNsa3QyY3cxMXNKZGV3Q0c2YVNGNUFr?=
 =?utf-8?B?WmxydGdWd0Y2WGNnNHFJUDhrdVF2dllFRnFKQmxUVi9pYjZNbnVtVWc0Uld6?=
 =?utf-8?B?TGYvZ1MwYTNOaVk5THFHWDdoY05jaVZMQ1B3NkdCQ2FNQmVPTUsyRDBVblpF?=
 =?utf-8?B?KzVQWWNhTktzVnJuYXRQWkhkRko4aXdVU3ZXOHIwVmx6TVE3WWp2bmxVVmRS?=
 =?utf-8?B?R1ZBelZDZ0tFVUsrTFMxd0FIbzM0T0g5akZHcDNyS3k2a3A3ZDBsR2RSK1k3?=
 =?utf-8?B?Wm5zZGRDeVN5OGRHL1FGdDk5Y0UveGJEUmVEcUd3ZE5BVE9UeWgxcjVjR0E5?=
 =?utf-8?B?MDVGa2QzRUw3ZGhnUWtJeURnVmpUeGxLRUJ0eE5pUndVRnYvcGxreWtiVnJF?=
 =?utf-8?B?QU0xa0pUSDJtbmFNUWlYV3F6OERINEovV0RtU0tDcWdaWkdndllQeDl6S2Zt?=
 =?utf-8?B?UnVhN2ZXNUh1TEhQUHJld0FIZFE4TnlrZnhhQXlhc2NLcDlLZU42YVZqYWdU?=
 =?utf-8?B?cEtTVkFnTlBSMVhSSURPdmxCa3FoYjQxZk1LOHZaUXhOQzFqZFNSN3ljT1FS?=
 =?utf-8?B?TVN4QmlUWmllSGRTSWM1ZENaTTljQ3BvMnVma21vNE82M3lUMlVBcW9sNFZu?=
 =?utf-8?B?YW1jam83eGJNVld5SUhkQkNMZVBZRzJTL1dESUJOTEltQW5UZmFIQVRCZWpS?=
 =?utf-8?B?ME1XL2Uzc1V4TGlSTEx6azYxNlBHZFpubTJFWm1yWHhRNEpzVXlJQkZPYVF5?=
 =?utf-8?B?Nlc2QmhoZmk4NjBPaEN1MG1EVWY2L3FBS3Zyamc0dGQ2c2FidjhmeHlhL1Rn?=
 =?utf-8?B?UmdhS2MwZFJ3Zm1OYWw3aHhvbHg2Mnk2WVU1bXRtQjA2V2dPeXExVHAvRjkx?=
 =?utf-8?B?QzZBVTY4TkpRYTB5Z1BtOGJKTFA0aEQwa2dZZWN2RTNJbWJsaDRGbUNRU2U4?=
 =?utf-8?B?QVp3eDM3TVExUE9rQitlcFlBcXpjT1EvV0pjTUg5RFZEaExvam9QeGovZ3Jj?=
 =?utf-8?B?cTQ3MnFSQmhNWGdQbU11cUk5akNiRWNkUExIeWpPVG4rNk8rZkJ1UktjaXNw?=
 =?utf-8?B?WlpTeHNOMjVlejY5bVkzTk1FU2doQ3RvYTRvbTZmMUd3NEdvY2RvaW4yY2xE?=
 =?utf-8?B?Sk92YVdJZExiYnlUeC9ZUmliaG5ERTR2YkpxZ09lQVdlRWR2M3JjVUgzR2VH?=
 =?utf-8?B?NkpSbURpU2pEQkU4QVQzb3RQa0Uva0dHWjdtTjZIbDZGZlhCYzkydUtOdUJ6?=
 =?utf-8?B?bXdlRUZ5S3lmWEE4N0toZ3RUZ0M1MFU2UHZHV3Q4UFFFNXBreURzTjg5cE00?=
 =?utf-8?B?Y2RDcHZNR1ZMcVFFaDZheXZ2WG5DNk5PZ0lmd2FPNjhOVWdkbmlhSngyZWNx?=
 =?utf-8?B?dkxLeWszTHRmdnF5c0N1ZnFhYTNHcXJzZ2FwajNMNTlVdXFvaklMT2NjQ08v?=
 =?utf-8?B?NzRjNE1BdUlIUlBQVHkxYWl2Z2JRZmhqbmV6VmhvNkZ1MXgxVElxR1JzMitr?=
 =?utf-8?B?OUVsdVU5ZmlQeTVxTXBic0g2clptR3JqWVQ5a3VQTVJ3NTN6MGIvT1Z4Nk1Y?=
 =?utf-8?B?UWY1QzdUcjduVlA5eHhyL2xlbi9CUDJrRm5reU53cW1HNVp4ZDh0cndja2d6?=
 =?utf-8?B?YVBmS000cmxsbmRSN29JWjFqc1laMGtvb2N0Y1YrNWpQQlRESkYvdDVoMTZO?=
 =?utf-8?B?ckZ4blBTVzFzdFBSVmVscnpBcXdwZHBvTVdJOGxSSTlsRy8xOWV5MWVIclFj?=
 =?utf-8?B?Yy9QcGJKZkdyUmpUZEFIYnRqT3oyWDRXYnhsY1lZd0czRVF2QS9tUmd5dzNF?=
 =?utf-8?B?dTJMWWRPU2x5U0xxeGpwT05uV3ZOVXNEakJlUkF0T0tNbUtxRGNCZEVSZzJX?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pQVIQW0Cyc0/8J75lwmlFx+Lu9FYosZy2Y9aRRE3e64mWXOmtoO/xR5BmDf+6k2IXdXg0Xpwky/GMVmqX1+VQ2VlmcGHCFbOAnXZ6zXTASlfHfkc4h+rbflxgo8VnxglmXUVp56BNT5eFPTAk/mUE0g3KjyZJu4KG3vxzZmOAcZjgQXYg56d+QAhIJLnpOY/NWbNmzsFhMQk/xreKMMQk9ifZZBc5tFxqViHclhskd3TAr73Jx9DLBpsvLuEE5rpiY4LABvI5APwrjhTrP22KfnVEOljv0w//qcU09y+01432KuXA+AUDj9bQNRdF+yy/4D1gW1T3rGVg4bw/u07nBfn/gsiov7Zb693V0SDEs9Z9I9cp5ty4YZfxdyPjrQBNmnKV1y2faTAUc5GWRQAtVpA1nvZvoFvRImjOMvorbraLWLqT2hrXVFXv3bkVWulYBu+4Tg17Y6gaTGC5kDuc9kt/KOYQd6Ntmoo+bbJp8JD6kuwki7FTxDj7MSsvhXW+PjnUJBTU2ngrYomtmiAN2NWFYXeodr8XFYPfgTyasU8LEmrbDTnQX89qnT6E06y2nZTE5O3yz+WmibuOBBy7TgpFNtayiBfYNw/veUsmUfn2/l+k06E6dTIlgWPTvaxpbou23I8YxoupcKBGJfdrfmtju6v9EErPou27hj+zwUC8qYqfZn77OW3Xp31uvYja/fjaOQt9EqAwZS5fnruiT5qc8ddQkwcEgZMtvI1OeXc9l0EFoqs4yT3Q6YfQfKLXCp0N/Kk62T402n6A07mifsWq3Ei9kz/YgBKI2KbgRpUvVLS4eeb3EH2mhWVfsifSCLRer8rO9d0a9tPBYpGd/ryQm4n2KuZqXYCDyD90asY3K935ZwD1yvsd0FPQA6/
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df87878-e276-4ce4-6b38-08db29561275
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 15:16:26.0417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27qOBb3lz7Bt75cZPwF6XUfrQb9gLjAeH5W0slscul0O5Wq+8Y3nMXQN+Y6fexRCib4jD0447khA5DbWmVoaQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6451

On Fri, Mar 17, 2023 at 01:55:08PM -0700, Stefano Stabellini wrote:
> On Fri, 17 Mar 2023, Roger Pau Monné wrote:
> > On Fri, Mar 17, 2023 at 11:15:37AM -0700, Stefano Stabellini wrote:
> > > On Fri, 17 Mar 2023, Roger Pau Monné wrote:
> > > > On Fri, Mar 17, 2023 at 09:39:52AM +0100, Jan Beulich wrote:
> > > > > On 17.03.2023 00:19, Stefano Stabellini wrote:
> > > > > > On Thu, 16 Mar 2023, Jan Beulich wrote:
> > > > > >> So yes, it then all boils down to that Linux-
> > > > > >> internal question.
> > > > > > 
> > > > > > Excellent question but we'll have to wait for Ray as he is the one with
> > > > > > access to the hardware. But I have this data I can share in the
> > > > > > meantime:
> > > > > > 
> > > > > > [    1.260378] IRQ to pin mappings:
> > > > > > [    1.260387] IRQ1 -> 0:1
> > > > > > [    1.260395] IRQ2 -> 0:2
> > > > > > [    1.260403] IRQ3 -> 0:3
> > > > > > [    1.260410] IRQ4 -> 0:4
> > > > > > [    1.260418] IRQ5 -> 0:5
> > > > > > [    1.260425] IRQ6 -> 0:6
> > > > > > [    1.260432] IRQ7 -> 0:7
> > > > > > [    1.260440] IRQ8 -> 0:8
> > > > > > [    1.260447] IRQ9 -> 0:9
> > > > > > [    1.260455] IRQ10 -> 0:10
> > > > > > [    1.260462] IRQ11 -> 0:11
> > > > > > [    1.260470] IRQ12 -> 0:12
> > > > > > [    1.260478] IRQ13 -> 0:13
> > > > > > [    1.260485] IRQ14 -> 0:14
> > > > > > [    1.260493] IRQ15 -> 0:15
> > > > > > [    1.260505] IRQ106 -> 1:8
> > > > > > [    1.260513] IRQ112 -> 1:4
> > > > > > [    1.260521] IRQ116 -> 1:13
> > > > > > [    1.260529] IRQ117 -> 1:14
> > > > > > [    1.260537] IRQ118 -> 1:15
> > > > > > [    1.260544] .................................... done.
> > > > > 
> > > > > And what does Linux think are IRQs 16 ... 105? Have you compared with
> > > > > Linux running baremetal on the same hardware?
> > > > 
> > > > So I have some emails from Ray from he time he was looking into this,
> > > > and on Linux dom0 PVH dmesg there is:
> > > > 
> > > > [    0.065063] IOAPIC[0]: apic_id 33, version 17, address 0xfec00000, GSI 0-23
> > > > [    0.065096] IOAPIC[1]: apic_id 34, version 17, address 0xfec01000, GSI 24-55
> > > > 
> > > > So it seems the vIO-APIC data provided by Xen to dom0 is at least
> > > > consistent.
> > > >  
> > > > > > And I think Ray traced the point in Linux where Linux gives us an IRQ ==
> > > > > > 112 (which is the one causing issues):
> > > > > > 
> > > > > > __acpi_register_gsi->
> > > > > >         acpi_register_gsi_ioapic->
> > > > > >                 mp_map_gsi_to_irq->
> > > > > >                         mp_map_pin_to_irq->
> > > > > >                                 __irq_resolve_mapping()
> > > > > > 
> > > > > >         if (likely(data)) {
> > > > > >                 desc = irq_data_to_desc(data);
> > > > > >                 if (irq)
> > > > > >                         *irq = data->irq;
> > > > > >                 /* this IRQ is 112, IO-APIC-34 domain */
> > > > > >         }
> > > > 
> > > > 
> > > > Could this all be a result of patch 4/5 in the Linux series ("[RFC
> > > > PATCH 4/5] x86/xen: acpi registers gsi for xen pvh"), where a different
> > > > __acpi_register_gsi hook is installed for PVH in order to setup GSIs
> > > > using PHYSDEV ops instead of doing it natively from the IO-APIC?
> > > > 
> > > > FWIW, the introduced function in that patch
> > > > (acpi_register_gsi_xen_pvh()) seems to unconditionally call
> > > > acpi_register_gsi_ioapic() without checking if the GSI is already
> > > > registered, which might lead to multiple IRQs being allocated for the
> > > > same underlying GSI?
> > > 
> > > I understand this point and I think it needs investigating.
> > > 
> > > 
> > > > As I commented there, I think that approach is wrong.  If the GSI has
> > > > not been mapped in Xen (because dom0 hasn't unmasked the respective
> > > > IO-APIC pin) we should add some logic in the toolstack to map it
> > > > before attempting to bind.
> > > 
> > > But this statement confuses me. The toolstack doesn't get involved in
> > > IRQ setup for PCI devices for HVM guests?
> > 
> > It does for GSI interrupts AFAICT, see pci_add_dm_done() and the call
> > to xc_physdev_map_pirq().  I'm not sure whether that's a remnant that
> > cold be removed (maybe for qemu-trad only?) or it's also required by
> > QEMU upstream, I would have to investigate more.
> 
> You are right. I am not certain, but it seems like a mistake in the
> toolstack to me. In theory, pci_add_dm_done should only be needed for PV
> guests, not for HVM guests. I am not sure. But I can see the call to
> xc_physdev_map_pirq you were referring to now.
> 
> 
> > It's my understanding it's in pci_add_dm_done() where Ray was getting
> > the mismatched IRQ vs GSI number.
> 
> I think the mismatch was actually caused by the xc_physdev_map_pirq call
> from QEMU, which makes sense because in any case it should happen before
> the same call done by pci_add_dm_done (pci_add_dm_done is called after
> sending the pci passthrough QMP command to QEMU). So the first to hit
> the IRQ!=GSI problem would be QEMU.

I've been thinking about this a bit, and I think one of the possible
issues with the current handling of GSIs in a PVH dom0 is that GSIs
don't get registered until/unless they are unmasked.  I could see this
as a problem when doing passthrough: it's possible for a GSI (iow:
vIO-APIC pin) to never get unmasked on dom0, because the device
driver(s) are using MSI(-X) interrupts instead.  However, the IO-APIC
pin must be configured for it to be able to be mapped into a domU.

A possible solution is to propagate the vIO-APIC pin configuration
trigger/polarity when dom0 writes the low part of the redirection
table entry.

The patch below enables the usage of PHYSDEVOP_{un,}map_pirq from PVH
domains (I need to assert this is secure even for domUs) and also
propagates the vIO-APIC pin trigger/polarity mode on writes to the
low part of the RTE.  Such propagation leads to the following
interrupt setup in Xen:

IRQ:   0 vec:f0 IO-APIC-edge    status=000 aff:{0}/{0} arch/x86/time.c#timer_interrupt()
IRQ:   1 vec:38 IO-APIC-edge    status=002 aff:{0-7}/{0} mapped, unbound
IRQ:   2 vec:a8 IO-APIC-edge    status=000 aff:{0-7}/{0-7} no_action()
IRQ:   3 vec:f1 IO-APIC-edge    status=000 aff:{0-7}/{0-7} drivers/char/ns16550.c#ns16550_interrupt()
IRQ:   4 vec:40 IO-APIC-edge    status=002 aff:{0-7}/{0} mapped, unbound
IRQ:   5 vec:48 IO-APIC-edge    status=002 aff:{0-7}/{0} mapped, unbound
IRQ:   6 vec:50 IO-APIC-edge    status=002 aff:{0-7}/{0} mapped, unbound
IRQ:   7 vec:58 IO-APIC-edge    status=006 aff:{0-7}/{0} mapped, unbound
IRQ:   8 vec:60 IO-APIC-edge    status=010 aff:{0}/{0} in-flight=0 d0:  8(-M-)
IRQ:   9 vec:68 IO-APIC-edge    status=010 aff:{0}/{0} in-flight=0 d0:  9(-M-)
IRQ:  10 vec:70 IO-APIC-edge    status=002 aff:{0-7}/{0} mapped, unbound
IRQ:  11 vec:78 IO-APIC-edge    status=002 aff:{0-7}/{0} mapped, unbound
IRQ:  12 vec:88 IO-APIC-edge    status=002 aff:{0-7}/{0} mapped, unbound
IRQ:  13 vec:90 IO-APIC-edge    status=002 aff:{0-7}/{0} mapped, unbound
IRQ:  14 vec:98 IO-APIC-edge    status=002 aff:{0-7}/{0} mapped, unbound
IRQ:  15 vec:a0 IO-APIC-edge    status=002 aff:{0-7}/{0} mapped, unbound
IRQ:  16 vec:b0 IO-APIC-edge    status=010 aff:{1}/{0-7} in-flight=0 d0: 16(-M-)
IRQ:  17 vec:b8 IO-APIC-edge    status=002 aff:{0-7}/{0-7} mapped, unbound
IRQ:  18 vec:c0 IO-APIC-edge    status=002 aff:{0-7}/{0-7} mapped, unbound
IRQ:  19 vec:c8 IO-APIC-edge    status=002 aff:{0-7}/{0-7} mapped, unbound
IRQ:  20 vec:d0 IO-APIC-edge    status=010 aff:{1}/{0-7} in-flight=0 d0: 20(-M-)
IRQ:  21 vec:d8 IO-APIC-edge    status=002 aff:{0-7}/{0-7} mapped, unbound
IRQ:  22 vec:e0 IO-APIC-edge    status=002 aff:{0-7}/{0-7} mapped, unbound
IRQ:  23 vec:e8 IO-APIC-edge    status=002 aff:{0-7}/{0-7} mapped, unbound

Note how now all GSIs on my box are setup, even when not bound to
dom0 anymore.  The output without this patch looks like:

IRQ:   0 vec:f0 IO-APIC-edge    status=000 aff:{0}/{0} arch/x86/time.c#timer_interrupt()
IRQ:   1 vec:38 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
IRQ:   3 vec:f1 IO-APIC-edge    status=000 aff:{0-7}/{0-7} drivers/char/ns16550.c#ns16550_interrupt()
IRQ:   4 vec:40 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
IRQ:   5 vec:48 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
IRQ:   6 vec:50 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
IRQ:   7 vec:58 IO-APIC-edge    status=006 aff:{0}/{0} mapped, unbound
IRQ:   8 vec:d0 IO-APIC-edge    status=010 aff:{6}/{0-7} in-flight=0 d0:  8(-M-)
IRQ:   9 vec:a8 IO-APIC-level   status=010 aff:{2}/{0-7} in-flight=0 d0:  9(-M-)
IRQ:  10 vec:70 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
IRQ:  11 vec:78 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
IRQ:  12 vec:88 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
IRQ:  13 vec:90 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
IRQ:  14 vec:98 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
IRQ:  15 vec:a0 IO-APIC-edge    status=002 aff:{0}/{0} mapped, unbound
IRQ:  16 vec:e0 IO-APIC-level   status=010 aff:{6}/{0-7} in-flight=0 d0: 16(-M-),d1: 16(-M-)
IRQ:  20 vec:d8 IO-APIC-level   status=010 aff:{6}/{0-7} in-flight=0 d0: 20(-M-)

Legacy IRQs (below 16) are always registered.

With the patch above I seem to be able to do PCI passthrough to an HVM
domU from a PVH dom0.

Regards, Roger.

---
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 405d0a95af..cc53a3bd12 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -86,6 +86,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
+        break;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 41e3c4d5e4..50e23a093c 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -180,9 +180,7 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, unsigned int trig,
 
     /* Interrupt has been unmasked, bind it now. */
     ret = mp_register_gsi(gsi, trig, pol);
-    if ( ret == -EEXIST )
-        return 0;
-    if ( ret )
+    if ( ret && ret != -EEXIST )
     {
         gprintk(XENLOG_WARNING, "vioapic: error registering GSI %u: %d\n",
                  gsi, ret);
@@ -244,12 +242,18 @@ static void vioapic_write_redirent(
     }
     else
     {
+        int ret;
+
         unmasked = ent.fields.mask;
         /* Remote IRR and Delivery Status are read-only. */
         ent.bits = ((ent.bits >> 32) << 32) | val;
         ent.fields.delivery_status = 0;
         ent.fields.remote_irr = pent->fields.remote_irr;
         unmasked = unmasked && !ent.fields.mask;
+        ret = mp_register_gsi(gsi, ent.fields.trig_mode, ent.fields.polarity);
+        if ( ret && ret !=  -EEXIST )
+            gprintk(XENLOG_WARNING, "vioapic: error registering GSI %u: %d\n",
+                    gsi, ret);
     }
 
     *pent = ent;


