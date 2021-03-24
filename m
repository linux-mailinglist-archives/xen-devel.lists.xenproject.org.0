Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1006347325
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 09:02:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100877.192458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOySd-0004h7-LO; Wed, 24 Mar 2021 08:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100877.192458; Wed, 24 Mar 2021 08:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOySd-0004gi-GF; Wed, 24 Mar 2021 08:01:51 +0000
Received: by outflank-mailman (input) for mailman id 100877;
 Wed, 24 Mar 2021 08:01:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u5GA=IW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOySc-0004gd-3i
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 08:01:50 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cec3b426-e591-473f-9319-773b92ecfa99;
 Wed, 24 Mar 2021 08:01:49 +0000 (UTC)
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
X-Inumbo-ID: cec3b426-e591-473f-9319-773b92ecfa99
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616572907;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=woo7kvB2XdfPv9gyPh77WIM0OARemRU8hCk7ysAHj1s=;
  b=AqD2QzOtuEW+gVn3V8FGlpSJVUrycnVYuieuYlInoHK3O83ep6/K+w0S
   f+Wb9fSZVc0sDZ2NGkxxjhIiZXp73HYyMEPVhoPZDvDVcdIw2uS74li8G
   c4wRnhbnNU3J6DNHHaLlJHc/TV5r3wosuvuT4XUWiJKjXoGyS9O9n8QFO
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KEVSbC3AjYXtqR6HsrrUyWeI+a9n7sHiYdNQMcCMcpzq5v2bK0b3xT+82tb83HtFQvummqcOkC
 gZm8UcLcA3ilXJef+aZce+PR6+7THaZaRrQIUdg2qfKDDxPbl2/NoCHp4oC/PLEwE6M9UJT85s
 f37oBAFZVlW5TMLOL2QzGeiODfPlSyD1GRLL/OawpXUiT5Txkb/V4m8C5oH1/OyQPMaO70L1YA
 p4Qc/yj8hPh3lAhJFwLgkxtoAhPN9LiaZ5B2xlp7UiZ5Bi1Srn0EXxCgwB/GlWRpDka+2uWVgN
 NAM=
X-SBRS: 5.2
X-MesageID: 39996249
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:f+I7nay08y14OvMaelZ0KrPxnO4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmqJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheTysd07o
 0lSaR3DbTLYGRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRCp1IxS0RMHf9LmRdQg5aCZ0lUL
 ed/NNAvTq8eXIRB/7LfEUtde7FutHNidbaehYAHREq802jijmv5b78HXGjr2ojehlIxqov9n
 WArhzh6syYwoqG4zL/90uW1ZRZn9P91sBObfbjtuE5Iijh4zzYBrhJdKaFuFkO0YSSwXYs1O
 LBuhIxe/l0gkmhAl2dhTvI903e3C0163nkoGXo8UfLhcDiXjo1B45gqOtiA2LkwnEttt19z6
 5Htljx3/E8bWKi7VbAzuPFWB1wmk2/rWBKq59qs1VlXZYDc7gUlIQD/SpuYeY9NRjn44MqGv
 QGNrC72N9qdzqhHhTkl1gq6tmtUnMvJwyBU0gPt+eEugIm4kxR/g82wtcSkWwH8494Y55Y5/
 7cOqAtr71WSNQKBJgNSNspcI+SMCjgUBjMOGWdLRDOE7wGAWvEr9rS7K8u7O+nVZQUxPIJ6d
 v8eWIdkVR3V1PlCMWI0pEO2AvKWn+BUTPkzdwbz4Rlu5XnLYCbcRGreRQLqY+Nsv8fCsrUV7
 KYI5RNGcLuKmPoBMJgwxD+YZ9PMnMTOfdl++oTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8tRz72CMJc7l26e3PxjRTLMkmdOHDXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHljv8UNDQ
 5DCYKitpn+iXi9/G7O4WksEAFaFFxp7LLpVG4PgQcLNkjzYIsSotn3QxEX4FK3YjtEC+/GGg
 9WoFp6vYitKYaL+CwkA9W7dkWXkmUUv3DPa5sHgKWM6YPEd/oDf9gbcZ00MT+OOw1+mA5spm
 sGQhQDXFXjGjTnjrjgqocVCuHZf9xVmxyqPsZQlHLauSyn1IISb0peewTrfd+cgA4oSTYRrE
 Z26bUjjL2JnivqFXEym90iMFpHaH2eBZVPCAjtXvQSppnbPCVLCUuajz2TjB8+Pk7n7V8biG
 DaISqIQv3TGVZGtndE0qHlzUNsegymDjFNQ0E/lbc4OXXNu3513+POXKa13meLQnYpw+0WMl
 j+EHAvCzIr4+ry+A+emT6EG3lj+44nOfbFCq8/N5vJ3Gm2FYGOnaYaPvNd8Zp/LuryuusTXe
 /3QX7SEBrIT8cSnyCFrHcsPyd57EQ+mfTzwRv/8SyW2mU8Dfe6GiURe5grZ/Wnq07qSPaD3M
 8n0ZYbve6sPn7wbdDD46fNdDJHIg7Sp2nzb+xAk+EhgYsC8J9IW7/cWn/08VsC+jMUBsL9jl
 kfT6R2+6qpAP4mQ+UiPwZiumM0n9GOJnYxugP4AuUCbUgg5kWrSu+h0v7tk/4TGUWPqwv7BE
 mH/wBc9/nDWTGf1bRyMdNGHU1mLGw94m9l5uWMasn5DxirbfhK+DOBQzWAWY4YbKiOArMLqB
 lmp/mOgu+MbiL9nCTdpyFyLK4L02GpR6qJcU+xMN8N19yxIlKXhKS2pOa1kTfsUDO+L30iur
 ctTz1YUu1zzh84jIM21SCuSqv45mId+mEung1PpxrKwYip4GDSAEdcFxbW668mBAVuDg==
X-IronPort-AV: E=Sophos;i="5.81,274,1610427600"; 
   d="scan'208";a="39996249"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Up0vJoI+99UHFGtqeIxi8r3TE2gT9ZRxDZJXHi95BaQKy2zSotxKcqdEgRbvwRGtwWSrzjTcN6qgZXVnVbgWmv6Lsze6OC0NhIY1XReO0GPuAi9/4DB1T6vjZmYQaErRMmjRwrKotoExTAL8uWAARTr86CWgq+INOLdBFZUPzlRG10+o0MoW6DBya1spexRe1oTpnRNGn4uqB8F+80kzQjQVya1XGQ4bJ/14CcXpzXhKy4vWxqEYXY70CnyteMb1PQzw5htQkG0nPZgJ2Kv3giEx81Vkt9wLIXi1vT7KPC/KsEdrbfhq4qni5IA5ulsG2rmXdgQnMWL3fgITBfeV7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOChQOKi45cydSnmUvqH75LPIVSVtkYyJvlO+/i0S/k=;
 b=mFiiTqDg17FIw5qiqETnkrILuX02YTf2mVNtui6ZmqjWlo7n9NVcpikM+p79BxgA56T7jJNw034t0WoZNR3hi0fo4SWNZPpwO6xZGMf86w8RI61YWYhSto8YOdcpoedpBIPQLxVI3dAz5L1J2yzRByuzhWIpD0aLQRDKYHIfKjQqSofvG9C2Vt4cfOn+LX10H3ambupFiU14RSWRNE6uhhZpYQo7gvMYlq4MyE8cNnC3vLocHeht75Hc84tbH+fCPDqp8EQBrohifEBKV0R8O9E1SnXWvCmfT5T5NL5X0A2sS5VHLsdf/73Vs0urY57utLc7V/VMwGWZj46tb1XM7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOChQOKi45cydSnmUvqH75LPIVSVtkYyJvlO+/i0S/k=;
 b=YVaXVq/5bHcNmVmEL6vEZF+QC5wxfk6WbJzMzrCSiDHP5ABtBXthSxpGV6YQR2aj2g+nO8xpBHdJhi1R1nIv/cfasTH8DxZrh0vSK5D8A2qbGG2R+8RjiYOrB96OKh5/zN+anIVIlK6VzGWjefvwr3vr8TehdFG6O/arAwU5AqY=
Date: Wed, 24 Mar 2021 09:01:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Julien Grall
	<jgrall@amazon.com>, Julien Grall <Julien.grall.oss@gmail.com>,
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Rich Persaud
	<persaur@gmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	<luca.fancellu@arm.com>, <paul@xen.org>, Adam Schwalm
	<adam.schwalm@starlab.io>
Subject: Re: [PATCH 1/2] docs/designs/launch: hyperlaunch design document
Message-ID: <YFrxznV1kXeXsRCa@Air-de-Roger>
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
 <20210316031814.10311-2-dpsmith@apertussolutions.com>
 <YFODOnQRAntdETY7@Air-de-Roger>
 <CACMJ4GaWtSWAyqbgqDa-DuLy1bYCBx8E6PucxtGfVeiraAy5cA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACMJ4GaWtSWAyqbgqDa-DuLy1bYCBx8E6PucxtGfVeiraAy5cA@mail.gmail.com>
X-ClientProxiedBy: MR1P264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f1858f7-56ef-4cbe-5e12-08d8ee9b05d3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4298:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB429882634564F0AFAB4C56F98F639@DM6PR03MB4298.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Op4FSAMUPWHckEeUomLbQxOViwC37aJ+fNbTlApVK7XJat2Y3WxTkgGx5YNqtXqJWZL2z/pdJKTmLC/kzkzxi15NnLu7Wt+8uOoaFrUH5Se9fPgFzqba2tTSXJtBjSVf28aZTUlKHsKOH+x/EKf3FWfzMRI3zudbDO4kl2Mz7LD7gItx+qaCNJ0mXxKepnKPy0vmtlJtO5UCyIw0zzAXw8w1T4gBpOVL9kLFB36tpJrhDlipQjbRxO0Vfbce0WByt1O9tWml0pFPSBC52KbuFKZdlcfJQgWAzgbMeKdYlaIwY7PfM85yzIpO3yT/gdB1XwbOmJfHbbVxUvnm9CJY8PfJJkdPNfsZyarLfdahRZHc6cuBj7MdpfkZRsk0yDt/duK21504O3HI73RRvc5CtcsvgliqNuy/3y/NTjBrqjB7uWsTCRGvQcKeqEZXJrZH10BUY2WY5uX2Zve620NsLiWcVzju6UCwTYydxlyQNH3y58OdV3UpoN5/lHWQieoyNx8cZQ/fjXSuXp5npUpTJNoRKFHOVzLaUnB9cfipbcao9vS6r4NrRfmjIQACUKL3wZ4srjVY/ZK4ioNPDeMYJK2kjZgBpFPS1wOUaKYMElBy2mI0fPpvH3u279sppd1rLd68R797ejNGSfZcV1vI70YZMmiJ+FyaQxmEuppHrF4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(8676002)(9686003)(38100700001)(83380400001)(6666004)(33716001)(6486002)(53546011)(4326008)(8936002)(66476007)(7416002)(186003)(26005)(85182001)(54906003)(86362001)(6496006)(16526019)(2906002)(66556008)(5660300002)(6916009)(66946007)(316002)(478600001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZDVITThFWlNpSjhHVHowaWorcGpQYk5hTVBNeVBtZHlkNmN2YTZ1dDJjTUht?=
 =?utf-8?B?VEtzNzlCcTI0TlFCa09zSmc5dzdnRkYvNE1pV2xiVjJiZzdVUFRJUkpMci96?=
 =?utf-8?B?UVZrSkZ0QVU1R2Y2RTgvekg1QkQyMVJnemhBVUZxOGphMUFzclc5WG9GZE8r?=
 =?utf-8?B?SXNqRlpuVytSREcrOGV6dGxYRXlidS9YTWl5cERRM3VMNGlJZGo1M1JINVVm?=
 =?utf-8?B?Wi9OM1BYVzRQelcvOUJUeE1aMEVDUFAvQ0pQQkZNL3pSZXY2YlBISTNjenQx?=
 =?utf-8?B?SDZ2eFpwQ3RrNHdESkxRSzNGcWF5aW0raEUyZ2FZV2YvM09LWHEvRGpFUXdH?=
 =?utf-8?B?YXFEUlBpWHFrVjZvOEw0cjZWMjUrZW9OV1pTQVJCaXVJN1NZTGJDeUo5eDQ0?=
 =?utf-8?B?UHFDZEUxSUIyL05BbklJU2IvWVI2WTBjNVdUdDRJMTQwZFNlYktBSVp2N21B?=
 =?utf-8?B?bHR4OE8yc0w4a1loeStyMW5qSWlaL2lQTnFodDBEWm8wQ3N5VXU3UDZac1RC?=
 =?utf-8?B?ZlZ4QWdTVm9vbmVMQStzVmF1cEhZemxrMmJFc1d6eWNkS1dpQy9Xa1N2NVV5?=
 =?utf-8?B?VFVBV0J1ZmRuT2FHbmNnSkliM0VQQ2FtMCt0QmtCbkY0ZTVpRkFUT0RxTURq?=
 =?utf-8?B?a3pMNlJkSGIyb294UTBTR2Nxdk9NTzJrQ1h1RUxwNk0yaUhNNUwveXRlZHgr?=
 =?utf-8?B?SHpDZy93RUt2aXNVNjIxN29VNEYyQ3VEMVdBT3pMRmFYbTNqc0NzNlZVbXBU?=
 =?utf-8?B?QTk0YTcwOUVWb2szeDNqU24vcEF3RktiNzczV1J0WGtiWGhrUW84ZkkzS01T?=
 =?utf-8?B?Uk1zU1gvR29JMHMrVXRMb3FjNmVCWXlhMGhwT2lGalA3QU1vWEZZSnUxczJj?=
 =?utf-8?B?aTFUV3VLTlJTS2xHVm1UYjZjMnVXR3lrMURGRG16dlVEWlNwK1A5ekJ1Wmg5?=
 =?utf-8?B?Q1ZTMXJONHdkaVlYZVpDZXc4WWk5V2I5UGU4Yjg5eUJmNXkrSnozQytHMEt4?=
 =?utf-8?B?bTZPeHFnTjJ3UUZvYjhSazl4WGdHRk1ZK3BSYkVTWlFHb3p3V2JIWVlXeWI3?=
 =?utf-8?B?MnpQMmZnSlFKTDI4TklmLy9CRlBQb2JYN25pQUZUUzFEN1htTXpnL0wyaXVF?=
 =?utf-8?B?QVFVU2J6Wjc4RW1vZkNDUUZ3RFZsU1dkMXdpMUhNNDhnNG4rRXBSdGJvTmdH?=
 =?utf-8?B?aTVvVy8zVGJMb2dzZUdYM082bXJPTUtlRHNnR2U1M1BuUkdlUlJYYmJmNzRt?=
 =?utf-8?B?alJuQytTMElmYkpNaytGOGpvMmxoZGJaZlA0bzRXazViazhiZVMvZHRXZ2hq?=
 =?utf-8?B?VUhkTXNRMUU3dk5Uc1F4b2w1Sk1mNUlWelhKQXZvV3BkMU1mdnMrRTl5ZVhK?=
 =?utf-8?B?TU5LWEpKUTIxemtMZlpXbDFiVklOdzV2RzZrY3htWXFSNVJaTis3eXFHOG56?=
 =?utf-8?B?Sms3R25ZVGhObDAwSWwydTBFQzRSbWF4bWk4eW1pZ3VVSE8xMjJyS0R3Zjcr?=
 =?utf-8?B?WHB2UFJrVU5JNUk4SjVSY0VveExQOVRPQ1F5cVBkVEdkQW5ycU1ENUxMODRv?=
 =?utf-8?B?WnV3TTV1R3hWVHZIL2JMTFdZV2NWVS9wbkp6WjNxd2VDWXZoSWZ5MktoSzZQ?=
 =?utf-8?B?bmkybldpbzdZTXEvKy9uZUxCZUFOVnR0UHhEWmg5OFQ3WGRUczJwczdaRGlU?=
 =?utf-8?B?YUFQVG5kdU1wWXg3ZkVBQmlQR2lsMXZkT2dRajNDaDRQZHlaN1FqOVhNeVgv?=
 =?utf-8?Q?R3BkcH1tuRggTdYahRy3HkHEKO9ixCYt+uNEnSt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1858f7-56ef-4cbe-5e12-08d8ee9b05d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 08:01:26.0055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrPOXjt897neDroCuVqNN+VHBn8CvS8z2KY+PTWvXudQ51RNPq8ojVpVY9KP1/t21Yowim6A3o0iU9q3/ClPiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4298
X-OriginatorOrg: citrix.com

On Tue, Mar 23, 2021 at 10:39:53AM -0700, Christopher Clark wrote:
> On Thu, Mar 18, 2021 at 9:43 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > Just took a quick look at it.
> >
> > On Mon, Mar 15, 2021 at 11:18:13PM -0400, Daniel P. Smith wrote:
> > > + +---------------+-----------+------------+-----------+-------------+---------------------+
> > > + | **Xen Dom0**  | **Linux** | **Late**   | **Jail**  | **Xen**     | **Xen Hyperlaunch** |
> > > + | **(Classic)** | **KVM**   | **HW Dom** | **house** | **dom0less**+---------+-----------+
> > > + |               |           |            |           |             | Static  | Dynamic   |
> > > + +===============+===========+============+===========+=============+=========+===========+
> > > + | Hypervisor able to launch multiple VMs during host boot                                |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + |               |           |            |     Y     |       Y     |    Y    |     Y     |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + | Hypervisor supports Static Partitioning                                                |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + |               |           |            |     Y     |       Y     |    Y    |           |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + | Able to launch VMs dynamically after host boot                                         |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + |       Y       |     Y     |      Y*    |     Y     |       Y*    |         |     Y     |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + | Supports strong isolation between all VMs started at host boot                         |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + |               |           |            |     Y     |       Y     |    Y    |     Y     |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + | Enables flexible sequencing of VM start during host boot                               |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + |               |           |            |           |             |    Y    |     Y     |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + | Prevent all-powerful static root domain being launched at boot                         |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + |               |           |            |           |       Y*    |    Y    |     Y     |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + | Operates without a Highly-privileged management VM (eg. Dom0)                          |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + |               |           |      Y*    |           |       Y*    |    Y    |     Y     |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + | Operates without a privileged toolstack VM (Control Domain)                            |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + |               |           |            |           |       Y*    |    Y    |           |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + | Extensible VM configuration applied before launch of VMs at host boot                  |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + |               |           |            |           |             |    Y    |     Y     |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + | Flexible granular assignment of permissions and functions to VMs                       |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + |               |           |            |           |             |    Y    |     Y     |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + | Supports extensible VM measurement architecture for DRTM and attestation               |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + |               |           |            |           |             |    Y    |     Y     |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + | PCI passthrough configured at host boot                                                |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> > > + |               |           |            |           |             |    Y    |     Y     |
> > > + +---------------+-----------+------------+-----------+-------------+---------+-----------+
> >
> > I'm curious about this, I assume this is done using vPCI so that
> > there's no hardware domain (and user-space device model) involved for
> > PCI passthrough?
> 
> That would be an incorrect assumption. See below for why.
> 
> > I'm also not sure how you are going to handle things like SR-IOV
> > devices. Right now SR-IOV capability is setup and initialized by the
> > hardware domain, and the new virtual devices are notified to Xen once
> > setup is done. Do you plan to move those bits into Xen, so that it can
> > setup and initialize the SR-IOV capability?
> 
> While you could do it with the vPCI, as you point out this will not work
> for SR-IOV. With hyperlaunch, these cases will require the use of a boot
> domain, which is for all intents and purposes, a lightweight/restricted
> toolstack domain.
> 
> The boot domain will have to do the necessary operations to ensure that
> when startup is finished, PCI passthrough will be successfully setup.
> Note, this may have to include the boot domain unpausing the hardware
> domain to help complete the setup before the boot domain can exit and
> allow the remaining domains to come online.

OK, I was expecting hyperlaunch to do all domain creation in the
hypervisor. If you offload domain creation of guests with
pci-passthrough devices to a control domain and/or hardware domain,
I'm not sure I see the difference from normal domain creation, ie:
it's no longer something specific to hyperlaunch, as I could achieve
the same by using the existing xendomains init script.

Also you need a way to pass the configuration from the hypervisor into
a control domain that would then wait for the hardware domain to come
up and afterwards launch a guest with a pci-passthorugh device. The
passing of this information from the hypervisor to the control domain
would need to be done in an OS agnostic way if possible.

Don't get me wrong, I don't think such approach is bad, I'm just
unsure whether such functionality is really part of hyperlaunch, or
instead something that you can achieve outside of hyperlaunch already.

Thanks, Roger.

