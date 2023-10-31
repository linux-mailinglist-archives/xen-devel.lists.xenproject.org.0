Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B27DCDBE
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:23:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625720.975341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoiQ-0005rN-W4; Tue, 31 Oct 2023 13:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625720.975341; Tue, 31 Oct 2023 13:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoiQ-0005mL-K8; Tue, 31 Oct 2023 13:23:30 +0000
Received: by outflank-mailman (input) for mailman id 625720;
 Tue, 31 Oct 2023 13:23:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1/u=GN=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qxoiO-0003rs-TU
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:23:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ac52eaf9-77f0-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 14:23:26 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C213C1474;
 Tue, 31 Oct 2023 06:24:07 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED7BF3F738;
 Tue, 31 Oct 2023 06:23:24 -0700 (PDT)
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
X-Inumbo-ID: ac52eaf9-77f0-11ee-9b0e-b553b5be7939
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH v2 7/8] xen: Add clang-format configuration
Date: Tue, 31 Oct 2023 13:23:03 +0000
Message-Id: <20231031132304.2573924-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031132304.2573924-1-luca.fancellu@arm.com>
References: <20231031132304.2573924-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a clang format configuration for the Xen Hypervisor.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/.clang-format | 693 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 693 insertions(+)
 create mode 100644 xen/.clang-format

diff --git a/xen/.clang-format b/xen/.clang-format
new file mode 100644
index 000000000000..7880709fe1fd
--- /dev/null
+++ b/xen/.clang-format
@@ -0,0 +1,693 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# clang-format configuration file. Intended for clang-format >= 15.
+#
+# For more information, see:
+#
+#   Documentation/process/clang-format.rst
+#   https://clang.llvm.org/docs/ClangFormat.html
+#   https://clang.llvm.org/docs/ClangFormatStyleOptions.html
+#
+---
+
+# [not specified]
+# Align function parameter that goes into a new line, under the open bracket
+# (supported in clang-format 3.8)
+AlignAfterOpenBracket: Align
+
+# [not specified]
+# Align array of struct's elements by column and justify
+# struct test demo[] =
+# {
+#     {56, 23,    "hello"},
+#     {-1, 93463, "world"},
+#     {7,  5,     "!!"   }
+# };
+# (supported in clang-format 13)
+AlignArrayOfStructures: Left
+
+# [not specified]
+# Align consecutive assignments (supported in clang-format 3.8)
+AlignConsecutiveAssignments:
+  Enabled: true
+  AcrossEmptyLines: true
+  AcrossComments: false
+
+# [not specified]
+# Do not align consecutive bit fields (supported in clang-format 11)
+AlignConsecutiveBitFields: None
+
+# [not specified]
+# Do not align values of consecutive declarations
+# (supported in clang-format 3.8)
+AlignConsecutiveDeclarations: None
+
+# [not specified]
+# Align values of consecutive macros (supported in clang-format 9)
+AlignConsecutiveMacros:
+  Enabled: true
+  AcrossEmptyLines: true
+  AcrossComments: true
+
+# [not specified]
+# Align escaped newlines to the right (supported in clang-format 5)
+AlignEscapedNewlines: Right
+
+# [not specified]
+# Aligns operands of a single expression that needs to be split over multiple
+# lines (supported in clang-format 3.5)
+AlignOperands: Align
+
+# Do not align trailing consecutive comments (It helps to make clang-format
+# reproduce the same output when it runs on an already formatted file)
+# (supported in clang-format 3.7)
+AlignTrailingComments: false
+
+# [not specified]
+# Do not put all function call arguments on a new line, try to have at least
+# the first one close to the opening parenthesis (supported in clang-format 9)
+AllowAllArgumentsOnNextLine: false
+
+# [not specified]
+# Do not put all function declaration parameters on a new line, try to have at
+# least the first one close to the opening parenthesis
+# (supported in clang-format 3.3)
+AllowAllParametersOfDeclarationOnNextLine: false
+
+# Bracing condition needs to be respected even if the line is so short that the
+# final block brace can stay on a single line
+# (supported in clang-format 3.5)
+AllowShortBlocksOnASingleLine: Never
+
+# (supported in clang-format 3.6)
+AllowShortCaseLabelsOnASingleLine: false
+
+# (supported in clang-format 3.5)
+AllowShortFunctionsOnASingleLine: None
+
+# (supported in clang-format 3.3)
+AllowShortIfStatementsOnASingleLine: Never
+
+# (supported in clang-format 3.7)
+AllowShortLoopsOnASingleLine: false
+
+# [not specified]
+# Do not add a break after the definition return type
+# (supported in clang-format 3.8)
+AlwaysBreakAfterReturnType: None
+
+# [not specified]
+# There is no need to use a break after an assigment to a multiline string
+# (supported in clang-format 3.4)
+AlwaysBreakBeforeMultilineStrings: false
+
+# (supported in clang-format 3.4)
+AlwaysBreakTemplateDeclarations: false
+
+# Specify Xen's macro attributes (supported in clang-format 12)
+AttributeMacros:
+  - '__init'
+  - '__exit'
+  - '__initdata'
+  - '__initconst'
+  - '__initconstrel'
+  - '__initdata_cf_clobber'
+  - '__initconst_cf_clobber'
+  - '__hwdom_init'
+  - '__hwdom_initdata'
+  - '__maybe_unused'
+  - '__packed'
+  - '__stdcall'
+  - '__vfp_aligned'
+  - '__alt_call_maybe_initdata'
+  - '__cacheline_aligned'
+  - '__ro_after_init'
+  - 'always_inline'
+  - 'noinline'
+  - 'noreturn'
+  - '__weak'
+  - '__inline__'
+  - '__attribute_const__'
+  - '__transparent__'
+  - '__used'
+  - '__must_check'
+  - '__kprobes'
+
+# [not specified]
+# Try always to pack function call arguments on the same line before breaking
+# (supported in clang-format 3.7)
+BinPackArguments: true
+
+# [not specified]
+# Try always to pack function declaration parameters on the same line before
+# breaking (supported in clang-format 3.7)
+BinPackParameters: true
+
+# [not specified]
+# Do not add a spaces on bitfield 'unsigned bf:2;'
+# (supported in clang-format 12)
+BitFieldColonSpacing: None
+
+# Xen's coding style does not follow clang-format already available profiles for
+# breaking before braces, so set it to Custom and specify each case separately
+# (supported in clang-format 3.8)
+BraceWrapping:
+  # Braces ('{' and '}') are usually placed on a line of their own
+  AfterCaseLabel: true
+  AfterFunction: true
+  BeforeElse: true
+  AfterExternBlock: true
+  # except for the opening brace in definitions of enum, struct, and union
+  AfterEnum: false
+  AfterStruct: false
+  AfterUnion: false
+  # This is unlike the Linux coding style and unlike K&R.
+  #
+  # if ( condition )
+  # {
+  #     /* Do stuff. */
+  # }
+  # else
+  # {
+  #     /* Other stuff. */
+  # }
+  #
+  # while ( condition )
+  # {
+  #     /* Do stuff. */
+  # }
+  #
+  # [non-compliant]
+  # do-while is not compliant with CODING_STYLE because clang format doesn't
+  # support different styles for every control statement
+  # do
+  # {
+  #     /* Do stuff. */
+  # } while ( condition );
+  AfterControlStatement: Always
+  BeforeWhile: false
+  IndentBraces: false
+  # [not specified]
+  # Keep empty functions with braces style like this: 'void func() {}' instead
+  # of breaking the braces
+  SplitEmptyFunction: false
+  # Not related to C language, but specified for completeness
+  AfterClass: false
+  AfterNamespace: false
+  AfterObjCDeclaration: false
+  BeforeCatch: false
+  BeforeLambdaBody: false
+  SplitEmptyRecord: true
+  SplitEmptyNamespace: true
+
+# [not specified]
+# Break only after the operator in case of a long expression
+# (supported in clang-format 3.6)
+BreakBeforeBinaryOperators: None
+
+# Xen's coding style does not follow clang-format already available profiles for
+# breaking before braces, so set it to Custom and specify each case separately
+# (supported in clang-format 3.7)
+BreakBeforeBraces: Custom
+
+# [not specified]
+# Break before inline ASM colon if the line length is longer than column limit.
+# (This is a new feature upstreamed by EPAM during its work on clang-format for
+# Xen)
+# (supported in clang-format 16)
+# BreakBeforeInlineASMColon: OnlyMultiline
+
+# [not specified]
+# Ternary operators '?, :' can be put after a line break
+# (supported in clang-format 3.7)
+BreakBeforeTernaryOperators: true
+
+# (supported in clang-format 5)
+BreakConstructorInitializers: BeforeComma
+
+# User visible strings (e.g., printk() messages) should not be split so they can
+# be searched for more easily. (supported in clang-format 3.9)
+BreakStringLiterals: false
+
+# Lines should be less than 80 characters in length
+# (supported in clang-format 3.7)
+ColumnLimit: 80
+
+# (supported in clang-format 3.7)
+CommentPragmas: '^ IWYU pragma:'
+
+# Code within blocks is indented by one extra indent level
+# (supported in clang-format 3.7)
+ContinuationIndentWidth: 4
+
+# Do not derive pointer alignment style from the file
+# (supported in clang-format 3.7)
+DerivePointerAlignment: false
+
+# Taken from:
+# git grep -h -i '^#define [^[:space:]]*for_each[^[:space:]]*(' xen/ \
+# | sed "s,^#define \([^[:space:]]*for_each[^[:space:]]*\)(.*$,  - '\1',i" \
+# | LC_ALL=C sort -u
+# A vector of macros that should be interpreted as foreach loops instead of as
+# function calls.
+# (supported in clang-format 3.7)
+ForEachMacros:
+  - 'FOR_EACH_IOREQ_SERVER'
+  - '__list_for_each_rcu'
+  - 'dt_for_each_child_node'
+  - 'dt_for_each_device_node'
+  - 'dt_for_each_property_node'
+  - 'ebitmap_for_each_positive_bit'
+  - 'expr_list_for_each_sym'
+  - 'fdt_for_each_property_offset'
+  - 'fdt_for_each_subnode'
+  - 'for_each_affinity_balance_step'
+  - 'for_each_amd_iommu'
+  - 'for_each_cfg_sme'
+  - 'for_each_cpu'
+  - 'for_each_domain'
+  - 'for_each_domain_in_cpupool'
+  - 'for_each_drhd_unit'
+  - 'for_each_kimage_entry'
+  - 'for_each_node_mask'
+  - 'for_each_online_cpu'
+  - 'for_each_online_node'
+  - 'for_each_pdev'
+  - 'for_each_possible_cpu'
+  - 'for_each_present_cpu'
+  - 'for_each_rmrr_device'
+  - 'for_each_sched_unit'
+  - 'for_each_sched_unit_vcpu'
+  - 'for_each_set_bit'
+  - 'for_each_vcpu'
+  - 'for_each_vp'
+  - 'hlist_for_each'
+  - 'hlist_for_each_entry'
+  - 'hlist_for_each_entry_continue'
+  - 'hlist_for_each_entry_from'
+  - 'hlist_for_each_entry_rcu'
+  - 'hlist_for_each_entry_safe'
+  - 'hlist_for_each_safe'
+  - 'list_for_each'
+  - 'list_for_each_backwards_safe'
+  - 'list_for_each_continue_rcu'
+  - 'list_for_each_entry'
+  - 'list_for_each_entry_continue'
+  - 'list_for_each_entry_from'
+  - 'list_for_each_entry_rcu'
+  - 'list_for_each_entry_reverse'
+  - 'list_for_each_entry_safe'
+  - 'list_for_each_entry_safe_continue'
+  - 'list_for_each_entry_safe_from'
+  - 'list_for_each_entry_safe_reverse'
+  - 'list_for_each_prev'
+  - 'list_for_each_rcu'
+  - 'list_for_each_safe'
+  - 'list_for_each_safe_rcu'
+  - 'page_list_for_each'
+  - 'page_list_for_each_safe'
+  - 'page_list_for_each_safe_reverse'
+
+# A vector of macros that should be interpreted as conditionals instead of as
+# function calls. (supported in clang-format 13)
+#IfMacros:
+#  - ''
+
+# Sort include files by block of includes and not as only one group
+# (supported in clang-format 6)
+IncludeBlocks: Preserve
+
+# [not specified]
+# Regular expressions denoting the different #include categories used for
+# ordering #includes. (supported in clang-format 3.8)
+#IncludeCategories:
+#  - Regex: '.*'
+#    Priority: 1
+
+# When guessing whether a #include is the “main” include (to assign category 0,
+# see above), use this regex of allowed suffixes to the header stem. A partial
+# match is done, so that: - “” means “arbitrary suffix” - “$” means “no suffix”
+# For example, if configured to “(_test)?$”, then a header a.h would be seen as
+# the “main” include in both a.cc and a_test.cc.
+# (Do we have a main include in Xen?)
+# (supported in clang-format 3.9)
+#IncludeIsMainRegex: '(Test)?$'
+
+# Non-case labels inside switch() bodies are preferred to be indented the same
+# as the block's case labels (supported in clang-format 11)
+IndentCaseBlocks: false
+
+# [not specified]
+# Do not indent case labels in the switch block (supported in clang-format 3.3)
+IndentCaseLabels: false
+
+# [not specified]
+# Do not indent extern "C" block
+# (supported in clang-format 11)
+IndentExternBlock: NoIndent
+
+# Due to the behavior of GNU diffutils "diff -p", labels should be indented by
+# at least one blank (supported in clang-format 10)
+IndentGotoLabels: true
+
+# [not specified]
+# Do not create indentation for the preprocessor directives
+# (supported in clang-format 6)
+IndentPPDirectives: None
+
+# An indent level consists of four spaces (supported in clang-format 3.7)
+IndentWidth: 4
+
+# [not specified]
+# In case a function definition or declaration needs to be wrapped after the
+# type, do not indent the new line (supported in clang-format 3.7)
+IndentWrappedFunctionNames: false
+
+# Braces should be omitted for blocks with a single statement. e.g.,
+# if ( condition )
+#     single_statement();
+# (supported in clang-format 15)
+InsertBraces: false
+
+# [not specified]
+# Every file needs to end with a new line
+# (supported in clang-format 16)
+# InsertNewlineAtEOF: true
+
+# [not specified]
+# Keep empty lines (up to MaxEmptyLinesToKeep) at end of file
+# (supported in clang-format 17)
+# KeepEmptyLinesAtEOF: true
+
+# [not specified]
+# Do not add a new empty line at the start of the block
+# (supported in clang-format 3.7)
+KeepEmptyLinesAtTheStartOfBlocks: false
+
+# The Xen Hypervisor is written in C language (supported in clang-format 3.5)
+Language: Cpp
+
+# [not specified]
+# Line ending style is '\n' (supported in clang-format 16)
+# LineEnding: LF
+
+# Specify Xen's macro that starts a block of code
+# (supported in clang-format 3.7)
+MacroBlockBegin: '^PLATFORM_START|^DT_DEVICE_START|^ACPI_DEVICE_START'
+
+# Specify Xen's macro that ends a block of code (supported in clang-format 3.7)
+MacroBlockEnd: '^PLATFORM_END|^DT_DEVICE_END|^ACPI_DEVICE_END'
+
+# [not specified]
+# Maximum consecutive empty lines allowed (supported in clang-format 3.7)
+MaxEmptyLinesToKeep: 1
+
+# Parameters to tweak to discourage clang-format to break something
+# (supported in clang-format 5)
+PenaltyBreakAssignment: 30
+# (supported in clang-format 3.7)
+PenaltyBreakBeforeFirstCallParameter: 30
+# (supported in clang-format 3.7)
+PenaltyBreakComment: 10
+# (supported in clang-format 3.7)
+PenaltyBreakFirstLessLess: 0
+# (supported in clang-format 14)
+PenaltyBreakOpenParenthesis: 100
+# (supported in clang-format 3.7)
+PenaltyBreakString: 10
+# (supported in clang-format 3.7)
+PenaltyExcessCharacter: 100
+# (supported in clang-format 12)
+PenaltyIndentedWhitespace: 0
+# (supported in clang-format 3.7)
+PenaltyReturnTypeOnItsOwnLine: 60
+
+# [not specified]
+# Pointer alignment style is on the right 'void *var'
+# (supported in clang-format 3.7)
+PointerAlignment: Right
+
+# [not specified]
+# The number of columns to use for indentation of preprocessor statements
+# When set to -1 (default) IndentWidth is used also for preprocessor statements.
+# (supported in clang-format 13)
+PPIndentWidth: -1
+
+# [not specified]
+# (supported in clang-format 14)
+QualifierAlignment: Custom
+
+# Specify in which order the qualifiers should appear 'static const int *var'
+# (supported in clang-format 14)
+QualifierOrder: ['static', 'inline', 'const', 'volatile', 'type']
+
+# Don't try to reflow comments to respect the column limit (It helps to make
+# clang-format reproduce the same output when it runs on an already formatted
+# file)
+# (supported in clang-format 3.8)
+ReflowComments: false
+
+# [not specified]
+# Specifies the use of empty lines to separate definition blocks, including
+# structs, enums, and functions
+# (supported in clang-format 14)
+SeparateDefinitionBlocks: Always
+
+# [not specified]
+# Sort the include files by name (supported in clang-format 3.8)
+# TODO: enabling this will currently break the compilation, maybe fix?
+SortIncludes: Never
+
+# [not specified]
+# Do not allow a space after a type cast '(type)var'
+# (supported in clang-format 3.5)
+SpaceAfterCStyleCast: false
+
+# [not specified]
+# Do not allow a space after the not operator '!var'
+# (supported in clang-format 9)
+SpaceAfterLogicalNot: false
+
+# Ensure that there is a space after pointer qualifiers, when used with
+# PointerAlignment of value Right it means 'void *const *x = NULL;'
+# (supported in clang-format 12)
+SpaceAroundPointerQualifiers: After
+
+# [not specified]
+# Always have a space after an assign operator or a compound operator, for
+# example '+=' (supported in clang-format 3.7)
+SpaceBeforeAssignmentOperators: true
+
+# [not specified]
+# Do not allow a space between the case argument and the final colon 'case 0:'
+# (supported in clang-format 12)
+SpaceBeforeCaseColon: false
+
+# [not specified]
+# Have a space before the parenthesis of a control statement, do an exception
+# for ForEach and If macros
+SpaceBeforeParens: ControlStatementsExceptForEachMacros
+
+# (supported in clang-format 7)
+SpaceBeforeRangeBasedForLoopColon: true
+
+# [not specified]
+# Do not add a spaces before square brackets 'int a[5];'
+# (supported in clang-format 10)
+SpaceBeforeSquareBrackets: false
+
+# [not specified]
+# Do not add a space inside empty parenthesis '()'
+# (supported in clang-format 3.7)
+SpaceInEmptyParentheses: false
+
+# (supported in clang-format 3.7)
+SpacesBeforeTrailingComments: 1
+
+# Space characters are used to spread out logical statements, such as in the
+# condition of an if or while 'if ( a )' 'while ( i < 5 )'
+# (supported in clang-format 10)
+SpacesInConditionalStatement: true
+
+# (supported in clang-format 3.7)
+SpacesInContainerLiterals: false
+
+# [not specified]
+# Do not add a spaces inside a type cast parenthesis '(int)var'
+# (supported in clang-format 3.7)
+SpacesInCStyleCastParentheses: false
+
+# [not specified]
+# Do not insert spaces in empty block '{}'
+# (supported in clang-format 3.5)
+SpaceInEmptyBlock: false
+
+# Only one space is allowed at the start of a line comment
+# (supported in clang-format 13)
+SpacesInLineCommentPrefix:
+  Minimum: 1
+  Maximum: -1
+
+# [not specified]
+# Do not add a spaces inside parenthesis '(var & var)'
+# (supported in clang-format 3.7)
+SpacesInParentheses: false
+
+# [not specified]
+# Do not add spaces inside square brakets 'int a[5];'
+# (supported in clang-format 3.7)
+SpacesInSquareBrackets: false
+
+# (supported in clang-format 3.7)
+Standard: C++03
+
+# Macros which are ignored in front of a statement, as if they were an
+# attribute. So that they are not parsed as identifier
+# (supported in clang-format 12)
+# StatementAttributeLikeMacros: ['']
+
+# A vector of macros that should be interpreted as complete statements.
+# Typical macros are expressions, and require a semi-colon to be added;
+# sometimes this is not the case, and this allows to make clang-format aware of
+# such cases. (supported in clang-format 8)
+StatementMacros:
+  - 'PROGRESS'
+  - 'PROGRESS_VCPU'
+  - 'bitop'
+  - 'guest_bitop'
+  - 'testop'
+  - 'guest_testop'
+  - 'DEFINE_XEN_GUEST_HANDLE'
+  - '__DEFINE_XEN_GUEST_HANDLE'
+  - '___DEFINE_XEN_GUEST_HANDLE'
+  - 'presmp_initcall'
+  - '__initcall'
+  - '__exitcall'
+
+# An indent level consists of four spaces (supported in clang-format 3.7)
+TabWidth: 4
+
+# A vector of macros that should be interpreted as type declarations instead of
+# as function calls (supported in clang-format 9)
+TypenameMacros:
+  - 'XEN_GUEST_HANDLE'
+  - 'XEN_GUEST_HANDLE_64'
+  - 'XEN_GUEST_HANDLE_PARAM'
+  - 'ELF_HANDLE_DECL'
+
+# Indentation is done using spaces, not tabs (supported in clang-format 3.7)
+UseTab: Never
+
+# A vector of macros which are whitespace-sensitive and should not be touched
+# (supported in clang-format 11)
+WhitespaceSensitiveMacros:
+  - '__stringify'
+
+## Not related to C language ###################################################
+
+# (supported in clang-format 3.3)
+AccessModifierOffset: -4
+
+# (supported in clang-format 9)
+AllowShortLambdasOnASingleLine: None
+
+# (supported in clang-format 16)
+# BreakAfterAttributes: Never
+
+# (supported in clang-format 3.8)
+BreakAfterJavaFieldAnnotations: false
+
+# (supported in clang-format 16)
+# BreakArrays: false
+
+# (supported in clang-format 12)
+BreakBeforeConceptDeclarations: Never
+
+# (supported in clang-format 7)
+BreakInheritanceList: BeforeColon
+
+# (supported in clang-format 5)
+CompactNamespaces: false
+
+# (supported in clang-format 3.7)
+ConstructorInitializerAllOnOneLineOrOnePerLine: false
+
+# (supported in clang-format 3.7)
+ConstructorInitializerIndentWidth: 4
+
+# (supported in clang-format 3.4)
+Cpp11BracedListStyle: false
+
+# (supported in clang-format 13)
+EmptyLineAfterAccessModifier: Leave
+
+# (supported in clang-format 12)
+EmptyLineBeforeAccessModifier: Leave
+
+# (supported in clang-format 5)
+FixNamespaceComments: false
+
+# (supported in clang-format 13)
+IndentAccessModifiers: false
+
+# (supported in clang-format 15)
+IndentRequiresClause: false
+
+# (supported in clang-format 11)
+InsertTrailingCommas: None
+
+# (supported in clang-format 3.9)
+JavaScriptQuotes: Leave
+
+# (supported in clang-format 3.9)
+JavaScriptWrapImports: true
+
+# (supported in clang-format 3.7)
+NamespaceIndentation: None
+
+# (supported in clang-format 7)
+ObjCBinPackProtocolList: Auto
+
+# (supported in clang-format 3.7)
+ObjCBlockIndentWidth: 4
+
+# (supported in clang-format 11)
+ObjCBreakBeforeNestedBlockParam: false
+
+# (supported in clang-format 3.7)
+ObjCSpaceAfterProperty: true
+
+# (supported in clang-format 3.7)
+ObjCSpaceBeforeProtocolList: true
+
+# (supported in clang-format 14)
+PackConstructorInitializers: Never
+
+# (supported in clang-format 7)
+PenaltyBreakTemplateDeclaration: 0
+
+# (supported in clang-format 13)
+ReferenceAlignment: Right
+
+# (supported in clang-format 16)
+# RemoveSemicolon: false
+
+# (supported in clang-format 5)
+SortUsingDeclarations: false
+
+# (supported in clang-format 4)
+SpaceAfterTemplateKeyword: true
+
+# (supported in clang-format 7)
+SpaceBeforeCpp11BracedList: false
+
+# (supported in clang-format 7)
+SpaceBeforeCtorInitializerColon: false
+
+# (supported in clang-format 7)
+SpaceBeforeInheritanceColon: true
+
+# (supported in clang-format 3.4)
+SpacesInAngles: false
+
+...
-- 
2.34.1


