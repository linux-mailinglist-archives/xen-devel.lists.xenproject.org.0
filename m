Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2B74B85CC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 11:31:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273926.469227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHaY-0006T0-Pf; Wed, 16 Feb 2022 10:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273926.469227; Wed, 16 Feb 2022 10:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHaY-0006QQ-Iw; Wed, 16 Feb 2022 10:31:10 +0000
Received: by outflank-mailman (input) for mailman id 273926;
 Wed, 16 Feb 2022 10:31:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKHaW-0006Q9-Vf
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 10:31:09 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b475459-8f13-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 11:31:06 +0100 (CET)
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
X-Inumbo-ID: 8b475459-8f13-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645007466;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=2cmgVfLuMuBrQAmTr+tyhqnmu6SgrAgj21TG/LKd7uE=;
  b=Cf0ZZHVh12pnSqkyd+maMW0oVDtLtz14hxUA9eVG11HWDxpnBRJuXq2y
   57cnt42P+SK9tXX7mudluvlNk9iugYI26NCgcnZlYIfm87iKv586dLlsm
   pU9mh9NX7qQ0bNyo+qzNB8x/uqsBYvNcEWf4igkVFSMgD4/IR9MLLMFjq
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cpyNvdsXeWSy/GVindAHOYUTyIG1OMciGpmzP+0JG5tfnx8lrWqpNCAUPuL8JtvDHH+tTvZIkg
 qbyqtVrvNe+sle4A7H3rVQLOu8ZfCJQk6Ir7x8/ayaxoi51c1p3iGgyZRrT8EsPIor+5Fci/Yl
 ogiWwudaiTuNbbjMkKnMVwG5iJa2ReoP9cy+0aClzB4kKj3eZLBK/kH3kYQj63Va6RMeoH/1dg
 8G813WeOTVxBzKFS6/1PbP/gXhSbs3SX5t8afC9+IVWFHmIU/xM1OGQJI27Dir2xmVgecrsdpw
 b3m+jeJwNdQxbt7TaXSw4DI1
X-SBRS: 5.1
X-MesageID: 66561505
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rEGkmKrPdtzbjCGSEV3IqI3+cGxeBmJ2YxIvgKrLsJaIsI4StFCzt
 garIBnXOPvfYmqkLdFyPYy3oE8H75HdytNrTlZppXs1Fy0WoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HnW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZyiFSMPO6nypLgUCAFHPgRzY5xIwKCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4QQKiHO
 pJEAdZpRB/pPS9QeQ5IM58vjraJv33hejdfiU3A8MLb5ECMlVcsgdABKuH9eNOQQt5Otl2Fv
 W+A9GP8ajkBL8CWwzeB9nOqh8fMkDn9VYZUE6e3ntZyiUCX7nweDlsRT1TTice+jkmyStdOM
 Xs+8yAlrbUx3EGzR9y7VBq9yFaOswQAQdNWH6s/4RuU16vPyw+DAy4PSTspQNA5sdBsbT0s2
 EWAk97gCXpoqrL9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5LEqS4k9n0EjHY2
 C2RoW41gLB7pcwW06S2+3jXjjTqoYLGJiYq4i3HU2Tj6Rl2DLNJfKTxtwKdt6wZat/EEB/R5
 xDohvRy8sgOH82psimJftlRFeqx+NugPWPtj2ZwSsxJGyuWx1aveoVZ4TdbLUhvM9oZdTKBX
 HI/qT+997cIYiL0MPYfj5aZTp1zkPO+TYiNuuX8M4IWCqWdYjNr682HiaS4+2n22HYhnqgkU
 XtwWZb9VC1KYUiLIdffegv87VPJ7n1mrY8wbcqip/hC7VZ4TCTIIVviGAHTBt3VFIve/G3oH
 y93bqNmMSl3XuzkeTXw+oUON10MJnVTLcmo95AGK7fZc1s3QTtJ5xrtLVUJIdENc0N9zLmgw
 51AchUAlAqXaYPvdW1mlUyPmJuwBM0i/BrXzAQnPEqy2mhLXGpcxPx3SnfDRpF+rLYL5actF
 5EtIpzcatwSGmWv02lMNvHV8d09HClHcCrTZkJJlhBkJMU+L+EIk/e5FjbSGN4mVHrn75Bv/
 Of5i2s2g/MrHmxfMSofU9r2p3uZtnkBguNiGUzOJ9hYYkL394Z2bSf2i5cKzwskcn0vHxOWi
 FSbBwk2v+7Ir9Nn+dXFn/nc/YyoD/F/DgxRGGyCteS6MizT/2yCx45cUbnXIWCBBT2soKjyN
 /9Iy/zcMeEcmAoYuYRLDLs2n7k14MHipuEGw108TmnLdVmiFphpPmKCgZtUrqRIy7IA4Vm2V
 0uD98N0I7KMPM+5QlcdKBB8NraI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsom
 L5zttQX5gqzjgsRHuyH1i0EpX6RKnEgUrk8ss1ICoHclQd2mEpJZobRC3Gq7cjXOclMKEQjP
 hSdmLHG2+ZH3kPHfnc+SSrN0O5aichcsRxG1gZfdVGAm96Djf4rxhxBtz8wS10NnBlA1utyP
 EltNlF0evrSr2s52pAbUjD+ARxFCT2Y5lf1mgkAm2DuRkW1UnDAcT8mMuGX8UFFq29Rc1C3J
 l1DJLoJhdoyQPzM4w==
IronPort-HdrOrdr: A9a23:z+9xaqPFvnREVsBcTy/155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/uxoX5PwPE80lKQFm7X5WI3CYOCIghrQEGgP1/qG/9SCIVyBygc+79
 YZT0EWMrSZZjIW/KWKgjVQe+xQv+Vvm5rY49s2oU0dKT2DPMpbnntE40ugYwVLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ae+TYvdXEmL/vfBZDXnccmUOzpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8wqm4qfm0xjLVymeWxZVLn9nKzMdFGaW3+4MoAwSprjztSJVqWrWEsjxwiOaz6GwymN
 2JmBskN9Qb0QKnQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgUdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfNsRLQkjQJo+ao7bWLHANhNKp
 gsMCic3ocaTbqiVQGWgoE1q+bcHEjaHX+9Mzw/U4Kuon1rdUtCvjslLfok7wI9HaIGOuh5Dt
 v/Q9dVfcl1P7QrhIJGdZE8qJiMeyXwqSylChPhHb2gLtBCB07w
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="66561505"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyouVvfQVjL2PVbYCCm9yeySVpxNoIrDX+qEKuLcLkGAXFd+UL66EiinQhI3vf9d1dcZFL8YL/XaB/TTsF1+I20EDT2qJO3x1esrqnZ9mmz5KrGGwHGrK4PLYGqW/XFRSmJzKjQCl+03ftX2HHEygmAyhD657NxgH9FBZSt0TvqkomW5whvl6Z5YShBzvC5H2ZDDRpZryi5MzBLVrLgEB7zU8fK4KPb54ncuHOe6AageddsGHgIESON/WeNeNCKvWWpmkrEdQlC/H8FzCyfCCifXMItP8wO0Lg/etd7jFJOJtM9OIBVXjjglt7ou+mCVUUe8DqjbNFIhVL09JxE2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTyBPc0ixC3wltOLWbiErHLOypalZnlfv/Qcb4R8izM=;
 b=aggHtJatkzm+jwLMH2Yxvh3fBYxm4z6E/ldtZbob8ZV4w4f5uDIiihxH6lksyPaPDSzzx4Iqc8Zpf9oXQRtKxNAj6+IVsvIYW6ByZeGOJAvK2e6HPcg1O+EPwQoYR36/Yyf22VP+BXnyvnBN+20aY7syaXKbaZ6uAuNiU8PbCCgBeAGH1lcE2MpTnXYEfbvYWmg+DLoU1KozaROFp+trF7HRk6xE7qFKqA0wMzubsH8BVd3rGdIvuPz0VrNz888bdZykAwpiTC/4CBswe9EIfhENrRdCLONtK9EcCcU7lO94DiAvBRhPSNOLLlmwMuWqifol4WaSBwdJgx6MenF/pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTyBPc0ixC3wltOLWbiErHLOypalZnlfv/Qcb4R8izM=;
 b=rWvKlD7Xp+10xDp8NY2GxHzyYU2Kvk5NAVJVHCN1evxKYPIrqtIiWxuTfTBVVhNgdq8pD7AtXXeuU7aQbiOBr4QXvB54q3l50A2nv2W8E1csnawvmAqZ1TUyyqasi+py7eBROIXXMu6eTrA3zdC2JV9eIrN+gMauZZaTG2GyThE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <dwmw2@infradead.org>, Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Paul Durrant
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/5] x86: extended destination ID support
Date: Wed, 16 Feb 2022 11:30:21 +0100
Message-ID: <20220216103026.11533-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0079.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::19) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bc99fad-fe4d-43ce-36c8-08d9f1376731
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6256:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB62569AC9FB3782B7A907A6128F359@SJ0PR03MB6256.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lb+vkWuTvhPd9247JzbarAk08YupkmI1tOD3YDVNMS0ul5UQPXLW4agEwICPK12O32FG0ZHX/uvyVFl+1ndXR5DIv9bbGuNKq43R0GcA8v0GclnnueOKLWHHy2PCMoRY6suqCj4BUo0r8pzXQdbIWaTwNPSvAf7O7R37iktjKa/YURNakOTWvNsvkx3eWnA79AfUyAuDYmB05SOh0hhmNdHAOy04zanw8f4rjZXI2Iy3/023znQkHWEdhkR+fk5JAN930GEW2ziFElwLbF5bAs2Qd0wHQURpkweNgFaAHNuz8HXzFHfbVDySTT+9JDBApOE/jMThKjPk2SUtIZIDK4OQb2bYldp3Gh7v4jF5v7ULhWXtHiLPu6SJGGDuGzwzguCwi8DsfX6da2HDDGM3TkpMmjBeFDQ8QyLUz7ZgwvAGT8mO8pZZWrrrpTbaVG4WH5Bsb1tfstUtb4UFvYhHkXxSYAv5YAv34MfMgW4MpdrABQcy2X5Oqy2Nv4zUKzzPSx0ZEc5EYMc1VkJkt7K9IgDvegc02J87d/X8IlNcwL181Trm8tQnPg+aurO+JFZ1kt9kULhD4A+SdEH7hJrIwN/BRvttdn6Pq3/tMx+n2H0d10L93aoXxMZpIqZeJ3qIgz5cAkMAe8OZ1L+IqLAcMB3rHv4wTOfJsH9MiR/RBAP35j3UTAObrt/c+dOzqypmueDiMqUto7CfmPx+b7DwcULDzCzBUzGxuS+UcUQj0TA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(2616005)(66946007)(6506007)(6512007)(316002)(26005)(1076003)(66556008)(508600001)(86362001)(6486002)(6916009)(6666004)(54906003)(966005)(82960400001)(66476007)(83380400001)(4326008)(38100700002)(36756003)(5660300002)(2906002)(8936002)(7416002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3BsUGlUS3E4eEFScStIanpoSE1kSzFhMGMwZHJRUUI3YjVxTUk0dUlTZXhi?=
 =?utf-8?B?Qlhpak5HUTJsOVVsMkhZcGRBeE5BQVkzbmZJcUx2S2VzM1BOZkY0VENsa1hG?=
 =?utf-8?B?aDdHaGx6eFdCOGlaNEZhQTdVSjJsc0FJRUR3TTBYTHVpWDh4dWRpbWdrSUY2?=
 =?utf-8?B?N0dwNEZIRDY3eGxhNkp2akd2QUEybS8yVDhLTWFwN2hNcTlrbnB6NjRvNnhp?=
 =?utf-8?B?ekN5VjdYbkpDbXI3YTVpTFdXN1FvdU9zYU1JUnB6YjYwR3JxaFpMTVF5YThU?=
 =?utf-8?B?cm9SMHBSeVN1eU00dnd4R0E5L3ZUY0pLWmJIQmdBWExtM1d3SHJJdE0zWGd4?=
 =?utf-8?B?dS80VUFkdTVDTmtJUURTcUtRbXYwMXRCd0hYMW50TXpTNlBSSzA3bUlXOUdB?=
 =?utf-8?B?a05zeHUxdmtZR2hQR1BkZ3JkajRhOFNCZlRtNldNQTBkOHVCZVBQeXBBYy9v?=
 =?utf-8?B?NnlBdjhQaUJrRzJWVngwWWhCWng5R2UxNmdFamgwV2xjRGJTaVFvRlNaNkZO?=
 =?utf-8?B?andCUzJCanJ6Ui92a2phenh0b0Z6dys4cDhhU09IVGJ4T1BmVUhhQTNhbU9D?=
 =?utf-8?B?bDVwM0MxcktqR1U3MFl2S0lwZUZqRzU1R0duU2JYWXhHZGxEQThrNTNWY08x?=
 =?utf-8?B?cm1YUGpDNTZDRUtMeG1XcjUxcnFyMkVXZmkyM3FZeE1oMElMMnBJT0lCdlNk?=
 =?utf-8?B?cHNoOHlaOTBXOGFMWEJtOTUzNVNIRStYbkEwa0xMcFNUTG96Wm94SWJNbTJz?=
 =?utf-8?B?bWVITEFrMVZYNVF3aGtTb2tVQUhRZnV6elFxcDgxSGhZVmcyTnNXZEZzM0VX?=
 =?utf-8?B?YklVWmI5TkZ3N0lzakIyZ3pNbCtCd0dIcllQVVlvZ1VkT0ZBbGVUc3dtU21K?=
 =?utf-8?B?Tm5lTmFwUjNsQ1RaeFAzVjZrTnlOeVh0TTNPbDNkMEErL0U0ZUlWQjlDclFL?=
 =?utf-8?B?anAwQkdmUnZBS2l5NWt2cGJSUTN1YStKZmh5WlZXbHhSL3Ava0xlNlROVXNK?=
 =?utf-8?B?Q1NyK2QvdWRzajZFRzNzWTRKa0Jadkg2V3RjTmpRWmR3ZE50YUhGUXdIbWwy?=
 =?utf-8?B?OXFzZG1uWjVSMTBnd25zYmwzK3YxMk5CazZ2d250dDBQNUFmS2NVY241OGFS?=
 =?utf-8?B?QzI5dE0vdmpvQXc3a2dtM0tKUFFKRjlHLzBZNzJ0Z25FQ2hIeGxFcjNUaVpH?=
 =?utf-8?B?eHkxTzRFTFA3TXZ6M0xzVlVYQXIwaW9VNjFDZjJvdmlEU1NLTW9mekJvRUpM?=
 =?utf-8?B?WU5sdWpXNGhuaWJrd3gxUS9kc0crTFFHZEZtWGFVaWhnQmZ1VjR1TE1SRGNN?=
 =?utf-8?B?T2V5WFNBT1ppM21jb2xtQlFMNXBKZkpMbEU2emIvSzJ0SnFxbktLWmsvMURw?=
 =?utf-8?B?Ym5qTm03YWhldnArSnQvNk9vd2lEUUtnb1VQVlY3cHdNNmh5OHRDMVRLSVoz?=
 =?utf-8?B?aEpuSXdBTHBvcytJWTZvYms4L2NXc3hRQkZ6VVFBelc5WXRXUXdVUDY1bmJw?=
 =?utf-8?B?R3BGSWdDOGkzNm5yRVJnTFB0aTF4OVpaSGZPT29mTUVZMzFtbURBc0N2NXZH?=
 =?utf-8?B?cmI4WXl2dlZlN29jU1hmbmJxT0xNYlNobm9UL09aZ1IwTElDN0RaOVNueWp2?=
 =?utf-8?B?WjlpNGFoOVhyaXBGcDFIYzIvQzIyVEhYQ0h2R2VoSTNORnF2d0pRZTVlU2l3?=
 =?utf-8?B?dElWM2tkRU1WYWxpWmdNMjN0dnV6SkhweU1QV1B5N3RkTWtDRmUyUktvM2dZ?=
 =?utf-8?B?MzRNMmJkWFB4UUh6YzY0MDZMSnJjMkVuczArZkR2eWxpeER0eklaYWswMHhF?=
 =?utf-8?B?VVhSY2VGTFg4ZXJycVV2ZG1hZWl3WktCMnRBbmRzaFcrN0tjZFFTSEp2OVlW?=
 =?utf-8?B?dW5hcVQ4WXVRWTNtM1hGdjhGSHZ5R3hCbjFndW5CNEM4MmxPeVNrNWU2STAy?=
 =?utf-8?B?blRxdnNONGwyU0t6cVg5MUdnekhJMVM1YVBzdHJ1ZHRpS1BiQ0tPYTVUU1Nx?=
 =?utf-8?B?d1dtbWtPTHpSWUxwS0MwSGRMNWZVTEVxNG9FbTlDS3NJSXJkY25oSkdpSnhl?=
 =?utf-8?B?cVhRL3NFOTBWLzJrdUxPdHdJYVpsUG1lZ2VRY1dFR2x0VHZrZFY1aFZPUVZW?=
 =?utf-8?B?anZ6aHlPK2p5QUlERWZ3TXByTmNwTjJpbTVuZTNsZjA2RUVRSmJZZnl2QUk0?=
 =?utf-8?Q?Paomh+v2pmHRRoaIKg9YWmQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc99fad-fe4d-43ce-36c8-08d9f1376731
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 10:30:50.8284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQDMQlF1tj0Q3EvqEB3b8KIHoIEtGqODoFmLczt//Crw014CfaRvU3Dkdq3phING3tvoeWNW01Ye3ZeYWY5ZbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6256
X-OriginatorOrg: citrix.com

Hello,

The following series provide a tentative implementation of extended
destination ID support for HVM/PVH guests. A specification for the
feature can be found at:

http://david.woodhou.se/15-bit-msi.pdf

Patch 4 is the one I'm having more doubts about: it's the best thing I
could come up in order for emulators to signal Xen whether they support
parsing the extended destination ID in MSI message address field. This
is only required for device models that support PCI passthrough:
injection of MSI interrupts from emulated devices is done using
XEN_DMOP_inject_msi which already passes the MSI address and data fields
to Xen for processing.

I think we should likely consider patch 1, as it would allow the OS side
of this to make progress (since it's an already present feature in other
hypervisors) independently of the Xen side work.

Thanks, Roger.

Roger Pau Monne (5):
  x86/cpuid: add CPUID flag for Extended Destination ID support
  xen/vioapic: add support for the extended destination ID field
  x86/vmsi: add support for extended destination ID in address field
  x86/ioreq: report extended destination ID support by emulators
  x86/cpuid: expose EXT_DEST_ID feature if supported

 docs/man/xl.cfg.5.pod.in               | 10 ++++++
 tools/include/libxl.h                  |  8 +++++
 tools/libs/light/libxl_create.c        |  6 ++++
 tools/libs/light/libxl_types.idl       |  1 +
 tools/libs/light/libxl_x86.c           | 12 +++++++
 tools/xl/xl_parse.c                    |  3 ++
 xen/arch/arm/ioreq.c                   |  5 +++
 xen/arch/x86/domain.c                  | 10 +++++-
 xen/arch/x86/hvm/ioreq.c               |  7 +++++
 xen/arch/x86/hvm/irq.c                 |  5 ++-
 xen/arch/x86/hvm/vioapic.c             |  3 ++
 xen/arch/x86/hvm/vmsi.c                | 43 +++++++++++++++++++-------
 xen/arch/x86/include/asm/domain.h      |  3 ++
 xen/arch/x86/include/asm/hvm/hvm.h     |  5 +--
 xen/arch/x86/include/asm/msi.h         |  7 +++++
 xen/arch/x86/setup.c                   |  1 +
 xen/arch/x86/traps.c                   |  3 ++
 xen/common/ioreq.c                     |  8 +++--
 xen/drivers/passthrough/x86/hvm.c      | 11 ++++++-
 xen/drivers/vpci/msi.c                 |  2 +-
 xen/include/public/arch-x86/cpuid.h    |  6 ++++
 xen/include/public/arch-x86/hvm/save.h |  4 ++-
 xen/include/public/arch-x86/xen.h      |  2 ++
 xen/include/public/domctl.h            |  3 +-
 xen/include/public/hvm/dm_op.h         |  6 +++-
 xen/include/xen/ioreq.h                |  2 ++
 xen/include/xen/vpci.h                 |  2 +-
 27 files changed, 153 insertions(+), 25 deletions(-)

-- 
2.34.1


