Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C9D52A69E
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:32:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331095.554584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzAy-0006Pu-8Z; Tue, 17 May 2022 15:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331095.554584; Tue, 17 May 2022 15:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzAy-0006Me-49; Tue, 17 May 2022 15:31:56 +0000
Received: by outflank-mailman (input) for mailman id 331095;
 Tue, 17 May 2022 15:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCXU=VZ=citrix.com=prvs=1296e7181=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqzAw-0005fb-EW
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:31:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78f11c72-d5f6-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 17:31:52 +0200 (CEST)
Received: from mail-dm3nam07lp2040.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2022 11:31:49 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 15:31:47 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 15:31:47 +0000
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
X-Inumbo-ID: 78f11c72-d5f6-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652801512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=00JQhhZ8kYD+yNYOJkhm3v0AevYhxWIvLZIvUqoZXkk=;
  b=VxvVtsWdDbudukOq07nh/9IVYOFeXCq9IW/aBnKl4TkeStZoUh9b+GhV
   hy7NVxAcVvEQFv6bKkKga18YKwyF9pJYOYZQLMSixUFEBCwXWsFLjqk5o
   ZzAAz4EbpFz1dtUWiiw6xzuZl48SuE0yqh5bEPmh75Cj0YdIQfFC6V34h
   k=;
X-IronPort-RemoteIP: 104.47.56.40
X-IronPort-MID: 71507225
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yNwSnKMfn9mCM63vrR2GlsFynXyQoLVcMsEvi/4bfWQNrUol0mZWz
 DROC2jQOaneYzOhfI9yPYy28EJUvsPdx9FiSgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk29Ew27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 c18uZaQaS0VMbDnyMA3eFpFNDtnMvgTkFPHCSDXXc276WTjKyGp79A1SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7H9afG80m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjx2yGgKWcFwL6TjfQs3TnO0x5N67iuDPjwSPeMb+QOoUnN8
 woq+Ey8WHn2Lue32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXObrP+jmwiBUtRQA
 0UO/2wlqq1a3EesS9zgWRyksTiBtxgVVNdKO/037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHr7m9WX+bsLCOoluP1TM9KGYDYWoISFAD6ty7/4Ur1EqTFpBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:twXZsK9c9012LkxurRFuk+FRdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQkdcKO7SdK9qBLnhNZICOwqUYtKMzOW3FdAQLsC0WKm+UyYJ8SczJ8X6U
 4DSdkYNDSYNzET4qjHCUuDYrAdKbK8gcOVbJLlvhJQpHZRGsNdBmlCajqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOqXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6R64aT1eUYpDLS8KoDOCW+sLlUFtwqsHfqWG1VYczNgNnympDs1L9lqq
 iIn/5qBbUI15qYRBDJnfKq4Xir7N9m0Q6f9XaIxXTkusD3XzQ8Fo5Igp9YaALQ7w46sMh7y7
 8j5RPvi3N7N2K0oM3G3am9a/iqrDvFnVMy1eoIy3BPW4oXb7Fc6YQZ4UNOCZ8FWCb38pouHu
 ViBNzVoK8+SyLSU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsJg9V55H7e
 LZNbkArsA5cuYGKaZmQOsRS8q+DWLABRrKLWKJOFziULoKPnrcwqSHkondJNvaC6Dg4KFC5q
 gpCmkoylLaU3ieePGz4A==
X-IronPort-AV: E=Sophos;i="5.91,233,1647316800"; 
   d="scan'208";a="71507225"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhM7r9n6DueQZITqxA6LGl6DF/ywayMDJ930+5NfBmCtq9wnPttY2gE2AtJFRfsXBNWoF5nBYi2eo3J3MMLLMUpqGHItCzELeCKiNcjLM3JDXRFjP9Ylh7MpccDa/0sjqR/gG286r26NyPgugXdYFPyw4w2h5xsgphCebwW0K30RllSKs93fwApYPo/JUoO9WUKQGkTpo6HYw6ovbSXXL4WCdiHDmI5JwzdbOvCrixgHwCONJ8rrhlNh4N9svIyqhLMTnGoKEPzowvcn9bmqvnjmWm0+Pm2Nwt7H/aGdqeuUb00x0KcFuigFe0hKbgmdJbyoireCqI92wgXvdk3CRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soyEvu+ROxQR6hPSOZ3YsH4mdXeUwWBiN8q89AyTdo8=;
 b=jhlSAewZpRC3DFcOBVccQaIz0p+ZwWyPEznxoghnKA8HwMSx/u8wyT1qoxdBFhIko84UqrJI+lBU/dxBWg58V85pUivgRtrzWNeBwKuLsaz5SULipzO5+BFYgkW/4jH5hfjNJr86qKi19S5heSs5Be6jrfji7BUNoa6TB1P1SzJEAQ89MvTPd2fo5R3SWsKdpdXDT7iYekI2v3YEczIosDKrqvfkG08z9aYLyT6iyh5zMqfnxuIit5+K+Nn/2+MJgkKvrUIsuvRL8d5f5hdeNC0zKO7GBWUkwyIZmoYlSbJKFxWyWqeVQbpjkgm3iUCStBu1E+mOqt+MDv0UOON0AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soyEvu+ROxQR6hPSOZ3YsH4mdXeUwWBiN8q89AyTdo8=;
 b=wfyQVX65A/KmR7h1+g1aOTOtGD6JK2vCwXRXaxXQ2OCOkDwNCIrArgCkqA7sElXFWBOe0SHLILHSPjtnNx9E4p3TcDnQQthEfa6MsnUFfTqRsLcliV23KGJC+jFXk5f14TtgOehcnxcVT3Fuc1JDBHcVLnvCJvEzWhscc/hKCJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD
Date: Tue, 17 May 2022 17:31:27 +0200
Message-Id: <20220517153127.40276-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517153127.40276-1-roger.pau@citrix.com>
References: <20220517153127.40276-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0410.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed0661ea-dadb-4440-8266-08da381a5b2f
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB461756BAF7AAA0ADDCA953FA8FCE9@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4R9Jb6It8dM1LQvggvhwKDniMPQJflxVCsqy0mkGDO3HbqV3OEglsVHT+4MeFamaLfyaKHDpwxQNNKzASINe1SquRDOMpeO2TLpotkBwW0kAxuo2M/1vNXBEqMtISzRD1W9hRkrMQzJW0gKMZjhQWQWv5jOKMqsPvSqBflYGIUg1RwN1MbvQx8fWFUijSfg496kBIFP5vARYIKVlsaIPG7A1/qZEjFDnP3B3QxXMoaqd656AnnDDHVLgTs0FK6Lku8fV0ImAE7EAreFtGU6V9ONFW2UR359K1uSqFy8vVMT1ZqHTCy0jr6SDQ4o/zAgW+danJvdd+iA9G2ava7mUXPttPOQEZlIi5ostZyZ7qUvQvqMUlDyEPWDhtZv7F+8quQAHAf1aPWyTdxoiXmNNpRlgDPKyi1zitL0GkUtKYhY7y0IeVtLyW7t4GckcEpWptn4ChVolcPD89g4y1kYCL5dYfQL7x/L9Zl7KkSKrdg7oNLv5FnKXQH6weTraIia0Vq7k7C4mS3zQV44FdKPp3wLhQff67Raz0VP7vG9EO4mRREWgmOkwZeAhsjrjJ/S0VTfzWDJbLYVpgYu23QdqQ7g8KYk3n2VpQ6xbN3mhQGCoX9Bf5ESzN8KXe7oPvanr0laguCR6T8fplCaj1WCviMIetyTPI5InlyTfUchdKqmluEZfZcQg11JnNk5aWWHoiQ9xnZYVoM144XJ60aYSXZ6Zh4oaXFTb7r/nYwZPvw0BajIZqmgbOg6VgqbUgWFaS4q9xls/4uji8MxRs4X+Ow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(2616005)(8676002)(82960400001)(186003)(6916009)(66946007)(66556008)(1076003)(66476007)(2906002)(5660300002)(36756003)(38100700002)(6506007)(6512007)(508600001)(966005)(6486002)(86362001)(316002)(54906003)(83380400001)(6666004)(8936002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVMxQmxMOUpwSTlJZjZaZUFFWXZpR3RsQzJ2bHdrdDZaaXBMT3Iydk1DZGlI?=
 =?utf-8?B?YWtHdW9JNVg0TWpFNFdjZTVSZ3dianBVQTN0dzdCNFl1dFJhN1l6OWwwd3Bk?=
 =?utf-8?B?RzZYN041cjdGS0s2T2cxcG9oNVdlWGZqQ3hCOWpmVVZ2RXBzbnpRWVpaZitD?=
 =?utf-8?B?a1Jod2Vubm9PbC9WUjh0NnhxQkYwVE9KZklqaEJxZkR6cVpEenpEVGNEK1Fu?=
 =?utf-8?B?SlFBMEU3TDUzbE4rN0xKUG96VGFBMnhrS0grV09aVnZ1QlhXcmorS2tkY1Va?=
 =?utf-8?B?YnI1d29BWGxpeXdGTzZGSHgycEtpMjZxVi9lcSt6SjMrMUt0RXFvUW9JT28v?=
 =?utf-8?B?OHEvWmc4TlEyZzkzWHpIK1h5ZkdpclVkbWEvaWR5VXFWMVBEd1NWcm5Ha1hH?=
 =?utf-8?B?dlArRHN3Y0JjWnpnMUVCWWh6QzJXdFlDc0puQ0lOQ0JGNkRVNTN4c2xaV3VS?=
 =?utf-8?B?UGwrZTVITHlkNE14RHdNV09OelREUG5EM2xINjlLR1hGZlRMTjhoZnRqQTJ3?=
 =?utf-8?B?UERCQzFWNWhCZ2F4NWhOUDZxU0ZMeUJGOU4xZjZrMWlvZnlnaXRVOXlxUnlq?=
 =?utf-8?B?WXRxTUsvQ2xrVGVPM1ZsYkdiN3ord0FyejJQcWRRUlo4WnhlQS84cWRFc1RQ?=
 =?utf-8?B?YWtNNUdDWk9xT1FkT0tqd2RkUlJ1VDJUQUNDRzE0WW8vaDNmd0pjVStLbFQz?=
 =?utf-8?B?bmdoY3QrNnlXNDI1VEwrU05qanZ4cVVYUElTWkU2U0tZZHBVeEFCVG1rZklz?=
 =?utf-8?B?MVRsL3o3bldzWlNrQTVVZW9JQm9QY21tb2p0WVU5T3NQWlZzT3ZOZ1FxOXor?=
 =?utf-8?B?M0FleDNoTG5RN0FWZG9ydU56ZG5jWE1ob283V3NodDd2bytTTHlVeDdJUmJD?=
 =?utf-8?B?elAwWm9WdFZHREZKN0QvbmVXRmIzRis4cEYxeDdySWMrb0NFaXBmNFBVZXI3?=
 =?utf-8?B?TkZaT3k0TW1EdFBuNjhQZFkvdTRvUENpdGdtZkN6RlBtaTkyd2gyRlI3cElW?=
 =?utf-8?B?aXNzcFYwM1QzTUhPTnBzSm1qUEJIRE5ldmlxeGxOdFUrMDhEM0N4cjl6S3hy?=
 =?utf-8?B?aHpsMGZocll5eGt0ZDA4MVphZmRndGlzaDVuMUZQaTJaVklSdDdSK1BmeHA2?=
 =?utf-8?B?ZWZleisweDVTMXd0TDJvTURJSmI4VDIrSFh2cXAva21xQXlwd2xsK2phZElr?=
 =?utf-8?B?dk9wTEx5ekxkZTAyQmRLMVd4YjBjWEJiNE0wMzlyMnBJc1VzTTY1dW1odmlx?=
 =?utf-8?B?MFZ3eElXNldaOTR5NEZnWXhTcnAxWEcybGpzNHVST3RiVHRDS2VEb3kvRTdK?=
 =?utf-8?B?M0psdVhtVzNUMEExQXdOZ2dHbTBvRkxWcnZJaENpNkxCVXFhdmJHUG1DS2c3?=
 =?utf-8?B?K0dDejF6WmtaU1NxN2dCeUh2czdDai9uOTBhTSsyOE5NN1VSYTMzazdJSnhZ?=
 =?utf-8?B?RVk3djl3TjJxaWZIVTNrcmlXcnBTaWZEb21zL2VWbkNzcENzRXEvWC92N0hy?=
 =?utf-8?B?czF1dzkvdkZZWXY2Z0xiUEtJR3R5dCtHVjJZcHU5QmN2NEovOVVRSnJHYklS?=
 =?utf-8?B?QWtDMjd5WjZCU0toSDBrVEVKb3JUaFVMQldwZjlyclhpS1Y2a3VVMEcrS3M4?=
 =?utf-8?B?OUlXalV1UXVEZGlFUkg2SmJjYytDVE92dFlydDZiSU0rYjgyOVkraFFnZXht?=
 =?utf-8?B?WHhiTHIyMDB6bktNMEdsRS9vVFM1NVNrQm5kT3BYT0dxd3dXMkNsQW9jQ0Vz?=
 =?utf-8?B?dVFYM1JrcGhHQ3FiWWZjdEN0K3B0dEtkaUNZemV4cUExR3lWcUhmRWNaNUpN?=
 =?utf-8?B?ZlRIck1KbExkb3cvcktadG8wQ1Qwb0oyUnp4NzduWjNhMHVuMDh5cUlWQk1P?=
 =?utf-8?B?RnJBY0hYY2RmVjdrNW1lZXQ1VWJuRDNlOEd4RVNXV3RjNGhMZWZpTlhrbUds?=
 =?utf-8?B?SnJ4NkcrRjhsY3JjaDRrM05JM0hYVkNRbHErd3p0ZllEdkVNOEJyaEh3cnl1?=
 =?utf-8?B?ODBWd2JqMUtPdHhaZW9yRS9uQ3N6M0xlNUJRNldkTmlUY2JWN2hTWFRoZXJ2?=
 =?utf-8?B?eW5PQkQ0QmFTWm8yb0syWGpLenBlTFV1S1FtWnpMTUFXL3JmMTJFRU41c0VN?=
 =?utf-8?B?S2FVSytud3ZqVjJoRnVUM3lDUkVDQ0JwMXVKY3hJMGxCOXVaM2dXalZXbEhM?=
 =?utf-8?B?Q2lza3EvZ0JxSFM1bkorZFl5Qmt1Y1U5NW9TcG0xQXpBZlJQZ0hlMGg0WDY0?=
 =?utf-8?B?NmN1NVNqT2tMM0NERzlUaHJFTlVzTHVqZGk0N05rMlRWWVZXSlFBeXp0bjRn?=
 =?utf-8?B?cUZxM0FPZVM4NlFiNnRKUy9QZjVVNVJGQ284ekIyYlF3ZmNueU5EeTNiZGJN?=
 =?utf-8?Q?HO2x6yFqQNxxINt4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0661ea-dadb-4440-8266-08da381a5b2f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 15:31:47.8679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4T/DzqXGLGOjtrQ066aC2jw0oIHfRqgWFygLrOxHck265sEQvwgLEHId5rWcWe7lMrJUJG0jThxuZkwmy/v9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617

Expose VIRT_SSBD to guests if the hardware supports setting SSBD in
the LS_CFG MSR (a.k.a. non-architectural way). Different AMD CPU
families use different bits in LS_CFG, so exposing VIRT_SPEC_CTRL.SSBD
allows for an unified way of exposing SSBD support to guests on AMD
hardware that's compatible migration wise, regardless of what
underlying mechanism is used to set SSBD.

Note that on AMD Family 17h and Hygon Family 18h processors the value
of SSBD in LS_CFG is shared between threads on the same core, so
there's extra logic in order to synchronize the value and have SSBD
set as long as one of the threads in the core requires it to be set.
Such logic also requires extra storage for each thread state, which is
allocated at initialization time.

Do the context switching of the SSBD selection in LS_CFG between
hypervisor and guest in the same handler that's already used to switch
the value of VIRT_SPEC_CTRL.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v5:
 - Fix one codding style issue.

Changes since v4:
 - Slightly change usage of val/opt_ssbd in
   vm{exit,entry}_virt_spec_ctrl.
 - Pull opt_ssbd outside of the for loop in amd_setup_legacy_ssbd().
 - Fix indentation.
 - Remove ASSERTs/BUG_ONs from GIF=0 context.

Changes since v3:
 - Align ssbd per-core struct to a cache line.
 - Open code a simple spinlock to avoid playing tricks with the lock
   detector.
 - s/ssbd_core/ssbd_ls_cfg/.
 - Fix log message wording.
 - Fix define name and remove comment.
 - Also handle Hygon processors (Fam18h).
 - Add changelog entry.

Changes since v2:
 - Fix codding style issues.
 - Use AMD_ZEN1_MAX_SOCKETS to define the max number of possible
   sockets in Zen1 systems.

Changes since v1:
 - Report legacy SSBD support using a global variable.
 - Use ro_after_init for ssbd_max_cores.
 - Handle boot_cpu_data.x86_num_siblings < 1.
 - Add comment regarding _irqsave usage in amd_set_legacy_ssbd.
---
 CHANGELOG.md                   |   3 +
 xen/arch/x86/cpu/amd.c         | 121 ++++++++++++++++++++++++++++-----
 xen/arch/x86/hvm/svm/svm.c     |   4 ++
 xen/arch/x86/include/asm/amd.h |   4 ++
 xen/arch/x86/spec_ctrl.c       |   4 +-
 5 files changed, 118 insertions(+), 18 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 6a7755d7b0..9a007e2513 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -13,6 +13,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Removed / support downgraded
  - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap" command line options
 
+### Added
+ - Support VIRT_SSBD feature for HVM guests on AMD.
+
 ## [4.16.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - 2021-12-02
 
 ### Removed
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 4999f8be2b..5f9e734e84 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -48,6 +48,7 @@ boolean_param("allow_unsafe", opt_allow_unsafe);
 
 /* Signal whether the ACPI C1E quirk is required. */
 bool __read_mostly amd_acpi_c1e_quirk;
+bool __ro_after_init amd_legacy_ssbd;
 
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
@@ -685,23 +686,10 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
  * Refer to the AMD Speculative Store Bypass whitepaper:
  * https://developer.amd.com/wp-content/resources/124441_AMD64_SpeculativeStoreBypassDisable_Whitepaper_final.pdf
  */
-void amd_init_ssbd(const struct cpuinfo_x86 *c)
+static bool set_legacy_ssbd(const struct cpuinfo_x86 *c, bool enable)
 {
 	int bit = -1;
 
-	if (cpu_has_ssb_no)
-		return;
-
-	if (cpu_has_amd_ssbd) {
-		/* Handled by common MSR_SPEC_CTRL logic */
-		return;
-	}
-
-	if (cpu_has_virt_ssbd) {
-		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
-		return;
-	}
-
 	switch (c->x86) {
 	case 0x15: bit = 54; break;
 	case 0x16: bit = 33; break;
@@ -715,20 +703,119 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 		if (rdmsr_safe(MSR_AMD64_LS_CFG, val) ||
 		    ({
 			    val &= ~mask;
-			    if (opt_ssbd)
+			    if (enable)
 				    val |= mask;
 			    false;
 		    }) ||
 		    wrmsr_safe(MSR_AMD64_LS_CFG, val) ||
 		    ({
 			    rdmsrl(MSR_AMD64_LS_CFG, val);
-			    (val & mask) != (opt_ssbd * mask);
+			    (val & mask) != (enable * mask);
 		    }))
 			bit = -1;
 	}
 
-	if (bit < 0)
+	return bit >= 0;
+}
+
+void amd_init_ssbd(const struct cpuinfo_x86 *c)
+{
+	if (cpu_has_ssb_no)
+		return;
+
+	if (cpu_has_amd_ssbd) {
+		/* Handled by common MSR_SPEC_CTRL logic */
+		return;
+	}
+
+	if (cpu_has_virt_ssbd) {
+		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
+		return;
+	}
+
+	if (!set_legacy_ssbd(c, opt_ssbd)) {
 		printk_once(XENLOG_ERR "No SSBD controls available\n");
+		if (amd_legacy_ssbd)
+			panic("CPU feature mismatch: no legacy SSBD\n");
+	} else if (c == &boot_cpu_data)
+		amd_legacy_ssbd = true;
+}
+
+static struct ssbd_ls_cfg {
+    bool locked;
+    unsigned int count;
+} __cacheline_aligned *ssbd_ls_cfg;
+static unsigned int __ro_after_init ssbd_max_cores;
+#define AMD_FAM17H_MAX_SOCKETS 2
+
+bool __init amd_setup_legacy_ssbd(void)
+{
+	unsigned int i;
+
+	if ((boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
+	    boot_cpu_data.x86_num_siblings <= 1)
+		return true;
+
+	/*
+	 * One could be forgiven for thinking that c->x86_max_cores is the
+	 * correct value to use here.
+	 *
+	 * However, that value is derived from the current configuration, and
+	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
+	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
+	 */
+	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
+		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
+		ssbd_max_cores /= boot_cpu_data.x86_num_siblings;
+	}
+	if (!ssbd_max_cores)
+		return false;
+
+	ssbd_ls_cfg = xzalloc_array(struct ssbd_ls_cfg,
+	                            ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS);
+	if (!ssbd_ls_cfg)
+		return false;
+
+	if (opt_ssbd)
+		for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
+			/* Set initial state, applies to any (hotplug) CPU. */
+			ssbd_ls_cfg[i].count = boot_cpu_data.x86_num_siblings;
+
+	return true;
+}
+
+/*
+ * Executed from GIF==0 context: avoid using BUG/ASSERT or other functionality
+ * that relies on exceptions as those are not expected to run in GIF==0
+ * context.
+ */
+void amd_set_legacy_ssbd(bool enable)
+{
+	const struct cpuinfo_x86 *c = &current_cpu_data;
+	struct ssbd_ls_cfg *status;
+
+	if ((c->x86 != 0x17 && c->x86 != 0x18) || c->x86_num_siblings <= 1) {
+		set_legacy_ssbd(c, enable);
+		return;
+	}
+
+	status = &ssbd_ls_cfg[c->phys_proc_id * ssbd_max_cores +
+	                      c->cpu_core_id];
+
+	/*
+	 * Open code a very simple spinlock: this function is used with GIF==0
+	 * and different IF values, so would trigger the checklock detector.
+	 * Instead of trying to workaround the detector, use a very simple lock
+	 * implementation: it's better to reduce the amount of code executed
+	 * with GIF==0.
+	 */
+	while (test_and_set_bool(status->locked))
+		cpu_relax();
+	status->count += enable ? 1 : -1;
+	if (enable ? status->count == 1 : !status->count)
+		set_legacy_ssbd(c, enable);
+	barrier();
+	write_atomic(&status->locked, false);
 }
 
 void __init detect_zen2_null_seg_behaviour(void)
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index c4bdeaff52..3cc5fcdc44 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -3126,6 +3126,8 @@ void vmexit_virt_spec_ctrl(void)
 
     if ( cpu_has_virt_ssbd )
         wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+    else
+        amd_set_legacy_ssbd(val);
 }
 
 /* Called with GIF=0. */
@@ -3138,6 +3140,8 @@ void vmentry_virt_spec_ctrl(void)
 
     if ( cpu_has_virt_ssbd )
         wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+    else
+        amd_set_legacy_ssbd(val);
 }
 
 /*
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index a82382e6bf..6a42f68542 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -151,4 +151,8 @@ void check_enable_amd_mmconf_dmi(void);
 extern bool amd_acpi_c1e_quirk;
 void amd_check_disable_c1e(unsigned int port, u8 value);
 
+extern bool amd_legacy_ssbd;
+bool amd_setup_legacy_ssbd(void);
+void amd_set_legacy_ssbd(bool enable);
+
 #endif /* __AMD_H__ */
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 0d5ec877d1..495e6f9405 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -22,6 +22,7 @@
 #include <xen/param.h>
 #include <xen/warning.h>
 
+#include <asm/amd.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/microcode.h>
 #include <asm/msr.h>
@@ -1073,7 +1074,8 @@ void __init init_speculation_mitigations(void)
     }
 
     /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
-    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd && cpu_has_virt_ssbd )
+    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd &&
+         (cpu_has_virt_ssbd || (amd_legacy_ssbd && amd_setup_legacy_ssbd())) )
         setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
 
     /* If we have IBRS available, see whether we should use it. */
-- 
2.36.0


