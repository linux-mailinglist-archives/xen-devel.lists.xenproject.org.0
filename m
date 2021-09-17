Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B4340FD13
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 17:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189511.339299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRG5B-0000EP-Cv; Fri, 17 Sep 2021 15:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189511.339299; Fri, 17 Sep 2021 15:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRG5B-0000Ai-7Y; Fri, 17 Sep 2021 15:47:21 +0000
Received: by outflank-mailman (input) for mailman id 189511;
 Fri, 17 Sep 2021 15:47:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50Eq=OH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mRG5A-0006W6-BW
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 15:47:20 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 855571e5-17ce-11ec-b6db-12813bfff9fa;
 Fri, 17 Sep 2021 15:47:12 +0000 (UTC)
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
X-Inumbo-ID: 855571e5-17ce-11ec-b6db-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631893632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=DW6Fveyl5rzZoyiIlEPBEWmEFUr6L5PhG/wZX+BGMtQ=;
  b=ANhHhdEboSm26i1YXwUMFiTz7Un3u2E2Ne2ft4bZ9KTu22jhz+GvEtBJ
   4mMGxLuFRxVLdv3Lsj07rQB03hjDRaI67tKRrq98mL97SbOklkQsAx9G9
   nkySXdDgDX6NGzSiYbV337aB+d0iH+Nsmcgjjxc+5fV+maxeF3c2lB0ob
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 84oIj8BE9p55PxfC9ZERa/u8i0MpK7xcXN4/KoTqWPgZmsTzH2mBW1BxVQeOrHqI87ndTyuI9j
 d3k3J3c6sLy9EpXO+VGmF931mzXWup7/HKx6vVPGcb+kA3fBA3hG3zQJMUPAolESXKNWvy3uxW
 iWQX2uu+F0tSukQ+HZO+OVyghhIs/eUsNKGVOE6gAeL9+zczzttgyQD1mpQkZjlUd2J0QrERjL
 dpcqI0GdOH/UTiBF4kmF92imwzUFG/C6qCyBaYiOp4lAoz4yL6N0xNEmn9yE3QTu1KCLJo6sjb
 QggMRAVApZ/KeBGaFuvKHHcA
X-SBRS: 5.1
X-MesageID: 52589463
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AyHeYq96yGgmKx7KigCjDrUDeXmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 WoXWD+DPP7ZZTOgeo0jPYzioUIF65HTxoQyHVBoryE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6w79g3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPggz
 991mdu8TjxqI6eWndYXYgBeA3tXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFhmpg15wQRp4yY
 eIrMBNLcRLKXSRQGWcYKKxhkeeRnSXWJmgwRFW9+vNsvjm7IBZK+LrwNNvYfPSaSMMTmVyXz
 krd5HjwCBweMN2ZyBKG/2iqi+uJmjn0MKoQG6e/7eVCm0CIyyoYDxh+fVmxrOS9i0W+c8lCM
 EFS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmkbTBZRZdo+rsg0SDc2k
 FiTkLvBGjhHoLCTD3WH+d+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznH9FpKILygtrOWiz6m
 TW4phkngaVJpJtev0mkxmwrkw5At7CQEFVstl6GDzr/hu9qTNX6PN3zsDA3+d4FddzAHwfb5
 BDojuDDtLhmMH2bqMCarAzh9pmS7vCZOXX3hVd1FvHNHBz8pib+Iei8DNx4TXqF0/romxeyO
 yc/WisLvfe/2UdGioctOOqM5zwCl/SIKDgcfqm8giByjn1NmOivp3oGWKJt9zq1zBhEfV8XY
 M/GGSpTMZrqIfs+l2fnLwvs+ZQq2jo/1QvuqWPTlk/8uYdykEW9EO9fWHPXN7hRxPrd/G39r
 oYOX+PXmk43eLCvPUHqHXs7cAliwY4TXsut9aS6t4erf2JbJY3WI6WAme9+I9M1wfs9eyWh1
 ijVZ3K0AWHX3BXvAQ6LdmpiePXoW5N+pmg8JisiIRCj3H1LXGplxP53m0IfceZ1+ep94+RzS
 vVZKcyMDu4WEmbM+igHbIm7p4tnLUz5iQWLNiujQT4+Y58/GFCZpo66JlPipHsUEy66lcoiu
 Ln8hAnVdoUOGlZ5B8HMZfPxk17o5SoBmPh/VlfjK8VIfBm+65BjLiH816dlI8wFJRjZ6CGd0
 gKaXUURqeXX+tdn+9jVn6GU6YyuFrImTEZdGmDa65ewNDXboTX/kdMRDr7QcGmEBm3u+aika
 eFE9N3GMaUKzARQro5xM7d31qZitdHhkKBXk1Z/F3LRYlX1Vr45eiua3dNCv7Fmz6NCvVfkQ
 VqG/9RXNOnbOM7hF1JNdgMpYv7aiKMRkzjWq/80PF/79Gl8+7/eCRdeOByFiSp8KrppMdx6n
 bd96ZBOswHv2AA3NtumjzxP8zXeJ3MNZKwrq5UGDdK5kQEs0FxDPcTRByKeDEtjsDmQ3p3G+
 gOpuZc=
IronPort-HdrOrdr: A9a23:tIL5C6NoCf+r8sBcTyT155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoX5PwO080lKQFmrX5WI3NYOCIghrPEGgP1/qB/9SCIVyAygc+79
 YYT0EWMrSZZjIb/KWKnjVQe+xQvOVvm5rY4ts2oU0dKD2DPMpbnnpE40ugYwZLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ae+TYvdXEmL/vfBZDXnccmUSzpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8wqm4qfm0xjLVymeWxZVLn9nKzMdFGaW3+4IoAwSprjztSJVqWrWEsjxwiOaz6GwymN
 2JmBskN9Qb0QKmQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgQdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfBsRLQkjQNo+ao7bWHHANhNKp
 gtMCic3ocbTbqiVQGZgoE1q+bcG0jaHX+9Mz8/U4KuonxrdN0Q9Tpr+CUlpAZxyHsKcegx2w
 31CNUYqFhwdL5kUUsEPpZ4fSKWMB2FffueChPbHbzYfJt3Tk4l7aSHp4kI2A==
X-IronPort-AV: E=Sophos;i="5.85,301,1624334400"; 
   d="scan'208";a="52589463"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbHMNXuD9bdFr9bQpgF7ljI13L5DFsV6xYz4ohgBe6w4G3/3RshK9kzes0T4dbU7TOOR81Wh+M+o03eCHq8V4LOD6BMVthurBeFVrDLJro822LAGPEzPa7biNvBmpicF1pGDCLdA8OYM90iqZzAQWPTzDRyFnJw0LETd2pgg1mqrDentP/lhjW3+2b1JzXBwOQzUGE8d7KtzGP5MFyoz32bJvTXWYFm95h1X3/deXVBmF0Xxov36aoP0XK5dArhDVlOi8o6jnxFpyY+ezShDdOPcEhYdfeD1gQM3g5nkLSu1fRl1c6gyl62GN0MdwosPLTpsi/Mj80io0gc4+DGo9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LWJyzQpn1vGwUvHb8ce1Tl9dvZuuKifQq5imQ14Lgos=;
 b=Zy3LF5zBDxaQQKlurz2UurqVaVunP24Mwsgwr8QyvPRjrWJ8eQdC/lvzYhpEYHM2T/fxPVNrT8HLt3eWeAJdCKFybX2MNrZ3mmKKo7VHDIdKRR4rJ2I/vYdy8KtzYWwDoZuyl7Oxd9t8x2QM9DxKTQrUb4NiO/BahK0yjz8fTckRhqCrXJBZkQZT8LnT/uSbNVzNljGz1j2Rjy5YlZ3Yft+HMsCKld4EM11QcmP0FX2L8XAUVO370F1ocYsHwJGpRDuFp8w5/OHHV1N0OfmVZYOY7oquE5fWeyiV1cno4mi/oHcxnQpg90Hjz1XiKuAyb9YvB0/I68BfoEG8oxQybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWJyzQpn1vGwUvHb8ce1Tl9dvZuuKifQq5imQ14Lgos=;
 b=u96UQu2ojvkNqdr9ZPaQ6UnHPImQGlluenLbNvcO7UqPRZhbO9s3CQAUYBae9U1J9jWJ8/7VaReJLy6zXX00WFlj+0x/dBCffGHODOl33n02IphswhmTNgoZoar7c/1Wz1S0wORe9PJIO56bd6VxA4ka13TdP56E+l8F8kiu/0w=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Anthony PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 6/6] gnttab: allow disabling grant table per-domain
Date: Fri, 17 Sep 2021 17:46:25 +0200
Message-ID: <20210917154625.89315-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917154625.89315-1-roger.pau@citrix.com>
References: <20210917154625.89315-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e177f618-8a9f-4544-8694-08d979f2684b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4057BFDACCF05B24A4157D748FDD9@DM6PR03MB4057.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JQV6etO/I6MOy5isAT3FfV8BhrT0HdyqHid9PcU39CeiraJ6s+8Tw/WgUJJxgmgEMVRYTu3qJaxOzrWLdopA0VvrYdgapOrfKFVG/BRe1z2T0ZqD75/b8PhgsCJqbCtnTyuuUWDz/794/XeENaF+ie+lxgiTlh5j4+OgzuHa1OK6LmPB/Jbi6mt9qrDNLyjxdDu28qKs0znk5IQaLdY4Qb/YW435Wxa9ZSi9XqOcoDb79ZHXELOF+cKupHTrUNqcxFhw0B03J7WfIqzy1skdqsP5Z4CP6OQgTIeFDyKwbnHrzsqJFovImJXfemVNX8x9Qmn6/4FIW+4xAAT0vP5gjMwgjzuuVERkjHELbswm+wisVBZlaf9jo0kOihgfa5aep6pysnyahhBj6hC7DiCfu9GA1Ww7UASIt4POI+YQcIWEz621rDs6e4KsChqg/AzBXtq9ViNURW32NCD52TgGFAOOTALqj9f4E2WPictqDg07jXU9eOJQ0PwISFruY60V8XrP6elJXm2uTlmwrWAoybvC3uNM86EygvewrzDKt8Pf0OAQ6AdQbxqL4hjzbZKNf47LU2L1wcZDg25vaRYe5VAAi+SWyHCL2KMFsXMO1PftGhScy2KlRNRyX9yOp3QJtZ+o2hl+zFxkwwoFuA+Whw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(2616005)(956004)(66946007)(66556008)(66476007)(316002)(6666004)(8936002)(8676002)(2906002)(4326008)(186003)(26005)(6916009)(54906003)(6496006)(508600001)(6486002)(38100700002)(36756003)(83380400001)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alAzd0hhNzZhcGt6VVA0SkFXbndJT2JMUUZLS2JZcnMrZEI1VHl5dVQrZjRh?=
 =?utf-8?B?cWllSGNXbGUxdU9Wa25qTldDTU9VNXpxV1I2Q0xLL2p4cVNwWWwrOU1xWDJP?=
 =?utf-8?B?TzIxQUxWUUl3ZVBZT0NUQkNZVXhaNG1zekVvemNtZEpnWi85V0E2ZzlaczUy?=
 =?utf-8?B?enpEWitBdXpkZ1ZHaXovREVocWI0b2hjNFprclZXejRrVnU3R00wUDg2dXJ0?=
 =?utf-8?B?ME83NWljWGEveHFFbWdFRVIyNVlnalF1OCtXNk5NNmo5ZEdaTjRDZVU5UXlY?=
 =?utf-8?B?MFdDUDBhZGwwWXV0Q0lBR09mUSsxNlB2dGdsQ1BpSmcvOGhCZ2VoeENaTS85?=
 =?utf-8?B?ZEhnbzNTL3VFZHZlT1dZcVZBT1NqOExvUUNZdGlnYmJPQ09ueGZJOFlVSlgx?=
 =?utf-8?B?YTUxdWpDd0tRaUc0Yk8vK2h1M1FBdVFrTWlPdCtVUlc2VERnTHZHWE9IYTUx?=
 =?utf-8?B?UWZETGFLaWlSWjcvVUZ4QjBsQmFqdWU5c0tFbEZzaHR4WDRVL1E3YkhQTUQw?=
 =?utf-8?B?ZGRkQUxCdE5vaGxGa0RxNk12cWI3d1VyVjQ1SEZ6TGpLNWJUNndOTkswN1Zk?=
 =?utf-8?B?YWRoS1NoMnJOV3hBM1k4RUVCbERxOGtBZHZoV3pRU3FvOXBiZGxrQm9YMlVK?=
 =?utf-8?B?MWlkUm1nVmhSVUxUUVJzTzVWS1BoMFJXTkRIZUM5OWE4ZmUrWTNBTDUyQXF1?=
 =?utf-8?B?S2wwQlRsY3ArcTFIak52ajFJTmxVR0Q0RmRvdDJiQTAvbTRheTB3ckpYcDR6?=
 =?utf-8?B?TVpmUFh3WnQvSmgwUmNRcm9VcGZIbXVDRXF6WlM5NWxvRHFkMi96KzJDWFhH?=
 =?utf-8?B?bnlFRUxoWTV0WnZGVkxDZUhBWEJoeXg5YTRsWGptbDJRd1R4bHBFbnlrNkEy?=
 =?utf-8?B?ZEdzTDRWZk1QRE8yQ1pIVDRVYTF6c1pja0FyaTJ1Z0xWMlhDRzZncmJoeGMz?=
 =?utf-8?B?aDA0UXN3VkJsTVoyWHVveGpnempOSkZNODRsMkhqWlZhM1NtNy8xOUdtYUJz?=
 =?utf-8?B?M0U4eWtwOERPRFVaUEJPcjA2bkc1YkdyWVRZRDB3TWdqeU5uZzRFOFhoTHVP?=
 =?utf-8?B?c1o2am8vamdudEJRNFdMNmNhbzRaQ2hBN1BjWUtHK3pCWjBteWs5NHE0V3U0?=
 =?utf-8?B?RVBOTzBja2pXZDlhZXgxbk5INjBJS2MrSzZmNTVQblJKV3pWYURpbHllYUtV?=
 =?utf-8?B?dkdTRGlXOHRJYVdmd1dSQXRkVFl0T21QVUFaWkdLTlB3OEM1Q3p3dnVud0NX?=
 =?utf-8?B?WDFYRDBtdkNONGx3YmtwamtlTmpSUjRQWjFHcXUwMnRVUFJTNk1ydlV4M2x2?=
 =?utf-8?B?M1hHWXIvVUo5UERBYm92eWhUYnRsdUd2RnJaYTJhS1pWb1gwYlNjMzB2Vzl4?=
 =?utf-8?B?dGJ1WVZkWi9xVnhTMEUvTnBFQ3FxRS8vUXduQ0RIYjlMcDkwZlI4Nmd0TDFi?=
 =?utf-8?B?Z3NNTDFqelVzelFsVk5hSVZ4d0tGTjMvTTVUYSt1K2NWTVN6RnZsOU90NDNO?=
 =?utf-8?B?TXdTOEtmcHoxdmZJNU5rZTVseWJmQkN5N2Q3c0w3MzRqSkJ5bXFLM2EvbHBQ?=
 =?utf-8?B?WTlKZitTSStpdlBmTkV4ZFBjVE9VYkxxM2JwYllvYjNtaGo2VmxCUWN0ZWh4?=
 =?utf-8?B?ZVRWbmhNMFR4YjBwaWdIeE5oQzc1OVVxRGsvZHprN3JHb3BiM0lieEE1OHdQ?=
 =?utf-8?B?cFJUeUliOW9Na3BsQUZlbFdNaW9SODZtY25QSmNQRzZOOXJRTHNJS3U2TVND?=
 =?utf-8?Q?0c1xtUdZcgXdYLe5P6YoJFV8AFmREIPjqY1SqrW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e177f618-8a9f-4544-8694-08d979f2684b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 15:47:08.9487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37Vqbtn6OtKyj2TqE8qTmxmQ50r6KUOSkz9fs0wejEyNOEKr4u/V6IjF3SewjM5s7HU1gOsAy52AyvyIDLKiBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4057
X-OriginatorOrg: citrix.com

Allow setting max_grant_version to 0 in order to disable grant table
usage by a domain. This prevents allocating the grant-table structure
inside of Xen and requires guards to be added in several functions in
order to prevent dereferencing the structure.

Note that a domain without a grant table could still use some of the
grant related hypercalls, it could for example issue a GNTTABOP_copy
of a grant reference from a remote domain into a local frame.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/man/xl.cfg.5.pod.in     |  4 +-
 tools/libs/light/libxl_dom.c |  2 +-
 xen/common/grant_table.c     | 97 ++++++++++++++++++++++++++++++++++--
 3 files changed, 95 insertions(+), 8 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index c5a447dfcd..d507540c2c 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -583,8 +583,8 @@ L<xl.conf(5)>.
 =item B<max_grant_version=NUMBER>
 
 Specify the maximum grant table version the domain is allowed to use. Current
-supported versions are 1 and 2. The default value is settable via
-L<xl.conf(5)>.
+supported versions are 1 and 2. Setting to 0 disables the grant table for the
+domain. The default value is settable via L<xl.conf(5)>.
 
 =item B<transitive_grants=BOOLEAN>
 
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index e9f58ee4b2..afc8b88497 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -598,7 +598,7 @@ static int libxl__build_dom(libxl__gc *gc, uint32_t domid,
         LOGE(ERROR, "xc_dom_boot_image failed");
         goto out;
     }
-    if ( (ret = xc_dom_gnttab_init(dom)) != 0 ) {
+    if ( info->max_grant_version && (ret = xc_dom_gnttab_init(dom)) != 0 ) {
         LOGE(ERROR, "xc_dom_gnttab_init failed");
         goto out;
     }
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 280dbc850a..68ea742498 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1027,6 +1027,12 @@ map_grant_ref(
     }
 
     lgt = ld->grant_table;
+    if ( !lgt )
+    {
+        gdprintk(XENLOG_INFO, "%pd has no grant table\n", ld);
+        op->status = GNTST_bad_domain;
+        return;
+    }
     handle = get_maptrack_handle(lgt);
     if ( unlikely(handle == INVALID_MAPTRACK_HANDLE) )
     {
@@ -1037,6 +1043,14 @@ map_grant_ref(
     }
 
     rgt = rd->grant_table;
+    if ( !rgt )
+    {
+        put_maptrack_handle(lgt, handle);
+        rcu_unlock_domain(rd);
+        gdprintk(XENLOG_INFO, "%pd has no grant table\n", rd);
+        op->status = GNTST_bad_domain;
+        return;
+    }
     grant_read_lock(rgt);
 
     /* Bounds check on the grant ref */
@@ -1367,6 +1381,13 @@ unmap_common(
     ld = current->domain;
     lgt = ld->grant_table;
 
+    if ( !lgt )
+    {
+        gdprintk(XENLOG_INFO, "%pd has no grant table\n", ld);
+        op->status = GNTST_bad_domain;
+        return;
+    }
+
     if ( unlikely(op->handle >= lgt->maptrack_limit) )
     {
         gdprintk(XENLOG_INFO, "Bad d%d handle %#x\n",
@@ -1406,6 +1427,13 @@ unmap_common(
     TRACE_1D(TRC_MEM_PAGE_GRANT_UNMAP, dom);
 
     rgt = rd->grant_table;
+    if ( !rgt )
+    {
+        rcu_unlock_domain(rd);
+        gdprintk(XENLOG_INFO, "%pd has no grant table\n", rd);
+        op->status = GNTST_bad_domain;
+        return;
+    }
 
     grant_read_lock(rgt);
 
@@ -1556,6 +1584,12 @@ unmap_common_complete(struct gnttab_unmap_common *op)
 
     rcu_lock_domain(rd);
     rgt = rd->grant_table;
+    if ( !rgt )
+    {
+        rcu_unlock_domain(rd);
+        op->status = GNTST_bad_domain;
+        return;
+    }
 
     grant_read_lock(rgt);
 
@@ -1931,10 +1965,7 @@ int grant_table_init(struct domain *d, int max_grant_frames,
     if ( max_grant_version < 0 )
         max_grant_version = opt_gnttab_max_version;
     if ( !max_grant_version )
-    {
-        dprintk(XENLOG_INFO, "Invalid grant table version 0 requested\n");
-        return -EINVAL;
-    }
+        return 0;
     if ( max_grant_version > opt_gnttab_max_version )
     {
         dprintk(XENLOG_INFO,
@@ -2056,6 +2087,11 @@ gnttab_setup_table(
     }
 
     gt = d->grant_table;
+    if ( !gt )
+    {
+        op.status = GNTST_bad_domain;
+        goto out;
+    }
     grant_write_lock(gt);
 
     if ( unlikely(op.nr_frames > gt->max_grant_frames) )
@@ -2138,6 +2174,11 @@ gnttab_query_size(
     }
 
     gt = d->grant_table;
+    if ( !gt )
+    {
+        op.status = GNTST_bad_domain;
+        goto out;
+    }
 
     grant_read_lock(gt);
 
@@ -2302,6 +2343,13 @@ gnttab_transfer(
             goto put_gfn_and_copyback;
         }
 
+        if ( unlikely(!e->grant_table) )
+        {
+            gdprintk(XENLOG_INFO, "%pd has no grant table\n", e);
+            gop.status = GNTST_bad_domain;
+            goto unlock_and_copyback;
+        }
+
         if ( xsm_grant_transfer(XSM_HOOK, d, e) )
         {
             gop.status = GNTST_permission_denied;
@@ -2888,6 +2936,12 @@ static int gnttab_copy_claim_buf(const struct gnttab_copy *op,
 
     if ( op->flags & gref_flag )
     {
+        if ( !buf->domain->grant_table )
+        {
+            rc = GNTST_bad_domain;
+            goto out;
+        }
+
         rc = acquire_grant_for_copy(buf->domain, ptr->u.ref,
                                     current->domain->domain_id,
                                     buf->read_only,
@@ -3092,6 +3146,9 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
     int res;
     unsigned int i, nr_ents;
 
+    if ( !gt )
+        return -ENODEV;
+
     if ( copy_from_guest(&op, uop, 1) )
         return -EFAULT;
 
@@ -3270,6 +3327,11 @@ gnttab_get_status_frames(XEN_GUEST_HANDLE_PARAM(gnttab_get_status_frames_t) uop,
     }
 
     gt = d->grant_table;
+    if ( !gt )
+    {
+        op.status = GNTST_bad_domain;
+        goto out2;
+    }
 
     op.status = GNTST_okay;
 
@@ -3332,7 +3394,11 @@ gnttab_get_version(XEN_GUEST_HANDLE_PARAM(gnttab_get_version_t) uop)
         return rc;
     }
 
-    op.version = d->grant_table->gt_version;
+    if ( d->grant_table )
+        op.version = d->grant_table->gt_version;
+    else
+        /* Use 0 to signal no grant table. */
+        op.version = 0;
 
     rcu_unlock_domain(d);
 
@@ -3351,6 +3417,12 @@ swap_grant_ref(grant_ref_t ref_a, grant_ref_t ref_b)
     struct active_grant_entry *act_b = NULL;
     s16 rc = GNTST_okay;
 
+    if ( !gt )
+    {
+        rcu_unlock_domain(d);
+        return GNTST_bad_domain;
+    }
+
     grant_write_lock(gt);
 
     /* Bounds check on the grant refs */
@@ -3872,6 +3944,9 @@ void grant_table_warn_active_grants(struct domain *d)
 
 #define WARN_GRANT_MAX 10
 
+    if ( !gt )
+        return;
+
     grant_read_lock(gt);
 
     nr_ents = nr_grant_entries(gt);
@@ -3953,6 +4028,9 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, grant_ref_t ref,
     int rc = 0;
     uint16_t flags = 0;
 
+    if ( !gt )
+        return -ENODEV;
+
     grant_read_lock(gt);
 
     if ( gt->gt_version < 1 )
@@ -4069,6 +4147,9 @@ unsigned int gnttab_resource_max_frames(const struct domain *d, unsigned int id)
     const struct grant_table *gt = d->grant_table;
     unsigned int nr = 0;
 
+    if ( !gt )
+        return 0;
+
     /* Don't need the grant lock.  This limit is fixed at domain create time. */
     switch ( id )
     {
@@ -4100,6 +4181,9 @@ int gnttab_acquire_resource(
     if ( !nr_frames )
         return rc;
 
+    if ( !gt )
+        return -ENODEV;
+
     final_frame = frame + nr_frames - 1;
 
     /* Grow table if necessary. */
@@ -4156,6 +4240,9 @@ int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn, mfn_t *mfn)
     struct grant_table *gt = d->grant_table;
     bool status = false;
 
+    if ( !gt )
+        return -ENODEV;
+
     grant_write_lock(gt);
 
     if ( evaluate_nospec(gt->gt_version == 2) && (idx & XENMAPIDX_grant_table_status) )
-- 
2.33.0


