Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D78518993
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 18:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319783.540171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlvID-0006I7-NJ; Tue, 03 May 2022 16:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319783.540171; Tue, 03 May 2022 16:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlvID-0006Fq-Jv; Tue, 03 May 2022 16:22:29 +0000
Received: by outflank-mailman (input) for mailman id 319783;
 Tue, 03 May 2022 16:22:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd7v=VL=citrix.com=prvs=1153202a1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlvIB-0006Fg-R3
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 16:22:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 378b25e1-cafd-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 18:22:26 +0200 (CEST)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 12:22:23 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN6PR03MB4367.namprd03.prod.outlook.com (2603:10b6:805:fc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Tue, 3 May
 2022 16:22:21 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 16:22:21 +0000
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
X-Inumbo-ID: 378b25e1-cafd-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651594946;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FPuEodeAjwsUKw7vIjyrD2EQdiqu2zIFLbwrSnLioaY=;
  b=TNi7vjeygHaM0cqHa01C6g2IElQjh4Qxr5N8gAZeoH+YfezJ2HMq6WWn
   tIsMw0/zj+w35z4xmScqQHmt9cUkSWKzRmupaeopDL4qDLJpinukurdia
   q1G5KBdZVzmsbb6dldljqpxPJWrtti90DvTicP8oCa7IJ8FhDgDVlKoOK
   c=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 72956715
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yWjmVK0qZeR343PzTPbD5aVwkn2cJEfYwER7XKvMYLTBsI5bpzwFn
 WUbUTuPMvneYjb8e99zO4Wy8kMEv8fUztdrQQI5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMw2oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0T5YTsTFxzEpfThbo8eAdlKR4lLKd/reqvzXiX6aR/zmXgWl61m7BCKR9zOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82TBfyStbe03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrialImAG9wvIzUYxy3j61Spwk5fvDPbcOeTVVJ9NnByIg
 W2TqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDVtDgWzWorXjCuQQTM+e8CMU/4QCJj6bRvQCQAzFcSiYbMYR28sgrWTYty
 1mF2cvzAiBiu6GUTnTb8aqIqTS1Om4eKmpqiTI4cDbpKuLL+Okb5i8jhP46eEJpprUZwQ3N/
 g0=
IronPort-HdrOrdr: A9a23:z0p/XKvQ/VX6wgiNqA4c+77v7skC/4Mji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kcKDaTCNUEHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0k9
 gsfJ4Y0I2mdfVmHJ6VNN1xP/dfNVa9MS4kEFjiV2gPR5t3ck4klfbMkccIzdDvXqA0570Pv7
 mEeG9klAcJCjfT4Iu1rdB2ziw=
X-IronPort-AV: E=Sophos;i="5.91,195,1647316800"; 
   d="scan'208";a="72956715"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMHmeZHsCQTmvFm1eHbR6VzAfp1wl5PUqnYxE3iImJaO/APZq4GDyyZwpLwHUkdqKwXWeHTmvvwlwgEiNUN7JHbYpUX+GuTkS150ZhYYnMmIeo4oTGfzzz5w6v+77odVZjpipyrM4J5pTp9i8KvsSfoQRxibF5uhMyt4P8tg5uC44VVwApcFXAlNPa5jZAc8A0CH4Fzas1oQZmhaHFq5kMr53RaN5CsVlS6aG0CvG1C0SqNGcl/47n1tz16c61XDnGdRvMRpPuLp38lvzqWFhRRXaLubdSPS+ZbIiOyVEABEZF32JNhfdo40S92vuUXuBvE0VgdoqwI+C9y/WZ5yQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qkzrd2DUK+DDbH0WxNzsiXtOa7GcoyGYyEZagU34lpw=;
 b=fXKxSjl6xIecuasqQQZ+X3KOulvuZP6NaGZLUMZwJYiBVkN5sU7Xjrr4cB2KHv/D4jVsSOXw5gmUjT2DdTc9hKelYKc4mc1OXbKtAo266PnHpyLjp/MV4sXfXPtWBkLF4YMgVzHQWKVJEUxRFhmk19feRpP2Gglw+cjDmX8Camd4tm2D+3daYrIpShLb8WSdod0bRLsyMxFRejjcDdY2Ey9IYDXtyojcL53qZGRosV8Yka5MygoRVwEyTYXy8yzL0z1g8oNkXL5R9kTtFMLugAR3N+2m6QII1MRg4Obp9OVp5VeXquhjICoahZZCv1kI5Ua+puIS/ZC94HLZ0we9BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qkzrd2DUK+DDbH0WxNzsiXtOa7GcoyGYyEZagU34lpw=;
 b=I9ETElZMdTaYvaZVYipPS5o7ugfKPPxoqgv2fHcOOlLrvWou/4to0Skd7Yc0JefOz1iEy2K8eGM7I/bobC0A89MBakW7nz97IfV92TRyr0KpNIbLGlF15gaQMu6Cb7YRHeMfKaqjV+jo14qHpX8ctgTK9XlPSBn1wNxPFaKpVCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 May 2022 18:22:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 02/21] IOMMU: simplify unmap-on-error in iommu_map()
Message-ID: <YnFWuc/CxRLOYu9D@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <cc4323b2-e074-f86f-eea0-9cd6a802bed8@suse.com>
 <YnEDAG5HcQc8SOAt@Air-de-Roger>
 <35e5935b-7082-8224-7ad1-84ed12116426@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35e5935b-7082-8224-7ad1-84ed12116426@suse.com>
X-ClientProxiedBy: LO2P265CA0365.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1ba6d2d-74e0-4c4b-5ba9-08da2d21199f
X-MS-TrafficTypeDiagnostic: SN6PR03MB4367:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<SN6PR03MB43671A11ECD47B65A5D17AE08FC09@SN6PR03MB4367.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qtOdDTkLvLfrQiRVuzEyXczubqRApLEhnvl3soZCxKEaazVFrkjk0KpDk22UIFMxGWPlEHfz8vI39d7IfYK0tgnGYDM9L4kfzZv/S3Ys5UmT8SiYrQmQJ4vrELN9p9S03ErOO8PZj6zD7ueOQQRuZ84R8Tmt6kAghvuaobEVNA8BrphqvvR3/jLvHYx4CYaoYpvYYRsiWXIroa4eddJIO77H0cjekEntpoLw1rzEMrdD6eyuorgu6b5afbd1fXzMguorm/50gGuQ/azl4o42AQpHOkjJ1FaOF4fjqFSNBLsLg2TWodnQ/d9Hmclg81zIiBnQdRbfcdAwfNhefVnr5BO5V8GDvkUXDZ9JET0r3xdr8uwcLYdj5o/ODhDDAn0wohl7PXMOX0tHKoyz5ZnPGuvGvn+Kn6J/43mOBRyDC9oaj6G5u0OCHzbMxlv1dOyVI0Glp7Ad+lwmGzrm41trD/W65iB2be9cOLZkeTpd2l/Um0g6kZ7pDP/gMAt9R52K8jGO75r7PvVafNKIi2imihBLgmSn/fWa3fO9q8fbRPn6Mz+sq2dF3u/BdiA2/41OlawI0EJcZxmtkR247aiUDt6vXfphopxN+G/3YdmcB4UUxI1c6EA5KL/XIANFsAsqiePfsmWXjzS1Y0MxqB1bMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(26005)(6512007)(9686003)(6506007)(53546011)(6666004)(2906002)(6486002)(5660300002)(86362001)(186003)(508600001)(8936002)(4326008)(82960400001)(66556008)(66946007)(66476007)(8676002)(85182001)(316002)(33716001)(54906003)(6916009)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blZML0NTM1RFWnllaUVwUmxOUHl5bzJrSGJzYStRSEc2dzQ4QkdvbU9BL1JH?=
 =?utf-8?B?Q1lpNU9TSWczblA0ZmN0Z0RNZXdPZ2xNMFJmNXBHOXdQRFFjZGxWejEzL25i?=
 =?utf-8?B?a2VHVm9yaDI4NGlzWmp0bmpBUWVzS2paRzN5NUs0aTlvdk12MDBEUzU1VEE4?=
 =?utf-8?B?TWFtOE9EZHpWQUVIM3gzaktaSTgzSTczbzF4RTZucnA0SnlUMTgwekxMVlpr?=
 =?utf-8?B?Wno1Wm9VamY3TWpjckVRLy9hMUx3NFVsSDU0eVNucElQNVRjVWl0eXNtdGcx?=
 =?utf-8?B?NmVmVnlMRnd4K3pEWXovWTV0RXpxWnBKd0lqUy9NYlQ0VHJFNHJXS2piQVpL?=
 =?utf-8?B?ZGRMQllLb1NDbEp5NnQ4UFRncG54L3RhR3Z2c2VqWlB5dlgybG5BUUNTNE90?=
 =?utf-8?B?enE5TWRKU0lFbjZ4bmROVE9nSi9Fam9sRmFDRkNiYi9rSXFrQ001THZ2Yitx?=
 =?utf-8?B?UElEdnEyYzl2REFKNTdDaXpyK1huQndIam94ZTdGa3NYNVdoWGlZM2VZT25F?=
 =?utf-8?B?cVJVM242U01nVm5MVGQ5Ulk3VGtad2xKUmk0VWl1TnNrU0xaelY0bDFDTSsy?=
 =?utf-8?B?WVloa0NLN2NMSlhpQVR1K2thSk5ndVNjWVlNY0RhVmxGZG1XWXhFclR6VzNU?=
 =?utf-8?B?czJSWFJhVm9kSEpiOXFvZS9qS3pSQVJCUVVOU2c2K3lESVVheHN0amQ5cnl6?=
 =?utf-8?B?YzY3SFpuK24xZjJ0VStlckZPcmo0YVpHallRcXE1QTRJUC9neFM3SmhBeklX?=
 =?utf-8?B?Zk9JTTRueERueVdGbjJwRE9mZGd5WC83TVNuRTRTb1VUL2xhc0p6a2VuSTZv?=
 =?utf-8?B?R25EYURZaHA4L2lVMTVyQThicWxSc2QzMDhWSUpjcy9MUTQ2MWtyYklRd1VB?=
 =?utf-8?B?SVRMU3RqZnNWRUNHdUE2ZUFHQlBPc1V5dXlDTmJLMVhReXVkWXBTQUV4Q2Ro?=
 =?utf-8?B?ZFlFOW5tZDM0ZWh1eE1sZ3ozeVJENXBtenptN251b21PZ28yUGZMaDdGOHps?=
 =?utf-8?B?VHduempuL0dvM1UxdXdvcnBiNHNkaGZiQXVRbzc3VlFralBGaTdwQU9FWWtG?=
 =?utf-8?B?anhROGdHNEw1UzJ2YkdvWDRaMXFkQUF1YWc0UG5BK0p5bHBQTkxLMyt0QlYr?=
 =?utf-8?B?emhvMHdKeHhHQmJlR2lwWTRHQkVHTHFRelEvRHoyVGlENDAxQzEzWER1ZG1U?=
 =?utf-8?B?OXNlVlk3YTJPOUNpV3llQ2htMEV0MkduSGVXNW9rTzF3dVlTL1dJTmErZnRD?=
 =?utf-8?B?SzVZbmROWmx6Umg2NkZLQWkzZnFPRytWa1lBRWdHTnRIMko4RGhXM0h4SEdD?=
 =?utf-8?B?RmJ6blRweGFsSnUwTWsvU2YxbjZadHJyZXhVUGwrQlpXY0RqZHdqVkkvbTAy?=
 =?utf-8?B?RE1OVFZ1WnJ4LyszSHFZUUlzRktZVFl3L3VpQ3ZCL0lqNVN2dllOTGlrY3Ry?=
 =?utf-8?B?azVqTzRnNzQrTjVEcGlndGttc1ZQTEg0VE9vazREZkNsdEFndTFqandRZDNj?=
 =?utf-8?B?MTBUL0JBUmhhVXFCOFdUN0srbmhyNWxIaDZrYjBEY0hwbmxaMjRkR21TcEp5?=
 =?utf-8?B?Rmg0cVpkQXU4cm84OVBLcW5wMEllTHlaQkU3ZlJURldkWXNOOFVXeXBZWEM3?=
 =?utf-8?B?Nlp4SGxCeW1BK0JzcnhQSGNiUGNSSXcxaW85ZmljU2RNcVprMkplalFpeUZu?=
 =?utf-8?B?OG9NQnVkREFNUllIQjNRSmQraElsM2Zlaml6b2JpaFh4MXBXdUZRTUNZSnd6?=
 =?utf-8?B?MW5kb2tLVVRFVllVa2xtVVhmQ1AzUkFOeGtLWmp1aStxUFFpY2FpT3RtY0hQ?=
 =?utf-8?B?UjYyd29keUFCbFdrWDhzNHgzL1I0S285MUsyT2RMbUROa2NzbUhUcDBKZ3hW?=
 =?utf-8?B?d2trS1R3U3ErZ1pNRS8rMzF6YzNZUVY1TlNnOUY2dk9oWWN1N0RnZmFpVXdQ?=
 =?utf-8?B?dVBhVzllZDNpU0s4R21tYnBwdUMrRTJWZEkxMS9WSldFVWhBSmZPTUNkTGVi?=
 =?utf-8?B?WUl4aGE0bGZmbXE2a0hCY3dvaTF6UEdmOU1uZFRtZ0R2aXBoVEFRdGNGMDZi?=
 =?utf-8?B?cVkvS0dQdUhjSDNrVVBjZHQ5cFl3bVZIWHNTSmxCMGtYTm9SalJqcmNPK1Fm?=
 =?utf-8?B?VUE4NEp5ZEtsbWZqVE1ZZjRTRVBucW5LR0VsUWdXVTJneE1mTlFxQTc3OVRD?=
 =?utf-8?B?eU0yY0t6bHdwT0Z0V0s0blFtNFZZTjdDb2c1eXJxc0ZpUXVCRytmUlA5L1kz?=
 =?utf-8?B?WXMwQVpLdlhBaGZ6MjExV2o1MWxVdHFnY2hnK0lQNmVudHB2TXhvRGxnWVYv?=
 =?utf-8?B?dzZVNTZ5b1dtbDRuWDhLWDEyancxUit2SkRSTkwwb3BVd0JQMDRtSHFqU2RE?=
 =?utf-8?Q?cvUtNWv/SiXj13Ms=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ba6d2d-74e0-4c4b-5ba9-08da2d21199f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 16:22:21.5109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jm14pvaihxrgEGVmJMuGNjRBPIDdNMYaLzIiF+l0yfabXQxsCUJA5GvCUmF7a/FrCTVmitDKsDd4HyuFK4Iprw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4367

On Tue, May 03, 2022 at 04:37:29PM +0200, Jan Beulich wrote:
> On 03.05.2022 12:25, Roger Pau Monné wrote:
> > On Mon, Apr 25, 2022 at 10:32:10AM +0200, Jan Beulich wrote:
> >> As of 68a8aa5d7264 ("iommu: make map and unmap take a page count,
> >> similar to flush") there's no need anymore to have a loop here.
> >>
> >> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > I wonder whether we should have a macro to ignore returns from
> > __must_check attributed functions.  Ie:
> > 
> > #define IGNORE_RETURN(exp) while ( exp ) break;
> > 
> > As to avoid confusion (and having to reason) whether the usage of
> > while is correct.  I always find it confusing to assert such loop
> > expressions are correct.
> 
> I've been considering some form of wrapper macro (not specifically
> the one you suggest), but I'm of two minds: On one hand I agree it
> would help readers, but otoh I fear it may make it more attractive
> to actually override the __must_check (which really ought to be an
> exception).

Well, I think anyone reviewing the code would realize that the error
is being ignored, and hence check that this is actually intended.

Thanks, Roger.

