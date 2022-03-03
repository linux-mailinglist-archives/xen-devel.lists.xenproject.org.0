Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E24CC2E4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 17:34:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283530.482578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPoP4-0008Di-9U; Thu, 03 Mar 2022 16:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283530.482578; Thu, 03 Mar 2022 16:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPoP4-0008Be-5t; Thu, 03 Mar 2022 16:34:10 +0000
Received: by outflank-mailman (input) for mailman id 283530;
 Thu, 03 Mar 2022 16:34:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW1S=TO=citrix.com=prvs=05474af58=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPoP1-0008BU-Su
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 16:34:08 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc557a27-9b0f-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 17:34:05 +0100 (CET)
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
X-Inumbo-ID: bc557a27-9b0f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646325245;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QnvtV8DRubUOa7NcXPut8nVMyW9NedWPW08QGkjX1X0=;
  b=cq6LdN47GdDPcsOxlRbM3gYh+4zLgO1yAVbzKMxRgZcw5a9RDlHZZmXK
   N8E2C5lIUza4UuAKwdcWKLl/9Fh6JmQ7JjvS3M2QOmPRhv+1HadKb3T+y
   x7S/XYNI9duF6XdUo9PSmmp+QbJZYA05ffVIpcbJt0CGcUW8muOUBZOrF
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65811776
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yxcIramzb/ERk6RvwixFp3Xo5gyjJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNXz3UPvaCZGDwLd4iO4vj9B4A6pPRzIdmT1A6qyk8HyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1jV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYFFcXYPLvpMEkDhwECANQO5F2p6aEPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6uOP
 pNGNmQHgBLoPFoQC3wyGZcCk6S1jGPxLBR5klmfnP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77mUVBAcbXB2gvfSng0i3R9V3M
 EUS5iMoq6Eq9VeiCNjhNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEBZHgAfN/8akfZrQGAx9
 HGPo+O2HH9w5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEI89TffdYsndXGipn
 mvU9HRWa6A70JZTv5hX62wrlN5FSnLhagcurjvaUWu+hu+STN70Ptf4gbQ3ABspEWp4crVjl
 CVc8yR9xLpXZX1oqMBraL9XdF1Oz6zYWAAweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPuMEJYCX2PPQoPtvZ5yEWIU7IT46Nuhf8NIcmX3SMXFXfoHEGibC4hQgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eRD+8zK/kuKHcqT503+idK2PSfJIZ9caQvmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbYels2QDx6UqSJqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA937ys5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:vBLZz6nq0Pw9MmcS3qD5z2Zn8N7pDfPOimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1F9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJrJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUUHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPW9yV0qp/1WH/ebcHkjaRny9Mws/U42uonVrdUlCvgUlLJd1pAZDyHo/I6M0k9
 gsfJ4Y0Y2mdfVmHp6VNN1xMfdfNVa9My4kEFjiV2gPR5t3ck4klfbMkcAIDaeRCdg18Kc=
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65811776"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOdrZ9w97y0PHLArlWmB+UGyFPFabfHKid6MwIkWkswJVcHCC5TDw0IGJnHVV/sjmC8VUlfE+XtGeIqWcuLozicgMZ4GZPoxpJ/iDLNZAKeNbqz/tSZO4/9uDXAVsGV9GLm6MrkF4KR6hFjRcO6/HsS0xFjqQ0xgWKfgCkLZLWyDk2RfCCOaxLQEmCqF9/THwJQsqs4GRzZCHpHuAllx23pOsdqxaYg9rpXBd/kZXaOA/RN1N1LQxiJCTpVNt+Q3nlE0OccoT0d60sTe0GN8EeQnZHCLiwV5/zviWZiTlJY8P20YesO6DSgbDUNtodJwk3RS4SoE4JudpJ/h8NuvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qC0x8L4q/jiNyzHcXMYbkYQ7mVQLfACA/fbs40kDYY0=;
 b=Sh6eV21qoWFOsml+ewTpelzWd4B18tE0zjwmAM2XKVSNYE1kMZbL8yb6w4ZtDNfCh3/TQGigDc6tcldkTI4nmY4lwiLvrQV1FxS/j9m7C6rv73eLTGUTJKv+lW7UR6TSsuxdKorCmOzaAmavh2nrciEgzwsMWNOrw0QxhMABKjePrJJvMkRZjighko6c4BCBe+kKXNjanMQtWdaqrUJ6+cCwRulVmkaiAKrFH1wIiulgIjEmqAtJPBmLUGDxvYVrZOZwW/07iC1a4ecrxju8uzhDBBFF8RNFOfYgMXcDSqX+3P/YdZKew5w0nixP7xMZXoLo76dMHEjOVcEsSyWeqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qC0x8L4q/jiNyzHcXMYbkYQ7mVQLfACA/fbs40kDYY0=;
 b=Bqic8QmOmdpbyTpETsWJSBdMfdVPyPZdDNkdSYS9kGj9kPWZkIIRhnuSwkkfqJLSPwTTUdIuwfvJT0LqIext4ySR0U+KuQL+uADgAg03W5tDSM48LppARFp71hgcTARFX8PuG76heQlBpN8j05AZAA0Yq5LYJWruluv74bHx+EI=
Date: Thu, 3 Mar 2022 17:33:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrea Stevanato <andrea.stevanato@santannapisa.it>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"wl@xen.org" <wl@xen.org>, <anthony.perard@citrix.com>
Subject: Re: Network driver domain broken
Message-ID: <YiDt7fX92n6Luc2l@Air-de-Roger>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
X-ClientProxiedBy: LO4P123CA0300.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f733b72-03b1-4893-a177-08d9fd339ba7
X-MS-TrafficTypeDiagnostic: BYAPR03MB4037:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4037BF9815BD31F780358AD78F049@BYAPR03MB4037.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rLMGJiQd1XtFrFiOv2O8zM5SXNJ4At7DwmWyqYPWJo1qGS+KN4nzUrPtIYhnBLV5fI8EuDgKJuJ2DC5t31klloSdpqL7KCoixcSyP3zTwcqeHKagQ+fQ+TnCLCZoxh1KsPzC+O4qzWIEr0rcobqPchR7NOhFvkv4spm1e+0UNzpQkaQZdLNMEbJMLVYrZAECp5kMQ1vyQFQ7kT9NmcMWWKOPjKHGdJx/4HGfHwXYWBAnwye/TRVJ7os0t8wRnmmBo46pDYvRDFWOVVsMVC0pmBtG2W6fxiAwnAC+D+mILWmuYPiaFkrGZ4pV4jz4IgnUz2UwNJmiElvpAhxuLD0PtmU0xuHNxdskEYKQ3k+N8tnQDyEoQNgZ1VpzQnE2aFBbmBnNth7ua7dpYvRh6yYersHtPpniz3aLYFCKS6Nni7sDYtwUj0c2qdPf+cXPGlDzzYzx79p6v/DOLv7pmCwS6Unae8sRM+RPvOGOsSuPq/rxcTs4xzIfZV3btB+AskeePgPbfNg5vjAPzjMoYewXCbMP8KD7UUzS9/jMMjkunnyerrwMwxeUhECda3vS44T6ILXgMXO10VlL6hiNj+L7q8Lr3BWTaYUDDAXa9c7PoEJXiGDXvQ8gq9buUFaZxI9It8MCf9TWqfGU6H3wsSOkSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6512007)(316002)(8936002)(30864003)(86362001)(54906003)(3480700007)(508600001)(33716001)(9686003)(6916009)(6506007)(85182001)(4326008)(38100700002)(5660300002)(6666004)(26005)(186003)(66946007)(66556008)(8676002)(82960400001)(66476007)(107886003)(83380400001)(53546011)(6486002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWlBVmxOT2VsTk9BdXliQmlLMmFkeUlSdnZuN0V6SGtpdVpyZlJFYTgvYnk0?=
 =?utf-8?B?cFpRVUVER0N1TGp0Q0d3RVozc1Jya0dJMmlUY0VrbE1HM2hmWTUxRjYrS2ho?=
 =?utf-8?B?SU5Qd3lqZEVsUC9sbzFxWWZOeG9lSWNyZ21HT0xhdEpGOTl0eEhTS2thaTlZ?=
 =?utf-8?B?T3FXUkJVYitHMnZNOW5YQWwrQ0lWL25tVVBkdzhudTVBYWVVYktaTmhBb0RU?=
 =?utf-8?B?TW1lY0J6NmNpUEFiTWlzdzRiZFF2OFk3ZWp3SVhlNzBoNWdHeFBERlVFZ0ln?=
 =?utf-8?B?L2VqcDBKN0g0VWt5RWIraTB2VEZhSkE5L1FUNFBRRW9HeGkyRVlLaERCQ01T?=
 =?utf-8?B?Z0x6RHF4ZWJmbVBmSlZHSVo3dTlBSHZoMWRrKzBhU3VvVGpFcjhqd3hlUWJu?=
 =?utf-8?B?SnZFMy8wU2dzOGttUmFVYU4raEt1YkRCeU9pdEdZci9RSDJRcGNMQUxMT1ln?=
 =?utf-8?B?WU05SklodkpXUG5PUDdCTkYwYThtYmZVbXU0WjdwaEJkK0x2dURlQ0xtVTUy?=
 =?utf-8?B?ZWkvTU9wUjE2QVlnVmY5Rjh0TXRTSE5YNGwyWHhjUVdRWGZRMzBNbiswTWxn?=
 =?utf-8?B?QURCVnpOd3dndXg4bVJ4d00xUFNkaldmSTd4Y0pPNHJ6NkNXWkxBUnA1eDBS?=
 =?utf-8?B?NGdRZGJybXNISU1oWXVkT1JUcWk5OXlGNExqZitXZGo3aHQzaFFGSkNUNWxJ?=
 =?utf-8?B?NERZS1hoQXlrSExkRDVtV3FRUDhvVFo0Vmtrdmo2NFdNNDZ0TTl3Tktwb1NG?=
 =?utf-8?B?R0Z5YngwY2dHQjBJMVhLTU1iRFR1UkNiT3hpNFRJYTNCdk1TcFdtOGtvcFJZ?=
 =?utf-8?B?MFNrT0d6WHVyR3R1UGxRcnU2V0paWGtmZFFlZFA4UjlBNjNtbGJqTyt4Y2Ev?=
 =?utf-8?B?dDNHb1BuR1pKc2hnQUJBeWtLcytLWGswd2ljcjltU205MnFvZDloTXVOL2VU?=
 =?utf-8?B?Yk4rTHNudWVxTUhNL3VRWGk1K3NQUUp2M0x6WEFDaVBvaUZLTUlaZ2pKUlhV?=
 =?utf-8?B?Wm1weG13b2U4bjBFRTRmYy9oVFEyQVZHMk5kOG5LZXdwVWFCVFl3MFJPTzly?=
 =?utf-8?B?VWhnZFd5bmUzaklReHFZSENxdTh5ZjRPQkdJZzIvTnpUTWR1eldCb0pQaUtY?=
 =?utf-8?B?NjQ1L1o0NUFQWExTRU83TktwNWNIb083RitZcG5nTmVKTWg0R29mSkl6bFFm?=
 =?utf-8?B?ZUxpTEtZd25ESFJ1Z29YUTduMDE5YlR6NG9obDBFeUtJREpMZ0FRSTZvLy8w?=
 =?utf-8?B?bExSTGtMSnZkSzQ2Ni9RVkdhdzg3VFdUZ0dWWFVuN2ZlaU9meVJoZURtMk1N?=
 =?utf-8?B?MnJOZ0F0eTI5WS9ncHpDM0VrR3F6OVQ4c0ZVSmsvSHFCM01YejJLL0RZd1A5?=
 =?utf-8?B?WVJiUlI5TU8xalorYk5nS3gySHlZSUxuRGcyY0hCV21OQU5ZNFF1VzZ0WHE2?=
 =?utf-8?B?blBWUXRNQ0xwKzhjM3ZzY2JzdHZ5Sy9yNVNIdFlNcnVHYTR2NjJsc0RHbFNa?=
 =?utf-8?B?NFpYTkdtQ1VQMXZIUElOTEFKeHUrWnNFT0tUM2VkODk1amxCbStTSnBoMDhz?=
 =?utf-8?B?clpyOHN3QXYxc1gwaHI3NXhRMTQxUmtLVHBFUTZTeUpzQ3ViOEVqSjNadzFp?=
 =?utf-8?B?bzAzYlVCTHhNTnNSSmdmSmVVRXNSTGRFY3VHUnNTNmxyKzhrK2d3TGJyNXlI?=
 =?utf-8?B?aHF2angvY1VrRTdjbXJmdU5YTjJ3SUk3MWlBUUQvQ0svcmJRSGdjRUpKWjJH?=
 =?utf-8?B?NzdVckwzTVF3NTZCVE1xTENXLytITzRmUVJNbllHUXVpUEtKUThKYzBoUnhL?=
 =?utf-8?B?WEZzVDVQQzZsQmNobDVLMmtIVU93bVg4WGloNjVvZ1dKSkdGVkxJREJKQW4v?=
 =?utf-8?B?c3RMaEJxWlV2MHYzMVFodTRKSHgrYm84elZ6ZERaeDhrVi84NWt5dzNtdXRU?=
 =?utf-8?B?dnM1Q2hMZnVxUTUzWmtUSHVzbmFKcmdiY0wxZ0hPVGhHak9JTk12cmVqWXc0?=
 =?utf-8?B?YlBqNGpXS0J3T1lvdGNIbjk1WnBrMVdBYnlSdXhWWkN1WDJXSDBrLzVVT3Y4?=
 =?utf-8?B?bGNPSU9WQ01EYVBnWDVRa0EvdS95SHpEQVpULytNV2xiZkJCRmRUcHRlN2VM?=
 =?utf-8?B?TWhwbWNUb051dktxYmdtcE9kT0Z1V2NLckhxMVBRYkt6aEc5b0pvcFBram9y?=
 =?utf-8?Q?qlfle8YKA0MwYqTXUpuHvik=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f733b72-03b1-4893-a177-08d9fd339ba7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 16:33:55.0012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5RKwa7NJcsgq6RHOb2Yqp6pVNqxBBYA+/Fyult9ka6VwWNnApjNAfS2XTuCbeTcnWAVzN1Bn2ErCFGol52ZlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4037
X-OriginatorOrg: citrix.com

On Thu, Mar 03, 2022 at 05:01:23PM +0100, Andrea Stevanato wrote:
> On 03/03/2022 15:54, Andrea Stevanato wrote:
> > Hi all,
> > 
> > according to the conversation that I had with royger, aa67b97ed34  broke the driver domain support.
> > 
> > What I'm trying to do is to setup networking between guests using driver domain. Therefore, the guest (driver) has been started with the following cfg.
> > 
> > name    = "guest0"
> > kernel  = "/media/sd-mmcblk0p1/Image"
> > ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
> > extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
> > memory  = 1024 vcpus   = 2
> > driver_domain = 1
> > 
> > On guest0 I created the bridge, assigned a static IP and started the udhcpd on xenbr0 interface.
> > While the second guest has been started with the following cfg:
> > 
> > name    = "guest1"
> > kernel  = "/media/sd-mmcblk0p1/Image"
> > ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
> > extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
> > memory  = 1024 vcpus   = 2
> > vcpus   = 2
> > vif = [ 'bridge=xenbr0, backend=guest0' ]
> > 
> > Follows the result of strace xl devd:
> > 
> > # strace xl devd
> > execve("/usr/sbin/xl", ["xl", "devd"], 0xffffdf0420c8 /* 13 vars */) = 0
> > brk(NULL)                               = 0xaaaaeaf3b000
> > faccessat(AT_FDCWD, "/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or directory)
> > openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
> > fstat(3, {st_mode=S_IFREG|0644, st_size=7840, ...}) = 0
> > mmap(NULL, 7840, PROT_READ, MAP_PRIVATE, 3, 0) = 0xffff9f45e000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libxlutil.so.4.14", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0200\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=68168, ...}) = 0
> > mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xffff9f45c000
> > mmap(NULL, 131784, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f410000
> > mprotect(0xffff9f41f000, 65536, PROT_NONE) = 0
> > mmap(0xffff9f42f000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0xffff9f42f000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libxenlight.so.4.14", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\16\2\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=861848, ...}) = 0
> > mmap(NULL, 925752, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f32d000
> > mprotect(0xffff9f3fa000, 61440, PROT_NONE) = 0
> > mmap(0xffff9f409000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xcc000) = 0xffff9f409000
> > mmap(0xffff9f40f000, 56, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff9f40f000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libxentoollog.so.1", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0P\r\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=10368, ...}) = 0
> > mmap(NULL, 73904, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f31a000
> > mprotect(0xffff9f31c000, 61440, PROT_NONE) = 0
> > mmap(0xffff9f32b000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0xffff9f32b000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libyajl.so.2", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\22\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=38728, ...}) = 0
> > mmap(NULL, 102416, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f300000
> > mprotect(0xffff9f309000, 61440, PROT_NONE) = 0
> > mmap(0xffff9f318000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0xffff9f318000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/lib/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\300j\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=113184, ...}) = 0
> > mmap(NULL, 192872, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f2d0000
> > mprotect(0xffff9f2ea000, 65536, PROT_NONE) = 0
> > mmap(0xffff9f2fa000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1a000) = 0xffff9f2fa000
> > mmap(0xffff9f2fc000, 12648, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff9f2fc000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320I\2\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=1428872, ...}) = 0
> > mmap(NULL, 1502000, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f161000
> > mprotect(0xffff9f2b8000, 61440, PROT_NONE) = 0
> > mmap(0xffff9f2c7000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x156000) = 0xffff9f2c7000
> > mmap(0xffff9f2cd000, 11056, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff9f2cd000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libxenevtchn.so.1", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0@\f\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=10240, ...}) = 0
> > mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xffff9f45a000
> > mmap(NULL, 73856, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f14e000
> > mprotect(0xffff9f150000, 61440, PROT_NONE) = 0
> > mmap(0xffff9f15f000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0xffff9f15f000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libxenctrl.so.4.14", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\203\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=154752, ...}) = 0
> > mmap(NULL, 218504, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f118000
> > mprotect(0xffff9f13d000, 61440, PROT_NONE) = 0
> > mmap(0xffff9f14c000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x24000) = 0xffff9f14c000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libxenguest.so.4.14", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0PB\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=77248, ...}) = 0
> > mmap(NULL, 140880, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f0f5000
> > mprotect(0xffff9f107000, 61440, PROT_NONE) = 0
> > mmap(0xffff9f116000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11000) = 0xffff9f116000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libxenhypfs.so.1", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\300\16\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=14432, ...}) = 0
> > mmap(NULL, 78048, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f0e1000
> > mprotect(0xffff9f0e3000, 65536, PROT_NONE) = 0
> > mmap(0xffff9f0f3000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff9f0f3000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libxenstore.so.3.0", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0 $\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=31176, ...}) = 0
> > mmap(NULL, 107088, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f0c6000
> > mprotect(0xffff9f0cc000, 65536, PROT_NONE) = 0
> > mmap(0xffff9f0dc000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xffff9f0dc000
> > mmap(0xffff9f0de000, 8784, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff9f0de000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/lib/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0@\20\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=14296, ...}) = 0
> > mmap(NULL, 77920, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f0b2000
> > mprotect(0xffff9f0b5000, 61440, PROT_NONE) = 0
> > mmap(0xffff9f0c4000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff9f0c4000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libxentoolcore.so.1", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0 \10\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=6104, ...}) = 0
> > mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xffff9f458000
> > mmap(NULL, 69768, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f0a0000
> > mprotect(0xffff9f0a1000, 61440, PROT_NONE) = 0
> > mmap(0xffff9f0b0000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0xffff9f0b0000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/lib/libutil.so.1", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\21\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=14296, ...}) = 0
> > mmap(NULL, 77840, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f08c000
> > mprotect(0xffff9f08e000, 65536, PROT_NONE) = 0
> > mmap(0xffff9f09e000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff9f09e000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/lib/libuuid.so.1", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\30\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=30680, ...}) = 0
> > mmap(NULL, 94240, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f074000
> > mprotect(0xffff9f07a000, 65536, PROT_NONE) = 0
> > mmap(0xffff9f08a000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xffff9f08a000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libnl-route-3.so.200", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\200\327\1\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=536688, ...}) = 0
> > mmap(NULL, 609024, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9efdf000
> > mprotect(0xffff9f05a000, 65536, PROT_NONE) = 0
> > mmap(0xffff9f06a000, 32768, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7b000) = 0xffff9f06a000
> > mmap(0xffff9f072000, 6912, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff9f072000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libnl-3.so.200", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\360\221\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=141304, ...}) = 0
> > mmap(NULL, 205192, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9efac000
> > mprotect(0xffff9efcd000, 61440, PROT_NONE) = 0
> > mmap(0xffff9efdc000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x20000) = 0xffff9efdc000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/lib/librt.so.1", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0#\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=31032, ...}) = 0
> > mmap(NULL, 94568, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ef94000
> > mprotect(0xffff9ef9b000, 61440, PROT_NONE) = 0
> > mmap(0xffff9efaa000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xffff9efaa000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libfdt.so.1", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000#\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=38800, ...}) = 0
> > mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xffff9f456000
> > mmap(NULL, 102416, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ef7a000
> > mprotect(0xffff9ef83000, 61440, PROT_NONE) = 0
> > mmap(0xffff9ef92000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0xffff9ef92000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libxengnttab.so.1", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\20\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=14368, ...}) = 0
> > mmap(NULL, 77984, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ef66000
> > mprotect(0xffff9ef69000, 61440, PROT_NONE) = 0
> > mmap(0xffff9ef78000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff9ef78000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libxencall.so.1", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\17\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=14400, ...}) = 0
> > mmap(NULL, 78064, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ef52000
> > mprotect(0xffff9ef55000, 61440, PROT_NONE) = 0
> > mmap(0xffff9ef64000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff9ef64000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libxenforeignmemory.so.1", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\16\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=14392, ...}) = 0
> > mmap(NULL, 78000, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ef3e000
> > mprotect(0xffff9ef40000, 65536, PROT_NONE) = 0
> > mmap(0xffff9ef50000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff9ef50000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libxendevicemodel.so.1", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\23\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=14400, ...}) = 0
> > mmap(NULL, 78008, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ef2a000
> > mprotect(0xffff9ef2d000, 61440, PROT_NONE) = 0
> > mmap(0xffff9ef3c000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff9ef3c000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/libbz2.so.1", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\27\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=70472, ...}) = 0
> > mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xffff9f454000
> > mmap(NULL, 134160, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ef09000
> > mprotect(0xffff9ef19000, 61440, PROT_NONE) = 0
> > mmap(0xffff9ef28000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0xffff9ef28000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/liblzma.so.5", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\3403\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=153496, ...}) = 0
> > mmap(NULL, 217104, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9eed3000
> > mprotect(0xffff9eef7000, 65536, PROT_NONE) = 0
> > mmap(0xffff9ef07000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x24000) = 0xffff9ef07000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/usr/lib/liblzo2.so.2", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320&\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=120648, ...}) = 0
> > mmap(NULL, 184336, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9eea5000
> > mprotect(0xffff9eec2000, 61440, PROT_NONE) = 0
> > mmap(0xffff9eed1000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1c000) = 0xffff9eed1000
> > close(3)                                = 0
> > openat(AT_FDCWD, "/lib/libz.so.1", O_RDONLY|O_CLOEXEC) = 3
> > read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\360%\0\0\0\0\0\0"..., 832) = 832
> > fstat(3, {st_mode=S_IFREG|0755, st_size=92056, ...}) = 0
> > mmap(NULL, 155664, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ee7e000
> > mprotect(0xffff9ee93000, 65536, PROT_NONE) = 0
> > mmap(0xffff9eea3000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x15000) = 0xffff9eea3000
> > close(3)                                = 0
> > mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xffff9ee7c000
> > mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xffff9ee7a000
> > mprotect(0xffff9f2c7000, 12288, PROT_READ) = 0
> > mprotect(0xffff9eea3000, 4096, PROT_READ) = 0
> > mprotect(0xffff9eed1000, 4096, PROT_READ) = 0
> > mprotect(0xffff9f2fa000, 4096, PROT_READ) = 0
> > mprotect(0xffff9ef07000, 4096, PROT_READ) = 0
> > mprotect(0xffff9ef28000, 4096, PROT_READ) = 0
> > mprotect(0xffff9f32b000, 4096, PROT_READ) = 0
> > mprotect(0xffff9f0b0000, 4096, PROT_READ) = 0
> > mprotect(0xffff9ef64000, 4096, PROT_READ) = 0
> > mprotect(0xffff9ef3c000, 4096, PROT_READ) = 0
> > mprotect(0xffff9ef50000, 4096, PROT_READ) = 0
> > mprotect(0xffff9ef78000, 4096, PROT_READ) = 0
> > mprotect(0xffff9ef92000, 4096, PROT_READ) = 0
> > mprotect(0xffff9efaa000, 4096, PROT_READ) = 0
> > mprotect(0xffff9efdc000, 8192, PROT_READ) = 0
> > mprotect(0xffff9f06a000, 16384, PROT_READ) = 0
> > mprotect(0xffff9f08a000, 4096, PROT_READ) = 0
> > mprotect(0xffff9f09e000, 4096, PROT_READ) = 0
> > mprotect(0xffff9f0c4000, 4096, PROT_READ) = 0
> > mprotect(0xffff9f0dc000, 4096, PROT_READ) = 0
> > mprotect(0xffff9f0f3000, 4096, PROT_READ) = 0
> > mprotect(0xffff9f15f000, 4096, PROT_READ) = 0
> > mprotect(0xffff9f14c000, 4096, PROT_READ) = 0
> > mprotect(0xffff9f116000, 4096, PROT_READ) = 0
> > mprotect(0xffff9f318000, 4096, PROT_READ) = 0
> > mprotect(0xffff9f409000, 8192, PROT_READ) = 0
> > mprotect(0xffff9f42f000, 4096, PROT_READ) = 0
> > mprotect(0xaaaabaa10000, 4096, PROT_READ) = 0
> > mprotect(0xffff9f463000, 4096, PROT_READ) = 0
> > munmap(0xffff9f45e000, 7840)            = 0
> > set_tid_address(0xffff9ee7a0e0)         = 813
> > set_robust_list(0xffff9ee7a0f0, 24)     = 0
> > rt_sigaction(SIGRTMIN, {sa_handler=0xffff9f2d6570, sa_mask=[], sa_flags=SA_SIGINFO}, NULL, 8) = 0
> > rt_sigaction(SIGRT_1, {sa_handler=0xffff9f2d6630, sa_mask=[], sa_flags=SA_RESTART|SA_SIGINFO}, NULL, 8) = 0
> > rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
> > prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024, rlim_max=RLIM64_INFINITY}) = 0
> > brk(NULL)                               = 0xaaaaeaf3b000
> > brk(0xaaaaeaf5c000)                     = 0xaaaaeaf5c000
> > newfstatat(AT_FDCWD, "/etc/libnl/classid", {st_mode=S_IFREG|0644, st_size=1130, ...}, 0) = 0
> > openat(AT_FDCWD, "/etc/libnl/classid", O_RDONLY|O_CLOEXEC) = 3
> > fstat(3, {st_mode=S_IFREG|0644, st_size=1130, ...}) = 0
> > read(3, "################################"..., 4096) = 1130
> > read(3, "", 4096)                       = 0
> > close(3)                                = 0
> > ioctl(2, TCGETS, {B38400 opost isig icanon echo ...}) = 0
> > pipe2([3, 4], 0)                        = 0
> > fcntl(3, F_GETFL)                       = 0 (flags O_RDONLY)
> > fcntl(3, F_SETFL, O_RDONLY|O_NONBLOCK)  = 0
> > fcntl(4, F_GETFL)                       = 0x1 (flags O_WRONLY)
> > fcntl(4, F_SETFL, O_WRONLY|O_NONBLOCK)  = 0
> > openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 5
> > openat(AT_FDCWD, "/dev/xen/hypercall", O_RDWR|O_CLOEXEC) = 6
> > openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 7
> > ioctl(7, _IOC(_IOC_NONE, 0x50, 0xff, 0), 0) = -1 ENOTTY (Inappropriate ioctl for device)
> > openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 8
> > openat(AT_FDCWD, "/dev/xen/hypercall", O_RDWR|O_CLOEXEC) = 9
> > openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 10
> > ioctl(10, _IOC(_IOC_NONE, 0x50, 0x5, 0x10), 0xffffe6e417f0) = 0
> > newfstatat(AT_FDCWD, "/var/run/xenstored/socket", {st_mode=S_IFSOCK|0600, st_size=0, ...}, 0) = 0
> > socket(AF_UNIX, SOCK_STREAM, 0)         = 11
> > fcntl(11, F_GETFD)                      = 0
> > fcntl(11, F_SETFD, FD_CLOEXEC)          = 0
> > connect(11, {sa_family=AF_UNIX, sun_path="/var/run/xenstored/socket"}, 110) = -1 ECONNREFUSED (Connection refused)
> > close(11)                               = 0
> > faccessat(AT_FDCWD, "/dev/xen/xenbus", F_OK) = 0
> > newfstatat(AT_FDCWD, "/dev/xen/xenbus", {st_mode=S_IFCHR|0600, st_rdev=makedev(0xa, 0x3e), ...}, 0) = 0
> > openat(AT_FDCWD, "/dev/xen/xenbus", O_RDWR) = 11
> > openat(AT_FDCWD, "/etc/xen/xl.conf", O_RDONLY) = 12
> > fstat(12, {st_mode=S_IFREG|0644, st_size=1602, ...}) = 0
> > fstat(12, {st_mode=S_IFREG|0644, st_size=1602, ...}) = 0
> > read(12, "## Global XL config file ##\n\n# S"..., 4096) = 1602
> > close(12)                               = 0
> > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 262158
> > mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_SHARED, 6, 0) = 0xffff9f45f000
> > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 0
> > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 0
> > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 0
> > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 0
> > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 0
> > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 4096
> > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 0
> > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41820) = -1 EPERM (Operation not permitted)
> > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
> > write(2, "libxl: ", 7libxl: )                  = 7
> > write(2, "error: ", 7error: )                  = 7
> > write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
> > write(2, "\n", 1
> > )                       = 1
> > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
> > write(2, "libxl: ", 7libxl: )                  = 7
> > write(2, "error: ", 7error: )                  = 7
> > write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
> > write(2, "\n", 1
> > )                       = 1
> > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
> > write(2, "libxl: ", 7libxl: )                  = 7
> > write(2, "error: ", 7error: )                  = 7
> > write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
> > write(2, "\n", 1
> > )                       = 1
> > clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0xffff9ee7a0e0) = 814
> > wait4(814, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 814
> > --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=814, si_uid=0, si_status=0, si_utime=2, si_stime=2} ---
> > close(6)                                = 0
> > close(5)                                = 0
> > munmap(0xffff9f45f000, 4096)            = 0
> > close(7)                                = 0
> > close(10)                               = 0
> > close(9)                                = 0
> > close(8)                                = 0
> > close(11)                               = 0
> > close(3)                                = 0
> > close(4)                                = 0
> > exit_group(0)                           = ?
> > +++ exited with 0 +++
> > 
> > royger told me that it is a BUG and not an issue with my setup. Therefore here I am.

Just a bit more context: AFAICT the calls to libxl_cpu_bitmap_alloc in
parse_global_config will prevent xl from being usable on anything
different than the control domain (due to sysctl only available to
privileged domains). This is an issue for 'xl devd', as it won't
start anymore.

A plausible solution might be to avoid the calls to init the several
masks when the domain is not privileged, as those are only used for
domain creation or vPCU pinning related operations that are not
possible for a driver domain anyway.

Thanks, Roger.

